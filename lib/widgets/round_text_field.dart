import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField({
    super.key,
    required this.title,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
  });

  final String title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: TColor.gray50, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Container(
          height: 48,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: TColor.gray60.withOpacity(0.1),
              border: Border.all(
                color: TColor.gray70,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            style: TextStyle(color: TColor.white),
            controller: controller,
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none),
            keyboardType: keyboardType,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
