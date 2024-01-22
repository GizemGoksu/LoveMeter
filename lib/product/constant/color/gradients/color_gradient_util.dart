import 'package:flutter/material.dart';
import 'package:love_meter/product/constant/color/colors/color_util.dart';

class ColorGradientUtil {
  static const LinearGradient liquidColor =
      LinearGradient(colors: [ColorUtil.voodoo, ColorUtil.strikeMaster]);
  static const LinearGradient buttonColor = LinearGradient(
    colors: [ColorUtil.transparent, ColorUtil.viola],
  );
}
