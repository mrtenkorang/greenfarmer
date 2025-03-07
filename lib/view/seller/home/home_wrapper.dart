import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenfarmer/view/seller/create_store/create_store.dart';
import 'package:greenfarmer/view/seller/home/seller_home.dart';
import 'package:greenfarmer/view/seller/home/seller_home_controller.dart';
import 'package:greenfarmer/view/seller/profile/profile.dart';// Import profile page
import 'package:greenfarmer/view/utils/colors.dart';

class SellerHome extends StatelessWidget {
  SellerHome({super.key}); // Remove 'const' to allow GetX updates

  final sellerHomeController = Get.put(SellerHomeController()); // Controller instance

  // Define the list of pages for BottomNavigationBar
  final List<Widget> pages = [
    SellerHomeUI(), // Home page content
    SellerProfilePage(), // Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => CreateShopPage()),
        child: const Icon(Icons.shop),
      ),
      body: Obx(() => pages[sellerHomeController.selectedIndex.value]), // Update UI based on selected index

      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: sellerHomeController.selectedIndex.value,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: AppColors.kPrimaryColor,
          onTap: (index) => sellerHomeController.changeIndex(index), // Change index on tap
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
