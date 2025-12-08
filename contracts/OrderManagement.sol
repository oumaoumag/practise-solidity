// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrderManagement {
    // Enum to track order status
    enum OrderStatus {
        Pending,
        Paid,
        Shipped,
        Delivered,
        Cancelled
    }

    // Struct to store order details
    struct Order {
        uint256 orderId;
        address consumer;
        address farmer;
        uint256 productId;
        uint256 quantity;
        uint256 totalPrice;
        OrderStatus status;
        uint256 createdAt;
        uint256 updatedAt;
    }

    // Mapping to store orders
    mapping(uint256 => Order) public orders;
    
    // Mapping to track orders by consumer
    mapping(address => uint256[]) public consumerOrders;
    
    // Mapping to track orders by farmer
    mapping(address => uint256[]) public farmerOrders;

    // Counter to generate unique order IDs
    uint256 private orderIdCounter;

    // Events for order lifecycle
    event OrderCreated(
        uint256 indexed orderId, 
        address indexed consumer, 
        address indexed farmer, 
        uint256 productId, 
        uint256 quantity
    );

    event OrderPaid(
        uint256 indexed orderId, 
        uint256 amount
    );

    event OrderStatusUpdated(
        uint256 indexed orderId, 
        OrderStatus newStatus
    );

    // Escrow account to hold funds
    address public escrowAccount;

    constructor() {
        escrowAccount = msg.sender;
    }

    /**
     * @dev Creates a new order
     * @param _productId ID of the product being ordered
     * @param _quantity Quantity of the product
     * @param _farmer Address of the farmer selling the product
     * @param _totalPrice Total price of the order
     * @return orderId Unique identifier for the created order
     */
    function createOrder(
        uint256 _productId, 
        uint256 _quantity, 
        address _farmer, 
        uint256 _totalPrice
    ) public payable returns (uint256) {
        require(msg.value >= _totalPrice, "Insufficient payment");

        // Generate unique order ID
        uint256 orderId = uint256(keccak256(abi.encodePacked(
            block.timestamp, 
            msg.sender, 
            orderIdCounter++
        )));

        // Create the order
        Order memory newOrder = Order({
            orderId: orderId,
            consumer: msg.sender,
            farmer: _farmer,
            productId: _productId,
            quantity: _quantity,
            totalPrice: _totalPrice,
            status: OrderStatus.Pending,
            createdAt: block.timestamp,
            updatedAt: block.timestamp
        });

        // Store the order
        orders[orderId] = newOrder;
        
        // Track orders by consumer and farmer
        consumerOrders[msg.sender].push(orderId);
        farmerOrders[_farmer].push(orderId);

        // Emit event
        emit OrderCreated(orderId, msg.sender, _farmer, _productId, _quantity);

        return orderId;
    }

    /**
     * @dev Confirms payment and locks funds in escrow
     * @param _orderId Unique identifier of the order
     */
    function confirmPayment(uint256 _orderId) public payable {
        Order storage order = orders[_orderId];
        
        require(order.consumer == msg.sender, "Only consumer can confirm payment");
        require(order.status == OrderStatus.Pending, "Invalid order status");
        require(msg.value >= order.totalPrice, "Insufficient payment");

        // Update order status
        order.status = OrderStatus.Paid;
        order.updatedAt = block.timestamp;

        // Emit event
        emit OrderPaid(_orderId, order.totalPrice);
        emit OrderStatusUpdated(_orderId, OrderStatus.Paid);
    }

    /**
     * @dev Updates order status
     * @param _orderId Unique identifier of the order
     * @param _newStatus New status of the order
     */
    function updateOrderStatus(
        uint256 _orderId, 
        OrderStatus _newStatus
    ) public {
        Order storage order = orders[_orderId];
        
        // Ensure only farmer or a designated delivery service can update status
        require(
            order.farmer == msg.sender, 
            "Only farmer can update order status"
        );

        // Validate status progression
        require(
            _newStatus > order.status, 
            "Cannot revert to previous status"
        );

        // Update order status
        order.status = _newStatus;
        order.updatedAt = block.timestamp;

        // Emit event
        emit OrderStatusUpdated(_orderId, _newStatus);
    }

    /**
     * @dev Releases funds to the farmer after successful delivery
     * @param _orderId Unique identifier of the order
     */
    function releaseFunds(uint256 _orderId) public {
        Order storage order = orders[_orderId];
        
        require(
            order.status == OrderStatus.Delivered, 
            "Order must be delivered to release funds"
        );
        require(
            order.consumer == msg.sender, 
            "Only consumer can release funds"
        );

        // Transfer funds to farmer
        (bool success, ) = order.farmer.call{value: order.totalPrice}("");
        require(success, "Fund transfer failed");

        // Optional: Could add a small fee to the escrow account
    }

    /**
     * @dev Retrieves order details
     * @param _orderId Unique identifier of the order
     * @return Order details
     */
    function getOrderDetails(uint256 _orderId) 
        public 
        view 
        returns (Order memory) 
    {
        require(
            orders[_orderId].orderId != 0, 
            "Order does not exist"
        );
        return orders[_orderId];
    }

    /**
     * @dev Retrieves orders for a consumer
     * @param _consumer Address of the consumer
     * @return Array of order IDs
     */
    function getConsumerOrders(address _consumer) 
        public 
        view 
        returns (uint256[] memory) 
    {
        return consumerOrders[_consumer];
    }

    /**
     * @dev Retrieves orders for a farmer
     * @param _farmer Address of the farmer
     * @return Array of order IDs
     */
    function getFarmerOrders(address _farmer) 
        public 
        view 
        returns (uint256[] memory) 
    {
        return farmerOrders[_farmer];
    }
}