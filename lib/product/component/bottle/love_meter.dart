import 'package:flutter/material.dart';
import 'package:love_meter/product/component/bottle/liquid.dart';
import 'package:love_meter/product/constant/color/color_util.dart';
import 'package:love_meter/product/constant/text/text_util.dart';

class LoveMeter extends StatelessWidget {
  final int percentage;
  const LoveMeter({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 311.62,
      width: 336, // 71
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned(
            left: 15.5,
            child: bottleCircle(true),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: bottleCircle(false),
          ),
          Positioned(
            top: 22,
            left: 12.5,
            child: Row(
              children: [
                bottleRectanglePiece(),
                measure(),
                textListView(),
              ],
            ),
          ),
          Positioned(
              left: 3.32,
              bottom: 3.32,
              child: Liquid(
                percentage: percentage,
              ),
            ),
        ],
      ),
    );
  }

  Container bottleRectanglePiece() {
    return Container(
      height: 225,
      width: 46,
      decoration: const BoxDecoration(
        color: ColorUtil.white,
        border: Border.symmetric(
          vertical: BorderSide(
            color: ColorUtil.affair,
            width: 3,
          ),
        ),
      ),
    );
  }

  Widget textListView() {
    return SizedBox(
      height: 228,
      width: 264,
      child: ListView.separated(
          padding: const EdgeInsets.only(left: 8),
          itemBuilder: (context, index) {
            String text = TextUtil.textList[index];
            return Text(
              text,
              style: const TextStyle(color: ColorUtil.white, fontSize: 14,fontWeight: FontWeight.w200),
            );
          },
          separatorBuilder: ((context, index) => const SizedBox(height: 32)),
          itemCount: TextUtil.textList.length),
    );
  }

  Widget bottleCircle(bool isSmall) {
    return Container(
      height: isSmall ? 40 : 71,
      width: isSmall ? 40 : 71,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorUtil.white,
        border: Border.all(
            width: 3,
            color: ColorUtil.affair,
            strokeAlign: BorderSide.strokeAlignOutside),
      ),
    );
  }

  Widget measure() {
    return SizedBox(
      height: 228,
      width: 7,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 3,
              width: 7,
              color: ColorUtil.eastSide,
            );
          },
          separatorBuilder: ((context, index) => const SizedBox(height: 8.2)),
          itemCount: 23),
    );
  }
}

/*
      left: 58,
      bottom: 65,
      */
