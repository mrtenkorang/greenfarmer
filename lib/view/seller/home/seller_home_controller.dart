import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerHomeController extends GetxController{
  BuildContext? sellerHomeScreenContext;

  var selectedIndex = 0.obs;

  changeIndex(int index){
    selectedIndex.value = index;
    update();
  }
}