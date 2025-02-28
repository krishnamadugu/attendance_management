import 'package:flutter/material.dart';

import '../../../../core/common/common_widgets/common_text_widget.dart';
import '../../../../core/constants/theme_constants/app_colors.dart';

class TimeLineBtnWidget extends StatelessWidget {
  const TimeLineBtnWidget({
    super.key,
    required this.btnTitle,
    required this.icon,
    required this.btnColor,
    required this.onTapPressed,
  });

  final String btnTitle;
  final IconData icon;
  final Color btnColor;
  final GestureTapCallback? onTapPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapPressed,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: CommonTextWidget(
                txtVal: btnTitle,
              ),
            ),
            Icon(
              icon,
              color: AppColors.whiteColor,
              size: 12.0,
            )
          ],
        ),
      ),
    );
  }
}
