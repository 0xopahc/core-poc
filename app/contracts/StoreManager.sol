// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;
import "./RegisterStore.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract UserManagedStoreRegistry is StoreRegistry {
    // Mapping to track the owner/creator of each store wallet
    mapping(address => address) public storeOwner;

    // Event for metadata updates
    event StoreMetadataUpdated(address indexed storeWallet, string newMetadata);

    constructor() StoreRegistry() {}  // Inherit constructor behavior

    // Allow any user to register their own store wallet
    function registerStore(
        address _storeWallet,
        string memory _metadata
    ) external override {
        require(_storeWallet != address(0), "Invalid store wallet");
        require(!registeredStores[_storeWallet], "Store already registered");
        require(storeOwner[_storeWallet] == address(0), "Store already owned");

        registeredStores[_storeWallet] = true;
        storeMetadata[_storeWallet] = _metadata;
        storeOwner[_storeWallet] = msg.sender;  // Set caller as owner

        emit StoreRegistered(_storeWallet, _metadata);
    }

    // Allow store owner to update metadata
    function updateStoreMetadata(
        address _storeWallet,
        string memory _newMetadata
    ) external {
        require(registeredStores[_storeWallet], "Store not registered");
        require(storeOwner[_storeWallet] == msg.sender, "Not the store owner");

        storeMetadata[_storeWallet] = _newMetadata;

        emit StoreMetadataUpdated(_storeWallet, _newMetadata);
    }

    // Allow store owner to remove their own store
    function removeMyStore(address _storeWallet) external {
        require(registeredStores[_storeWallet], "Store not registered");
        require(storeOwner[_storeWallet] == msg.sender, "Not the store owner");

        registeredStores[_storeWallet] = false;
        delete storeMetadata[_storeWallet];
        delete storeOwner[_storeWallet];

        emit StoreRemoved(_storeWallet);
    }

    // Admin override: Remove any store (for compliance)
    function removeStore(address _storeWallet) external override onlyOwner {
        require(registeredStores[_storeWallet], "Store not registered");

        registeredStores[_storeWallet] = false;
        delete storeMetadata[_storeWallet];
        delete storeOwner[_storeWallet];

        emit StoreRemoved(_storeWallet);
    }

    // Check the owner of a store
    function getStoreOwner(address _storeWallet) external view returns (address) {
        return storeOwner[_storeWallet];
    }
}
