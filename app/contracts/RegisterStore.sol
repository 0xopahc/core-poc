// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
//unit256 initial_onwer =  msg.sender();
abstract contract StoreRegistry is Ownable {
    // Mapping to track registered store wallets
    mapping(address => bool) public registeredStores;

    // Mapping to store metadata (optional, for platform integration)
    mapping(address => string) public storeMetadata; 
    // Events for logging
    event StoreRegistered(address indexed storeWallet, string metadata);
    event StoreRemoved(address indexed storeWallet);

    constructor() {
        // Owner is msg.sender (admin who can manage stores)
    }

    // Register a new store wallet
    function registerStore(
        address _storeWallet,
        string memory _metadata
    ) external onlyOwner {
        require(_storeWallet != address(0), "Invalid store wallet");
        require(!registeredStores[_storeWallet], "Store already registered");

        registeredStores[_storeWallet] = true;
        storeMetadata[_storeWallet] = _metadata;

        emit StoreRegistered(_storeWallet, _metadata);
    }

    // Remove a store wallet
    function removeStore(address _storeWallet) external onlyOwner {
        require(registeredStores[_storeWallet], "Store not registered");

        registeredStores[_storeWallet] = false;
        delete storeMetadata[_storeWallet];

        emit StoreRemoved(_storeWallet);
    }

    // Check if a wallet is a registered store
    function isRegisteredStore(
        address _storeWallet
    ) external view returns (bool) {
        return registeredStores[_storeWallet];
    }
}
