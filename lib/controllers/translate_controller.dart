import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateController extends GetxController {
  static TranslateController get instance => Get.find();

  final TextEditingController controller = TextEditingController();
  RxBool showSecondField = false.obs;

  @override
  void onInit() {
    controller.addListener(() {
      showSecondField.value = controller.text.isNotEmpty;
    });
    super.onInit();
  }
}
