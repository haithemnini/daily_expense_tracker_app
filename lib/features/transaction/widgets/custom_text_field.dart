import 'package:flutter/material.dart';

import '../../../core/extensions/devices_extension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxLines,
    required this.hintText,
    required this.fontSize,
    required this.textAlign,
    required this.fontWeight,
    required this.keyboardType,
    this.contentPadding,
  });

  final int? maxLines;
  final String hintText;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      textAlign: textAlign,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: context.colorScheme.outline,
          fontWeight: fontWeight,
        ),
        border: InputBorder.none,
        contentPadding: contentPadding ?? EdgeInsets.zero,
      ),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: context.colorScheme.onSurface,
      ),
      keyboardType: keyboardType,
    );
  }
}
