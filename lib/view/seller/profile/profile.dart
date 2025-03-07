import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenfarmer/view/utils/colors.dart';
import 'package:greenfarmer/view/utils/images.dart';

import '../../widgets/app_button.dart';

class SellerProfilePage extends StatelessWidget {
  const SellerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text("Seller Profile"),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            // Seller Profile Picture
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(AppImages.profileImage), // Replace with actual image
                ),
              ),
            ),

            SizedBox(height: 20),

            // Seller Info
            Text(
              "Seller Name:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "Joseph Ofori Tenkorang",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 10),

            Text(
              "Email:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "josephoforitenkorang391@gmail.com",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 20),

            // Shop Details
            Text(
              "Shop Names:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "1. Vegetable Shop\n2. Fruit Shop\n3. Poultry Shop",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 10),

            Text(
              "Shop Address:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "123 Main Street, Green City",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 30),

            // Edit Profile Button
            Center(
              child:     AppButton(
                iconn: Icon(Icons.edit, color: Colors.white,),
                onPressed: () {},
                backgroundColor: AppColors.kPrimaryColor,
                buttonText: "Edit Profile",
                buttonTextSize: 18,
                buttonTextColor: AppColors.whiteColor,

              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy Edit Profile Page
class EditSellerProfilePage extends StatelessWidget {
  const EditSellerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: Center(
        child: Text("Edit Profile Form Here"),
      ),
    );
  }
}
