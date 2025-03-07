import 'package:flutter/material.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.buttonText,
    this.buttonTextColor,
    this.buttonTextSize,
    required this.onPressed,
    this.buttonWidth,
    this.buttonHeight,
    this.backgroundColor,
    this.borderRadius,
    this.buttonTextFontWeight,
    this.borderColor, // New property for border color
    this.checkMargin = true,
    this.shadow,
    this.icon = false,
    this.buttonHorizontalMargin,
    this.loading = false, this.iconn,
  });

  final String? buttonText;
  final double? buttonTextSize,
      buttonWidth,
      buttonHeight,
      borderRadius,
      buttonHorizontalMargin;
  final FontWeight? buttonTextFontWeight;
  final Color? backgroundColor,
      borderColor,
      buttonTextColor; // New property for border color
  final Function()? onPressed;
  final bool checkMargin, loading, icon;
  final List<BoxShadow>? shadow;
  final Icon? iconn;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: buttonHorizontalMargin ?? 0.0,
          right: buttonHorizontalMargin ?? 0.0,
          bottom: 10),
      decoration: BoxDecoration(
        boxShadow: shadow ?? [],
      ),
      width: buttonWidth,
      height: buttonHeight ?? 50,
      child: ElevatedButton.icon(
        icon: iconn,
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              return backgroundColor;
            },
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              side: BorderSide(
                width: 1.5,
                color: borderColor ?? Colors.transparent, // Set border color
              ),
            ),
          ),
          // Set shadowColor to transparent to remove the default shadow
          shadowColor: WidgetStateProperty.all(Colors.transparent),
        ),
        label: AppText(text: buttonText??"", color: buttonTextColor,),
        // child: icon
        //     ? Icon(
        //   Icons.add,
        //   color: buttonTextColor,
        //   size: 30,
        // )
        //     : AppText(
        //   text: buttonText ?? "",
        //   textAlign: TextAlign.center,
        //   color: buttonTextColor,
        //   fontSize: buttonTextSize,
        //   fontWeight: buttonTextFontWeight,
        // ),
      ),
    );
  }
}
