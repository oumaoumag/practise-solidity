// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductRegistration {
    // Struct to store product details
    struct Product {
        uint256 productId;
        address farmer;
        string name;
        uint256 quantity;
        uint256 price;
        string qualityCertifications;
        string batchInformation;
        uint256 registrationTimestamp;
    }

    // Mapping to store products by their unique ID
    mapping(uint256 => Product) public products;
    
    // Mapping to track products owned by each farmer
    mapping(address => uint256[]) public farmerProducts;
    
    // Counter to generate unique product IDs
    uint256 private productIdCounter;

    // Events for tracking product registration and updates
    event ProductRegistered(
        uint256 indexed productId, 
        address indexed farmer, 
        string name, 
        uint256 quantity
    );

    event ProductUpdated(
        uint256 indexed productId, 
        uint256 newQuantity
    );

    // Modifier to ensure only the product owner can update
    modifier onlyProductOwner(uint256 _productId) {
        require(
            products[_productId].farmer == msg.sender, 
            "Only the product owner can update the product"
        );
        _;
    }

    /**
     * @dev Registers a new dairy product on the blockchain
     * @param _name Name of the product
     * @param _quantity Initial quantity of the product
     * @param _price Price of the product
     * @param _qualityCertifications Quality certifications for the product
     * @param _batchInformation Batch-specific information
     * @return productId Unique identifier for the registered product
     */
    function registerProduct(
        string memory _name,
        uint256 _quantity,
        uint256 _price,
        string memory _qualityCertifications,
        string memory _batchInformation
    ) public returns (uint256) {
        // Generate a unique product ID using a hash
        uint256 productId = uint256(keccak256(abi.encodePacked(
            block.timestamp, 
            msg.sender, 
            productIdCounter++
        )));

        // Create the product
        Product memory newProduct = Product({
            productId: productId,
            farmer: msg.sender,
            name: _name,
            quantity: _quantity,
            price: _price,
            qualityCertifications: _qualityCertifications,
            batchInformation: _batchInformation,
            registrationTimestamp: block.timestamp
        });

        // Store the product
        products[productId] = newProduct;
        
        // Track products by farmer
        farmerProducts[msg.sender].push(productId);

        // Emit event
        emit ProductRegistered(productId, msg.sender, _name, _quantity);

        return productId;
    }

    /**
     * @dev Updates the quantity of an existing product
     * @param _productId Unique identifier of the product
     * @param _newQuantity Updated quantity of the product
     */
    function updateProduct(
        uint256 _productId, 
        uint256 _newQuantity
    ) public onlyProductOwner(_productId) {
        // Update the product quantity
        products[_productId].quantity = _newQuantity;

        // Emit update event
        emit ProductUpdated(_productId, _newQuantity);
    }

    /**
     * @dev Retrieves details of a specific product
     * @param _productId Unique identifier of the product
     * @return Product details
     */
    function getProductDetails(uint256 _productId) 
        public 
        view 
        returns (Product memory) 
    {
        require(
            products[_productId].productId != 0, 
            "Product does not exist"
        );
        return products[_productId];
    }

    /**
     * @dev Retrieves all product IDs registered by a specific farmer
     * @param _farmer Address of the farmer
     * @return Array of product IDs
     */
    function getFarmerProducts(address _farmer) 
        public 
        view 
        returns (uint256[] memory) 
    {
        return farmerProducts[_farmer];
    }
}