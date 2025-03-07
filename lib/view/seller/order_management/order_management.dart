import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderManagementPage extends StatefulWidget {
  const OrderManagementPage({super.key});

  @override
  State<OrderManagementPage> createState() => _OrderManagementPageState();
}

class _OrderManagementPageState extends State<OrderManagementPage> {
  String selectedStatus = "Pending"; // Default tab
  final List<Map<String, dynamic>> orders = [
    {
      "id": "ORD123",
      "buyer": "Kwame Mensah",
      "date": DateTime.now().subtract(const Duration(days: 1)),
      "total": 150.0,
      "status": "Pending",
      "items": [
        {"name": "Tomatoes", "qty": 5, "price": 10.0},
        {"name": "Carrots", "qty": 3, "price": 5.0},
      ]
    },
    {
      "id": "ORD124",
      "buyer": "Akosua Asare",
      "date": DateTime.now().subtract(const Duration(days: 3)),
      "total": 230.0,
      "status": "Completed",
      "items": [
        {"name": "Cabbage", "qty": 4, "price": 15.0},
        {"name": "Pepper", "qty": 6, "price": 8.0},
      ]
    },
    {
      "id": "ORD125",
      "buyer": "Yaw Boateng",
      "date": DateTime.now().subtract(const Duration(days: 5)),
      "total": 90.0,
      "status": "Canceled",
      "items": [
        {"name": "Lettuce", "qty": 2, "price": 20.0},
        {"name": "Onions", "qty": 5, "price": 10.0},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Management")),
      body: Column(
        children: [
          // Tabs for Filtering Orders
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatusTab("Pending"),
                _buildStatusTab("Completed"),
                _buildStatusTab("Canceled"),
              ],
            ),
          ),

          // Order List View
          Expanded(
            child: ListView.builder(
              itemCount: orders.where((o) => o["status"] == selectedStatus).length,
              itemBuilder: (context, index) {
                var filteredOrders = orders.where((o) => o["status"] == selectedStatus).toList();
                var order = filteredOrders[index];
                return _buildOrderCard(order);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget to create status filter tabs
  Widget _buildStatusTab(String status) {
    return GestureDetector(
      onTap: () => setState(() => selectedStatus = status),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selectedStatus == status ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          status,
          style: TextStyle(
            color: selectedStatus == status ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Widget to build each order card
  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          "Order ID: ${order['id']}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Buyer: ${order['buyer']}\nDate: ${DateFormat.yMMMd().format(order['date'])}\nTotal: GHS ${order['total'].toStringAsFixed(2)}",
        ),
        trailing: Text(
          order['status'],
          style: TextStyle(
            color: order['status'] == "Pending"
                ? Colors.orange
                : order['status'] == "Completed"
                ? Colors.green
                : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderDetailsPage(order: order)),
          );
        },
      ),
    );
  }
}

// Order Details Page
class OrderDetailsPage extends StatelessWidget {
  final Map<String, dynamic> order;
  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order ${order['id']} Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Buyer Information
            Text(
              "Buyer: ${order['buyer']}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text("Date: ${DateFormat.yMMMd().format(order['date'])}"),
            const SizedBox(height: 5),
            Text("Total Amount: GHS ${order['total'].toStringAsFixed(2)}"),
            const SizedBox(height: 20),

            // Items in Order
            const Text("Items Ordered:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Column(
              children: List.generate(
                order['items'].length,
                    (index) {
                  var item = order['items'][index];
                  return ListTile(
                    leading: const Icon(Icons.shopping_cart, color: Colors.green),
                    title: Text(item['name'], style: const TextStyle(fontSize: 16)),
                    subtitle: Text("Qty: ${item['qty']}  |  Price: GHS ${item['price'].toStringAsFixed(2)}"),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Action Buttons
            if (order['status'] == "Pending") ...[
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement mark as completed
                },
                icon: const Icon(Icons.check),
                label: const Text("Mark as Completed"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement cancel order feature
                },
                icon: const Icon(Icons.cancel),
                label: const Text("Cancel Order"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
