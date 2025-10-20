// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;
// Import OpenZeppelin contracts for security and standards
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
// Assuming OrderFactory is deployed separately; we'll interface with it
interface IOrderFactory {
    struct Order {
        // ... (match your Order struct from CartFactory.sol)
        Item[] items;
        uint256 total;
        address customer;
        address storeWallet;
    }

    struct Item {
        uint id;
        string name;
        uint quantity;
        uint price;
    }

    function orders(uint256) external view returns (Order memory);
    function orderCount() external view returns (uint256);

    // We'll add these functions to your OrderFactory later for status management
    function updateOrderStatus(uint256 orderId, uint8 newStatus) external;
    function getOrderStatus(uint256 orderId) external view returns (uint8);
}

abstract contract PaymentEscrow is Ownable, ReentrancyGuard {
    IERC20 public paymentToken; // ERC20 token like USDC or PYUSD
    IOrderFactory public orderFactory; // Reference to the deployed OrderFactory contract

    // Enum for order statuses (add this to OrderFactory too)
    enum OrderStatus {
        Pending,
        Paid,
        Fulfilled,
        Cancelled,
        Refunded
    }

    // Mapping to track escrowed amounts per order
    mapping(uint256 => uint256) public escrowedAmounts;

    // Events for logging
    event PaymentDeposited(
        uint256 indexed orderId,
        address customer,
        uint256 amount
    );
    event FundsReleased(
        uint256 indexed orderId,
        address storeWallet,
        uint256 amount
    );
    event RefundIssued(
        uint256 indexed orderId,
        address customer,
        uint256 amount
    );
    event TokenUpdated(address newToken);

    constructor(address _paymentToken, address _orderFactory) {
        paymentToken = IERC20(_paymentToken);
        orderFactory = IOrderFactory(_orderFactory);
    }

    // Function to update the payment token (e.g., switch from USDC to PYUSD) - only owner
    function updatePaymentToken(address _newToken) external onlyOwner {
        paymentToken = IERC20(_newToken);
        emit TokenUpdated(_newToken);
    }

    // Customer deposits payment into escrow
    function depositPayment(uint256 orderId) external nonReentrant {
        IOrderFactory.Order memory order = orderFactory.orders(orderId);
        require(order.customer == msg.sender, "Only customer can deposit");
        require(order.total > 0, "Invalid order");
        require(escrowedAmounts[orderId] == 0, "Already paid"); // Prevent double payment
        require(
            orderFactory.getOrderStatus(orderId) == uint8(OrderStatus.Pending),
            "Order not pending"
        );

        // Transfer tokens from customer to this contract
        bool success = paymentToken.transferFrom(
            msg.sender,
            address(this),
            order.total
        );
        require(success, "Token transfer failed");

        escrowedAmounts[orderId] = order.total;
        orderFactory.updateOrderStatus(orderId, uint8(OrderStatus.Paid));

        emit PaymentDeposited(orderId, msg.sender, order.total);
    }

    // Store releases funds after pickup confirmation
    function releaseFunds(uint256 orderId) external nonReentrant {
        IOrderFactory.Order memory order = orderFactory.orders(orderId);
        require(order.storeWallet == msg.sender, "Only store can release");
        uint256 amount = escrowedAmounts[orderId];
        require(amount > 0, "No funds escrowed");
        require(
            orderFactory.getOrderStatus(orderId) == uint8(OrderStatus.Paid),
            "Order not paid"
        );

        // Transfer to store
        bool success = paymentToken.transfer(order.storeWallet, amount);
        require(success, "Token transfer failed");

        escrowedAmounts[orderId] = 0;
        orderFactory.updateOrderStatus(orderId, uint8(OrderStatus.Fulfilled));

        emit FundsReleased(orderId, order.storeWallet, amount);
    }

    // Refund function (callable by customer if not fulfilled within a timeout, or by store/owner)
    function refund(uint256 orderId) external nonReentrant {
        IOrderFactory.Order memory order = orderFactory.orders(orderId);
        // Simple logic: Customer can refund if Paid but not Fulfilled (add timeout in prod)
        require(
            msg.sender == order.customer ||
                msg.sender == order.storeWallet ||
                msg.sender == owner(),
            "Unauthorized"
        );
        uint256 amount = escrowedAmounts[orderId];
        require(amount > 0, "No funds escrowed");
        require(
            orderFactory.getOrderStatus(orderId) == uint8(OrderStatus.Paid),
            "Invalid status for refund"
        );

        // Transfer back to customer
        bool success = paymentToken.transfer(order.customer, amount);
        require(success, "Token transfer failed");

        escrowedAmounts[orderId] = 0;
        orderFactory.updateOrderStatus(orderId, uint8(OrderStatus.Refunded));

        emit RefundIssued(orderId, order.customer, amount);
    }

    // Emergency withdraw for owner (in case of issues)
    function emergencyWithdraw(uint256 amount) external onlyOwner {
        bool success = paymentToken.transfer(owner(), amount);
        require(success, "Withdrawal failed");
    }
}
