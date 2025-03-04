import 'package:flutter/material.dart' show Color;
import 'package:flutter_svg/flutter_svg.dart';

class AppImages {
  static const String logo = 'assets/images/logo.png';

  static const String splashImage = 'assets/img/splash_image.jpg';
  static const String authImage = 'assets/img/auth_image.jpg';
  static const String googleLogo = 'assets/img/google.png';
  static const String totalIcon = 'assets/img/full.png';
  static const String vegImage = 'assets/img/veg.png';
  static const String vegImageBG = 'assets/img/veg-bg.jpg';
  static const String vegImage2 = 'assets/img/veg_img.png';
  static const String fruitImage = 'assets/img/fruits.png';

  static var apple = ({Color? color, double? size}) => SvgPicture.asset(
    'assets/img/apple.svg',
    color: color,
    height: size,
    width: size,
  );
}