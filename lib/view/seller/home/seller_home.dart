import 'package:flutter/material.dart';
import 'package:greenfarmer/view/seller/create_store/create_store.dart';
import 'package:greenfarmer/view/seller/home/seller_home_controller.dart';
import 'package:greenfarmer/view/utils/colors.dart';
import 'package:greenfarmer/view/utils/images.dart';
import 'package:get/get.dart';
import 'package:greenfarmer/view/widgets/app_top_bar.dart';
import 'package:greenfarmer/view/widgets/shop_card.dart';

import 'package:greenfarmer/view/seller/shop_details/shop_details.dart';

class SellerHomeUI extends StatelessWidget {
  const SellerHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => CreateShopPage()),
        child: Icon(Icons.shop),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
        child: Column(
          children: [
            AppTopBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ShopCard(
                      shopName: "Vegetables shop",
                      shopImageUrl: AppImages.vegImage2,
                      onViewShopPressed:
                          () => Get.to(
                            () => ShopDetails(
                              title: "Vegetables shop",
                              imagePath: AppImages.vegImage2,
                              inventory: [
                                {
                                  "product": "Tomatoes",
                                  "quantity": "100",
                                  "price": "1000",
                                },
                                {
                                  "product": "Onions",
                                  "quantity": "100",
                                  "price": "1000",
                                },
                                {
                                  "product": "Cabbage",
                                  "quantity": "100",
                                  "price": "1000",
                                },
                              ],
                            ),
                          ),
                    ),
                    SizedBox(height: 20),
                    ShopCard(
                      spaceWidth: 20,
                      cardColor: AppColors.kShopCardColor2,
                      shopName: "Fruit shop",
                      shopImageUrl: AppImages.fruitImage,
                      onViewShopPressed:
                          () => Get.to(
                            () => ShopDetails(
                              title: "Fruit Shop",
                              imagePath: AppImages.fruitImage,
                              inventory: [
                                {
                                  "product": "Apple",
                                  "quantity": "100",
                                  "price": "1000",
                                },
                                {
                                  "product": "Banana",
                                  "quantity": "100",
                                  "price": "1000",
                                },
                                {
                                  "product": "Orange",
                                  "quantity": "100",
                                  "price": "1000",
                                },
                              ],
                            ),
                          ),
                    ),
                    SizedBox(height: 20),
                    ShopCard(
                      spaceWidth: 50,
                      cardColor: AppColors.kShopCardColor,
                      shopName: "Poultry shop",
                      shopImageUrl: AppImages.poultryImage,
                      onViewShopPressed:
                          () => Get.to(
                            () => ShopDetails(
                          title: "Poultry shop",
                          imagePath: AppImages.poultryImage,
                              inventory: [
                                {
                                  "product": "Chicken",
                                  "quantity": "100",
                                  "price": "1000",
                                },
                                {
                                  "product": "Guinea fowl",
                                  "quantity": "100",
                                  "price": "1000",
                                },
                                {
                                  "product": "Turkey",
                                  "quantity": "100",
                                  "price": "1000",
                                },
                              ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
