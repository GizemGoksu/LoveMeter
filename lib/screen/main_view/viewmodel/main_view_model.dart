import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/calculator/love_meter_calculator.dart';

class MainViewModel extends GetxController {
  RxInt percentage = 0.obs;
  RxBool isTextVisible = false.obs;
  late TextEditingController firstNameController;
  late TextEditingController secondNameController;
  late LoveMeterCalculator loveMeterCalculator;

  @override
  void onInit() {
    firstNameController = TextEditingController();
    secondNameController = TextEditingController();
    loveMeterCalculator = LoveMeterCalculator();
    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    super.dispose();
  }

  void calculateLove() {
    int newPerc = loveMeterCalculator.calculatePercentage(firstNameController.text, secondNameController.text);
    if (percentage.value != 0) {
      // if user wants to try different names, then we need to reset the percentage to 0
      percentage.value = 0;
      Future.delayed(const Duration(seconds: 2), () => percentage.value = newPerc);
    } else {
      percentage.value = newPerc;
    }
  }
}
