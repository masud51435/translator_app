import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.text,
    required this.item,
    required this.onChange,
  });

  final String text;
  final List<DropdownMenuItem<Object?>>? item;
  final void Function(Object?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<Object?>(
        hint: Text(text),
        underline: const SizedBox(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        items: item,
        onChanged: onChange,
      ),
    );
  }
}