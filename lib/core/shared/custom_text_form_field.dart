import 'package:flutter/material.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

import '../extension/extension.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.maxLines,
    required this.hintText,
    required this.fontSize,
    required this.textAlign,
    required this.fontWeight,
    required this.keyboardType,
    this.contentPadding,
    this.border,
    this.prefixIcon,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
  });

  final int? maxLines;
  final Widget? prefixIcon;
  final String hintText;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      textAlign: textAlign,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: context.colorScheme.outline,
          fontWeight: fontWeight,
        ),
        border: border ?? InputBorder.none,
        contentPadding: contentPadding ?? EdgeInsets.zero,
        enabledBorder: enabledBorder ?? InputBorder.none,
        focusedBorder: focusedBorder ?? InputBorder.none,
        errorBorder: errorBorder ?? InputBorder.none,
      ),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: context.colorScheme.onSurface,
      ),
      keyboardType: keyboardType,
      inputFormatters: [
        if (keyboardType == TextInputType.number)
          ThousandsFormatter(allowFraction: true)
      ],
    );
  }
}
