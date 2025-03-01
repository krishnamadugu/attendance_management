import 'package:flutter/material.dart';

class CommonRichTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;
  final List<TextSpan> textSpans;

  const CommonRichTextWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    required this.textSpans,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: textStyle,
          ),
          ...textSpans,
        ],
      ),
    );
  }
}
