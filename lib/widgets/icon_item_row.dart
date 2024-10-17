import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class IconItemRow extends StatelessWidget {
  const IconItemRow(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  final String title;
  final String icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: media.width * 0.04, vertical: media.width * 0.025),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 20,
            height: 20,
            color: TColor.gray20,
          ),
          const SizedBox(
            width: 15,
          ),
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
