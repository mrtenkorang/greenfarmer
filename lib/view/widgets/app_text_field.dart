import 'package:flutter/material.dart';

import 'package:greenfarmer/view/utils/colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.labelText,
    this.suffix,
    this.suffixOnTap,
    this.controller,
    this.onChange,
    this.keyboard,
    this.width,
    this.hintText,
    this.init,
    this.obscureText = false,
    this.autofocus = false, this.borderColor,this.cursorColor,
  });

  final String? labelText, hintText;
  final IconButton? suffix;
  final void Function()? suffixOnTap;
  final void Function(String)? onChange;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final double? width;
  final String? init;
  final bool obscureText, autofocus;
  final Color? borderColor, cursorColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboard,
      onChanged: onChange,
      onTap: suffixOnTap,
      initialValue: init,
      style: TextStyle(
          fontFamily: 'Montserrat', color: cursorColor??AppColors.kPrimaryColor, fontSize: 16),
      cursorColor: cursorColor??AppColors.kSecondaryColor,
      cursorWidth: 1.5,
      cursorHeight: 15,
      obscureText: obscureText,
      decoration: InputDecoration(
        isDense: true,
        isCollapsed: true,
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle:  TextStyle(
          fontFamily: 'Montserrat',
          color: AppColors.kTextColor.withOpacity(0.4),
          fontSize: 12,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: AppColors.kSecondaryColor,
          fontSize: 14,
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? AppColors.kTextColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor??AppColors.kPrimaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
