import 'package:flutter/material.dart';

import '../../constant/color/color_util.dart';

class AppButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const AppButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width:  MediaQuery.of(context).size.width < 432 
                    ? MediaQuery.of(context).size.width * 0.67
                    : 291, //291,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: ColorUtil.white.withOpacity(0.25), width: 3),
            gradient: const LinearGradient(
              colors: [
                ColorUtil.transparent,
                 ColorUtil.viola],
              ),
        ),
        child: Center(
            child: Text(
              text,
                style: const TextStyle(
                  fontSize: 20,
                  color: ColorUtil.white,
                  fontWeight: FontWeight.w400),
        )),
      ),
    );
  }
}
