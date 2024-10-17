import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class StatusButton extends StatelessWidget {
  const StatusButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.value,
    required this.statusColor,
  });

  final String text;
  final VoidCallback onPressed;
  final String value;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 68,
            decoration: BoxDecoration(
              border: Border.all(color: TColor.border.withOpacity(0.15)),
              color: TColor.gray60.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      color: TColor.gray40,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  value,
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: 60,
            color: statusColor,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
