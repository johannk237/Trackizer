import 'package:flutter/cupertino.dart';

import '../common/color_extension.dart';

class IconItemSwitchRow extends StatelessWidget {
  const IconItemSwitchRow(
      {super.key,
      required this.title,
      required this.icon,
      required this.value,
      required this.didChange});

  final String title;
  final String icon;
  final bool value;
  final Function(bool) didChange;

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
          const Spacer(),
          const SizedBox(
            width: 8,
          ),
          CupertinoSwitch(value: value, onChanged: didChange)
        ],
      ),
    );
  }
}
