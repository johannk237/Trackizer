import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class ItemRow extends StatelessWidget {
  const ItemRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: media.width * 0.04, vertical: media.width * 0.035),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: TColor.white,
                fontSize: media.width * 0.05,
                fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: TColor.gray30,
                  fontSize: media.width * 0.03,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Image.asset("assets/icon/Arrow Next.png",
              width: media.width * 0.03,
              height: media.width * 0.03,
              color: TColor.gray30)
        ],
      ),
    );
  }
}
