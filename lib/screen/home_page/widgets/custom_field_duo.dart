import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:translatorapp/controllers/translate_controller.dart';

class CustomFieldDuo extends StatelessWidget {
  const CustomFieldDuo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TranslateController controller = Get.put(TranslateController());
    return Obx(
      () => Column(
        children: [
          TextFormField(
            controller: controller.inputController,
            maxLines: 10,
            onChanged: (text) {
              controller.translate();
            },
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              hintText: 'Write your word here...',
              hintStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade400,
              ),
              suffix: IconButton(
                onPressed: () {
                  controller.inputController.clear();
                },
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey.shade500,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          if (controller.showSecondField.value) ...[
            const Gap(20),
            TextFormField(
              maxLines: null,
              controller:
                  TextEditingController(text: controller.outputText.value),
              decoration: InputDecoration(
                hintText: 'OutPut...',
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade400,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: controller.outputText.value,
                      ),
                    ).then(
                      (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Text copied to clipboard!'),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.grey.shade500,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
