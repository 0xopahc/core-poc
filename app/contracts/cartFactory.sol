// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract CartFactory {

  // New struct for JSON-like item objects
  struct Item {
    uint id;
    string name;      // Item code from API (e.g., Dutchie)
    uint quantity; // How many of this item
    uint price;    // Price per unit (in wei or smallest unit)
    // Add more fields as needed, e.g., string name;
  }
// [
//     [1, "dab", 2, 6000],  
//     [2, "flow", 1, 6059], 
//     [3, "ext", 5, 5500]   
// ]
  struct Order {
    Item[] items; // Now an array of structured Item objects (JSON-like)
    uint256 total; // dutchie/aero will need to pass their 'Grand total'. represents ammount owed in usdc/pyusd
    address customer; // Automatically set to msg.sender
    address storeWallet;
  }

  // store orders
  mapping (uint => Order) public orders;
  // Create a counter to keep track of order IDs
  uint public orderCount;

  // Updated function: Uses msg.sender for customer, and Item[] for items
  function addOrder( Item[] memory _items, uint256 _total, address _storeWallet) public {
    uint newOrderId = orderCount;
    orderCount++;

    // Assign fields one by one
    orders[newOrderId].total = _total;
    orders[newOrderId].customer = msg.sender;
    orders[newOrderId].storeWallet = _storeWallet;

    // Copy items manually (requires a loop)
    for (uint i = 0; i < _items.length; i++) {
        orders[newOrderId].items.push(_items[i]);
    }
  }
}
