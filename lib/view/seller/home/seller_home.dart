import 'package:flutter/material.dart';
import 'package:greenfarmer/view/seller/home/seller_home_controller.dart';
import 'package:greenfarmer/view/utils/colors.dart';
import 'package:greenfarmer/view/utils/images.dart';
import 'package:get/get.dart';
import 'package:greenfarmer/view/widgets/app_top_bar.dart';
import 'package:greenfarmer/view/widgets/shop_card.dart';

import 'package:greenfarmer/view/seller/shop_details/shop_details.dart';

class SellerHome extends StatelessWidget {
  const SellerHome({super.key});

  @override
  Widget build(BuildContext context) {
    final sellerHomeController = Get.put(SellerHomeController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          children: [
            AppTopBar(),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ShopCard(
                    shopName: "Vegetable shop",
                    shopImageUrl: AppImages.vegImage2,
                    onViewShopPressed: () => Get.to(() => ShopDetails()),
                  ),
                  SizedBox(height: 20),
                  ShopCard(
                    cardColor: AppColors.kShopCardColor2,
                    shopName: "Fruit shop",
                    shopImageUrl: AppImages.fruitImage,
                    onViewShopPressed: () => Get.to(() => ShopDetails()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder(
        init: sellerHomeController,
        builder: (context) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.location_on),
              //   label: 'First Evacuation',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: sellerHomeController.selectedIndex.value,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: AppColors.kPrimaryColor,
            onTap: sellerHomeController.changeIndex,
            selectedLabelStyle: TextStyle(
              fontFamily: 'Montserrat', // Replace with your font family
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Montserrat', // Replace with your font family
              fontSize: 12, // Adjust the font size as needed
            ),
          );
        },
      ),
    );
  }
}
