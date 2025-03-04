import 'package:flutter/material.dart';
import 'package:greenfarmer/view/auth/login/login_controller.dart';
import 'package:greenfarmer/view/utils/images.dart';
import 'package:greenfarmer/view/widgets/app_button.dart';
import 'package:greenfarmer/view/widgets/app_text.dart';
import 'package:greenfarmer/view/widgets/app_text_field.dart';
import 'package:get/get.dart';

import 'package:greenfarmer/view/utils/colors.dart';
import 'package:greenfarmer/view/widgets/third_party_auth_container.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: 'Login to continue'),
          SizedBox(height: 30),
          AppTextField(hintText: "username"),
          SizedBox(height: 20),
          AppTextField(
            suffix: IconButton(
              onPressed: () {
                loginController.togglePasswordVisibility();
              },
              icon:
                  loginController.hidePassword.value
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
            ),
            obscureText: loginController.hidePassword.value,
            hintText: "password",
          ),

          SizedBox(height: 30),
          AppButton(
            backgroundColor: AppColors.kPrimaryColor,
            onPressed: () {},
            buttonText: "Login",
            buttonTextFontWeight: FontWeight.bold,
            buttonTextColor: AppColors.whiteColor,
            buttonWidth: double.maxFinite,
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GetBuilder(
                    init: loginController,
                    builder: (_) {
                      return GestureDetector(
                        onTap: () {
                          loginController.toggleRememberMe(
                              !loginController.rememberMe.value);
                        },
                        child: Checkbox(
                          overlayColor: WidgetStateProperty.all(
                            loginController.rememberMe.value
                                ? context.theme.colorScheme.primary
                                : Colors.transparent,
                          ),
                          value: loginController.rememberMe.value,
                          onChanged: (value) {
                            loginController.toggleRememberMe(value!);
                          },
                        ),
                      );
                    },
                  ),
                  AppText(
                    text: "Remember me",
                    color: AppColors.kTextColor,
                  ),
                ],
              ),
              AppText(
                text: "Forgot Password?",
                color: AppColors.kPrimaryColor,
              ),


            ],
          ),
          Row(
            children: [
              Expanded(child: Divider(height: 5,)),
              SizedBox(width: 10,),
              AppText(text: "GF", fontWeight: FontWeight.bold,),
              SizedBox(width: 10,),
              Expanded(child: Divider(height: 5,)),
            ],
          ),
          SizedBox(height: 20,),
          ThirdPartyAuthContainer(children: [
            Row(

              children: [
                Image.asset(AppImages.googleLogo, height: 20,),
                SizedBox(width: 10,),
                AppText(text: "Continue with Google",),
              ],
            ),
          ]),
          SizedBox(height: 20,),
          ThirdPartyAuthContainer(children: [
            Row(

              children: [
                AppImages.apple(size: 20),
                SizedBox(width: 10,),
                AppText(text: "Continue with Apple",),
              ],
            ),
          ])
        ],
      ),
    );
  }
}
