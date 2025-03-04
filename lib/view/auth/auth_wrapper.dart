import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenfarmer/utils/colors.dart';
import 'package:greenfarmer/view/auth/login/login.dart';
import 'package:greenfarmer/view/auth/signup/signup.dart';
import 'package:greenfarmer/view/util/images.dart';

import '../widgets/app_text.dart';
import 'auth_wrapper_controller.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthLoginSignupController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 150,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.authImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Obx(
              () => TabBar(
                onTap: (index) {
                  authController.activeTabIndex.value = index;
                },
                //labelColor: AppColors,
                unselectedLabelColor: Colors.black87,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2.0,
                      //color: AppColors.kSecondaryColor,
                    ),
                  ),
                ),
                controller: authController.tabController,
                tabs: [
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: AppText(
                        text: 'Login',
                        color: Colors.black,
                        fontWeight:
                            authController.activeTabIndex.value == 0
                                ? FontWeight.bold
                                : FontWeight.w400,
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: AppText(
                        text: 'Signup',
                        color: Colors.black,
                        fontWeight:
                            authController.activeTabIndex.value == 1
                                ? FontWeight.bold
                                : FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: authController.tabController,
                children: [Login(), Signup()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
