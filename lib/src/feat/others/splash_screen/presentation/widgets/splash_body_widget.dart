import 'package:attendance_management/src/core/common/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants/app_asset_paths.dart';
import '../../../../../core/constants/app_constants/app_texts.dart';

class SplashBodyWidget extends StatelessWidget {
  const SplashBodyWidget({
    super.key,
    required this.defaultConstraints,
    required this.txtTheme,
  });

  final BoxConstraints defaultConstraints;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        /// lottie file widget
        ConstrainedBox(
          constraints: defaultConstraints,
          child: Image.asset(
            AppAssetPaths.kAppLogoAssetPath,
            fit: BoxFit.contain,
          ),
        ),

        /// splash title widget
        ConstrainedBox(
          constraints: defaultConstraints,
          child: CommonTextWidget(
            txtVal: AppTexts.kAppTitle,
            textStyle: txtTheme.headlineSmall,
          ),
        ),

        /// extra space for safety & center alignment
        const SizedBox(height: 10.0),
      ],
    );
  }
}
