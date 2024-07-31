import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/custom_dropdown_button.dart';
import '../../../controllers/translate_controller.dart';

class TopLanguageSection extends StatelessWidget {
  const TopLanguageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TranslateController controller = Get.put(TranslateController());
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomDropDownButton(
                text: controller.from.value,
                item: controller.language.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
                onChange: (value) {
                  controller.from.value = value!;
                },
              ),
            ),
            IconButton(
              onPressed: () => controller.swapLanguage(),
              icon: const Icon(
                Icons.loop,
                size: 30,
                color: Colors.green,
              ),
            ),
            Expanded(
              child: CustomDropDownButton(
                text: controller.to.value,
                item: controller.language.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ).toList(),
                onChange: (value) {
                  controller.to.value = value!;
                  controller.translate();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
