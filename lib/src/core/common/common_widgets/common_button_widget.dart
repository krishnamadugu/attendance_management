import 'package:flutter/material.dart';

import '../../constants/theme_constants/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? textColor;

  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: AppColors.greyColor),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
            AppColors.greyColor), // Set the button color
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: textColor ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
