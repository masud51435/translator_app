import 'package:flutter/material.dart';

import '../../../common/custom_dropdown_button.dart';

class TopLanguageSection extends StatelessWidget {
  const TopLanguageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomDropDownButton(
            text: 'English',
            item: [],
            onChange: (value) {},
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.loop,
              size: 30,
              color: Colors.green,
            ),
          ),
          CustomDropDownButton(
            text: 'Bengal',
            item: [],
            onChange: (value) {},
          ),
        ],
      ),
    );
  }
}