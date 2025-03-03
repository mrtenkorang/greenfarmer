import 'package:flutter/material.dart';
import 'package:greenfarmer/utils/colors.dart';
import 'package:greenfarmer/view/widgets/app_button.dart';
import 'package:greenfarmer/view/widgets/app_text.dart';
import 'package:get/get.dart';
import 'package:greenfarmer/view/auth/auth_wrapper.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/splash_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            Column(
              children: [
                AppText(
                  text: "Green Farmer",
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                AppText(
                  text: "We farm, you buy",
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ],
            ),
            Spacer(),
            AppButton(
              buttonWidth: 300,
              buttonTextColor: AppColors.whiteColor,
              onPressed: () {
                Get.to(() => AuthWrapper());
              },
              buttonText: "Get Started",
              buttonTextFontWeight: FontWeight.bold,
              backgroundColor: AppColors.lightWhiteColor.withAlpha(350),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
