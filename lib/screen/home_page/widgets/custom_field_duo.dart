import 'package:flutter/material.dart';
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
            controller: controller.controller,
            maxLines: 10,
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
                  controller.controller.clear();
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
              decoration: InputDecoration(
                hintText: 'Write your word here...',
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade400,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
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
