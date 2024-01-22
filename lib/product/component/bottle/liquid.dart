// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:love_meter/product/constant/color/gradients/color_gradient_util.dart';
import '../../constant/color/colors/color_util.dart';

class Liquid extends StatefulWidget {
  int percentage;
  Liquid({super.key, required this.percentage});

  @override
  State<Liquid> createState() => _LiquidState();
}

class _LiquidState extends State<Liquid> {
  bool isTextViSible = false;

  double get height {
    if (widget.percentage == 0) {
      setState(() {
        isTextViSible = false;
      });
      return 0;
    }
    return 62 + (232 / 100 * widget.percentage);
    // 62 --> height of the clipped circle at the above
    // 232 --> height of the rectangle
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      width: 65,
      height: height,
      onEnd: () {
        setState(() {
          if (widget.percentage != 0) {
            isTextViSible = true;
          } else {
            isTextViSible = false;
          }
        });
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          rectangle(),
          circle(),
        ],
      ),
    );
  }

  Widget circle() {
    return Container(
        height: 65,
        width: 65,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: ColorGradientUtil.liquidColor),
        child: Center(
          child: Visibility(
            visible: isTextViSible,
            child: Text(
              "%${widget.percentage.toString()}",
              style: const TextStyle(color: ColorUtil.white, fontSize: 16),
            ),
          ),
        ));
  }

  Widget rectangle() {
    return Positioned(
      bottom: 60.5,
      child: Container(
        height: 233,
        width: 34,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(0, -1),
                  blurRadius: 2)
            ],
            gradient: ColorGradientUtil.liquidColor),
      ),
    );
  }
}
