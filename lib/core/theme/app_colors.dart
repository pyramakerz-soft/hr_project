import 'package:flutter/material.dart';

import '../extensions/color_extension.dart';

class AppColors {
  static final Color greyShadow = HexColor.fromHex('#B4B4B4');
  static const Color textColor = Colors.white;
  static final Color whiteOpacity = HexColor.fromHex('#E5E5E5').withOpacity(.5);

  static final Color black = HexColor.fromHex('#111827');
  static final Color white = HexColor.fromHex('#FFFFFF');

  static const Color mainColor = Color(0xFFFF7519);
  static final Color mainColorFaded = HexColor.fromHex('#FFDFCA');

  static final Color lightGrey = HexColor.fromHex('#F9F9FA');
  static final Color grey = HexColor.fromHex('#A9A9A9');
  static final Color darkGrey = HexColor.fromHex('#6B7280');
  static const Color negativeRed = Color(0xFFD26053);

  static final Color red = HexColor.fromHex('#D04343');
  static final Color backgroundStartColor = HexColor.fromHex('#21427e');
  static final Color backgroundEndColor = HexColor.fromHex('#17253E');
}
