import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class TranslateController extends GetxController {
  static TranslateController get instance => Get.find();

  final TextEditingController inputController = TextEditingController();
  final Rx<TextEditingController> outPutController =
      TextEditingController().obs;
  RxBool showSecondField = false.obs;

  @override
  void onInit() {
    inputController.addListener(() {
      showSecondField.value = inputController.text.isNotEmpty;
    });
    super.onInit();
  }

  //translate
  Future<void> translate() async {
    final translator = GoogleTranslator();

    final translated = await translator.translate(
      inputController.text,
      from: 'en',
      to: 'fr',
    );
    outPutController.value.text = translated.text ;
  }
}
