import 'package:flutter/material.dart';

import '../../../../core/common/common_widgets/common_rich_text_widget.dart';

class AttendanceInfoWidget extends StatelessWidget {
  const AttendanceInfoWidget({
    super.key,
    required this.empName,
    required this.title,
  });

  final String empName;
  final String title;

  @override
  Widget build(BuildContext context) {
    final TextTheme txtTheme = Theme.of(context).textTheme;
    return CommonRichTextWidget(
      text: title,
      textStyle: txtTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      textSpans: [
        TextSpan(
          text: empName,
          style: txtTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
      maxLines: 2,
    );
  }
}
