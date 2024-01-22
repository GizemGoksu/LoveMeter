// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_meter/core/extension/image_path_extension.dart';
import 'package:love_meter/product/component/button/app_button.dart';
import 'package:love_meter/screen/main_view/viewmodel/main_view_model.dart';

import '../../../product/component/bottle/love_meter.dart';
import '../../../product/component/textfield/textfield.dart';
import '../../../product/constant/color/color_util.dart';
import '../../../product/constant/text/text_util.dart';
import '../../../product/enum/image_paths.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late MainViewModel viewModel;

  @override
  void initState() {
    viewModel = Get.put(MainViewModel());
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.orchid,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            ImagePaths.background.toJpgPath(),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  TextUtil.loveMeter,
                  style: GoogleFonts.cookie(
                      color: ColorUtil.pinkLace, fontSize: 80),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: SizedBox(
                    height: 270,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextfield(
                            textController: viewModel.firstNameController,
                            title: TextUtil.yourName),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 46,
                            bottom: 28,
                          ),
                          child: AppTextfield(
                              textController: viewModel.secondNameController,
                              title: TextUtil.hisHerName),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 92),
                            child: AppButton(
                              onTap: () => viewModel.calculateLove(),
                              text: TextUtil.test,
                            )),
                      ],
                    ),
                  ),
                ),
                Transform.rotate(
                    angle: -8 * pi / 180,
                    child: Obx(() => LoveMeter(
                          percentage: viewModel.percentage.value,
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}