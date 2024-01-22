// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../constant/color/color_util.dart';

class Liquid extends StatefulWidget {
  int percentage;
  Liquid({super.key, required this.percentage});

  @override
  State<Liquid> createState() => _LiquidState();
}

class _LiquidState extends State<Liquid> {
  double get height {
    if (widget.percentage == 0) {
      isTextViSible = false;
      return 0;
    }
    return 62 + (232 / 100 * widget.percentage);
    // 62 --> height of circle at the above
    // 232 --> height of rectangle
  }

  bool isTextViSible = false;

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
        clipBehavior: Clip.antiAliasWithSaveLayer,
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
            gradient: LinearGradient(
                colors: [ColorUtil.eggplant, ColorUtil.strikeMaster])),
        child: Center(
          child: Visibility(
            visible: isTextViSible,
            child: Text(
              "%${widget.percentage.toString()}",
              style: const TextStyle(color: Colors.white, fontSize: 15),
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
            gradient: const LinearGradient(
                colors: [ColorUtil.eggplant, ColorUtil.strikeMaster])),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.quadraticBezierTo(
      size.width / 2,
      5,
      size.width,
      0,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class Deneme extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(15, 0);
    path.lineTo(15, 100);
    path.quadraticBezierTo(15, 100, 0, 127.5);
    path.quadraticBezierTo(0, 127.5, 32.5, 160);
    path.quadraticBezierTo(32.5, 160, 65, 127.5);
    path.quadraticBezierTo(65, 127.5, 50, 100);
    path.lineTo(50, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
