import 'package:flutter/material.dart' show Color;
import 'package:flutter_svg/flutter_svg.dart';

class AppImages {
  static const String logo = 'assets/images/logo.png';

  static const String splashImage = 'assets/img/splash_image.jpg';
  static const String authImage = 'assets/img/auth_image.jpg';
  static const String googleLogo = 'assets/img/google.png';

  static var apple = ({Color? color, double? size}) => SvgPicture.asset(
    'assets/img/apple.svg',
    color: color,
    height: size,
    width: size,
  );
}