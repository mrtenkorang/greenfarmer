import 'package:flutter/material.dart';
import 'package:greenfarmer/view/utils/colors.dart';
import 'package:greenfarmer/view/utils/images.dart';
import 'package:greenfarmer/view/widgets/app_text.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key,
    required this.shopName,
    this.onViewShopPressed,
    this.totalProducts,
    this.totalOrders,
    this.totalActiveOrders,
    this.totalCompletedOrders,
    this.shopImageUrl, this.cardColor,
  });
  final String shopName;
  final VoidCallback? onViewShopPressed;
  final String? totalProducts,
      totalOrders,
      totalActiveOrders,
      totalCompletedOrders;
  final String? shopImageUrl;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: cardColor??AppColors.kShopCardColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                text: shopName,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              Spacer(),
              GestureDetector(
                onTap: ()=> onViewShopPressed!(),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AppText(
                    text: "View Shop",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          AppText(text: "Overview", decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
          SizedBox(height: 10),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(AppImages.totalIcon, height: 40),
                          AppText(text: "Products"),
                          AppText(text: totalProducts ?? "none", fontWeight: FontWeight.bold),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Image.asset(AppImages.totalIcon, height: 40),
                          AppText(text: "Total Orders"),
                          AppText(text: "40", fontWeight: FontWeight.bold),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(AppImages.totalIcon, height: 40),
                          AppText(text: "Products"),
                          AppText(text: "40", fontWeight: FontWeight.bold),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Image.asset(AppImages.totalIcon, height: 40),
                          AppText(text: "Products"),
                          AppText(text: "40", fontWeight: FontWeight.bold),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 10,),
              Image.asset(shopImageUrl ?? "", height: 190),
            ],
          ),
        ],
      ),
    );
  }
}
