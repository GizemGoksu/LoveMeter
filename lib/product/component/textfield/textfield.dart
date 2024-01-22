import 'dart:math';
import 'package:flutter/material.dart';
import 'package:love_meter/core/extension/image_path_extension.dart';
import 'package:love_meter/product/enum/image_paths.dart';
import '../../constant/color/colors/color_util.dart';

class AppTextfield extends StatelessWidget {
  final TextEditingController textController;
  final String title;
  const AppTextfield(
    { super.key,
      required this.textController,
      required this.title,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315,
      height: 85,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
        Positioned(
          top: 28,
          left: 16,
          child: SizedBox(
            height: 50,
            width:  MediaQuery.of(context).size.width < 432 
                    ? MediaQuery.of(context).size.width * 0.67
                    : 291,
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorUtil.white,
                border: border(),
                errorBorder: border(),
                enabledBorder: border(),
                focusedBorder: border(),
                contentPadding: const EdgeInsets.symmetric(vertical: 16) + const EdgeInsets.only(left: 35),
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.rotate(
              angle: -21 * pi / 180,
              child: Image.asset(
                ImagePaths.heart.toPngPath(),
                height: 52,
                width: 54,
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              "$title:",
              style: const TextStyle(fontSize: 18, color: ColorUtil.pinkLace),
            )
          ],
        ),
      ]),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(color: ColorUtil.pinkLace, width: 3),
    );
  }
}
