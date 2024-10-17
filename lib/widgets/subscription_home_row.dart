import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SubscriptionHomeRow extends StatelessWidget {
  const SubscriptionHomeRow({
    super.key,
    required this.onPressed,
    required this.sObj,
  });

  final Map sObj;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 64,
            decoration: BoxDecoration(
              border: Border.all(color: TColor.border.withOpacity(0.15)),
              color: TColor.gray60.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Image.asset(
                  sObj["icon"],
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    sObj["name"],
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "\$${sObj["price"]}",
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
