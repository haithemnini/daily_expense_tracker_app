import 'package:flutter/material.dart';

import 'app_font_size.dart';

class AppTextStyle {
  static const TextStyle title = TextStyle(
    fontSize: AppFontSize.xLarge,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title2 = TextStyle(
    fontSize: AppFontSize.xxxxxxxxLarge,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title3 = TextStyle(
    fontSize: AppFontSize.xxxxxLarge,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle title4 = TextStyle(
    fontSize: AppFontSize.xxxxLarge,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: AppFontSize.large,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body = TextStyle(
    fontSize: AppFontSize.medium,
  );

  static TextStyle caption = const TextStyle(
    fontSize: AppFontSize.small,
  );

  static const TextStyle button = TextStyle(
    fontSize: AppFontSize.medium,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle error = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.red,
  );

  static const TextStyle success = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.greenAccent,
  );

  static const TextStyle warning = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.orangeAccent,
  );

  static const TextStyle info = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.blueAccent,
  );

  static const TextStyle link = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.blueAccent,
    decoration: TextDecoration.underline,
  );

  static const TextStyle linkBold = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );

  static const TextStyle linkBoldUnderline = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );

  static const TextStyle linkUnderline = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  static const TextStyle linkBoldUnderlineWhite = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );

  static const TextStyle linkUnderlineWhite = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.white,
    decoration: TextDecoration.underline,
  );

  static const TextStyle linkBoldWhite = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle linkWhite = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.white,
  );

  static const TextStyle linkBoldUnderlineBlack = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );

  static const TextStyle linkUnderlineBlack = TextStyle(
    fontSize: AppFontSize.small,
    color: Colors.black,
    decoration: TextDecoration.underline,
  );
}
