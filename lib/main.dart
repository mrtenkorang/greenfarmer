import 'package:flutter/material.dart';
import 'package:greenfarmer/view/seller/home/home_wrapper.dart';
import 'package:greenfarmer/view/splash/splash.dart';
import 'package:greenfarmer/view/utils/colors.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Farmer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
      ),
      home: Splash(),
    );
  }
}
