import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../widgets/item_row.dart';
import '../../widgets/my_button.dart';

class SubscriptionInfoView extends StatefulWidget {
  const SubscriptionInfoView({super.key, required this.sObj});

  final Map sObj;

  @override
  State<SubscriptionInfoView> createState() => _SubscriptionInfoViewState();
}

class _SubscriptionInfoViewState extends State<SubscriptionInfoView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: media.width * 0.05,
                  vertical: media.height * 0.05),
              decoration: BoxDecoration(
                  color: TColor.gray80.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(24)),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        height: media.width * 0.9,
                        padding: EdgeInsets.all(media.width * 0.03),
                        decoration: BoxDecoration(
                            color: TColor.gray70,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            )),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Image.asset(
                                        "assets/icon/Arrow Down.png",
                                        width: media.width * 0.06,
                                        height: media.width * 0.06,
                                        color: TColor.gray30)),
                                Text(
                                  "Subscription info",
                                  style: TextStyle(
                                      color: TColor.gray30,
                                      fontSize: media.width * 0.04),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Image.asset("assets/icon/Trash.png",
                                        width: media.width * 0.05,
                                        height: media.width * 0.05,
                                        color: TColor.gray30)),
                              ],
                            ),
                            const Spacer(),
                            Image.asset(
                              widget.sObj["icon"],
                              width: media.width * 0.25,
                              height: media.width * 0.25,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.sObj["name"],
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: media.width * 0.08,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "\$${widget.sObj["price"]}",
                              style: TextStyle(
                                  color: TColor.gray30,
                                  fontSize: media.width * 0.06,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: media.width * 0.04,
                            vertical: media.width * 0.06),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: media.width * 0.03),
                              decoration: BoxDecoration(
                                color: TColor.gray40.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  ItemRow(
                                    title: "Name",
                                    value: widget.sObj["name"],
                                  ),
                                  const ItemRow(
                                    title: "Description",
                                    value: "Music app",
                                  ),
                                  const ItemRow(
                                    title: "Category",
                                    value: "Entertainment",
                                  ),
                                  const ItemRow(
                                    title: "First payment",
                                    value: "08.09.2024",
                                  ),
                                  const ItemRow(
                                    title: "Reminder",
                                    value: "Never",
                                  ),
                                  const ItemRow(
                                    title: "Currency",
                                    value: "USD (\$)",
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyButton(
                              title: "Save",
                              onPressed: () {},
                              color: TColor.gray70,
                              textColor: TColor.white,
                              image: "",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: media.width * 0.025,
                  vertical: media.height * 0.05),
              height: media.width * 0.9 + 10,
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                    width: media.width * 0.05,
                    height: media.width * 0.05,
                    decoration: BoxDecoration(
                        color: TColor.gray,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Expanded(
                      child: DottedBorder(
                    dashPattern: const [5, 10],
                    padding: EdgeInsets.zero,
                    strokeWidth: 2,
                    radius: const Radius.circular(16),
                    color: TColor.gray,
                    child: const SizedBox(
                      height: 0,
                    ),
                  )),
                  Container(
                    width: media.width * 0.05,
                    height: media.width * 0.05,
                    decoration: BoxDecoration(
                        color: TColor.gray,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
