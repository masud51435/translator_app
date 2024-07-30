import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomFieldDuo extends StatefulWidget {
  const CustomFieldDuo({
    super.key,
  });

  @override
  State<CustomFieldDuo> createState() => _CustomFieldDuoState();
}

class _CustomFieldDuoState extends State<CustomFieldDuo> {
  final TextEditingController controller = TextEditingController();
  bool showSecondField = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        showSecondField = controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          maxLines: 10,
          onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            hintText: 'Write your word here...',
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade400,
            ),
            suffix: IconButton(
              onPressed: () {
                controller.clear();
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
        if (showSecondField) ...[
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
    );
  }
}
