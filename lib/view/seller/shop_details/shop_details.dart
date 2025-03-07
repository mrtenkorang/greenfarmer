import 'package:flutter/material.dart';
import 'package:greenfarmer/view/utils/colors.dart';
import 'package:greenfarmer/view/utils/images.dart';
import 'package:greenfarmer/view/widgets/app_button.dart';
import 'package:greenfarmer/view/widgets/app_top_bar.dart';

class ShopDetails extends StatelessWidget {
  const ShopDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            const AppTopBar(title: "Shop Dashboard"),

            // Shop Image
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.vegImage2),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Shop Overview
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shop Name
                    const Text(
                      "Green Farm Vegetables",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Shop Description
                    const Text(
                      "Welcome to your seller dashboard! Here you can manage your stock, track orders, "
                      "analyze sales, and update shop details. Keep your inventory updated and ensure timely deliveries!",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),

                    // Sales Performance
                    const Text(
                      "Sales Performance",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSummaryCard("Total Sales", "250"),
                        _buildSummaryCard("Revenue (GHS)", "5,400"),
                        _buildSummaryCard("Orders", "120"),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Product Inventory Section
                    const Text(
                      "Product Inventory",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildInventoryItem("Tomatoes", "50 kg", "GHS 12/kg"),
                    _buildInventoryItem("Cabbage", "30 pcs", "GHS 5/pc"),
                    _buildInventoryItem("Carrots", "40 kg", "GHS 8/kg"),
                    const SizedBox(height: 20),

                    // Stock Management
                    const Text(
                      "Manage Stock",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AppButton(
                      onPressed: () {},
                      backgroundColor: AppColors.kPrimaryColor,
                      buttonText: "Update Stock",
                      buttonTextSize: 18,
                      buttonTextColor: AppColors.whiteColor,

                    ),
                    // ElevatedButton.icon(
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.green,
                    //     padding: const EdgeInsets.symmetric(vertical: 12),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     // TODO: Implement stock update feature
                    //   },
                    //   icon: const Icon(Icons.inventory, color: Colors.white),
                    //   label: const Text(
                    //     "Update Stock",
                    //     style: TextStyle(fontSize: 18, color: Colors.white),
                    //   ),
                    // ),
                    const SizedBox(height: 20),

                    // Order Management
                    const Text(
                      "Order Management",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildOrderSummary("Pending Orders", 8, Colors.orange),
                    _buildOrderSummary("Completed Orders", 95, Colors.green),
                    _buildOrderSummary("Canceled Orders", 5, Colors.red),
                    const SizedBox(height: 20),

                    // Earnings Summary
                    const Text(
                      "Earnings Summary",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildEarningsCard("This Month", "GHS 2,500"),
                    _buildEarningsCard("Last Month", "GHS 3,200"),
                    const SizedBox(height: 20),

                    // Shop Settings
                    const Text(
                      "Shop Settings",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AppButton(
                      onPressed: () {},
                      backgroundColor: AppColors.kSecondaryColor,
                      buttonText: "Edit Shop",
                      buttonTextSize: 18,
                      buttonTextColor: AppColors.whiteColor,

                    ),
                    // ElevatedButton.icon(
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.blue,
                    //     padding: const EdgeInsets.symmetric(vertical: 12),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     // TODO: Implement edit shop details feature
                    //   },
                    //   icon: const Icon(Icons.edit, color: Colors.white),
                    //   label: const Text(
                    //     "Edit Shop Details",
                    //     style: TextStyle(fontSize: 18, color: Colors.white),
                    //   ),
                    // ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for sales performance cards
  Widget _buildSummaryCard(String title, String value) {
    return Expanded(
      child: Card(
        color: Colors.green.shade100,
        elevation: 0.1,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(title, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for inventory items
  Widget _buildInventoryItem(String product, String quantity, String price) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(
          product,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Stock: $quantity | Price: $price"),
        trailing: const Icon(Icons.edit, color: Colors.green),
        onTap: () {
          // TODO: Implement inventory update
        },
      ),
    );
  }

  // Widget for order summary cards
  Widget _buildOrderSummary(String title, int count, Color color) {
    return Card(
      //color: color.withOpacity(0.2),
      elevation: 0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {
          // TODO: Implement order tracking
        },
      ),
    );
  }

  // Widget for earnings summary cards
  Widget _buildEarningsCard(String title, String amount) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Total Earnings: $amount",
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
