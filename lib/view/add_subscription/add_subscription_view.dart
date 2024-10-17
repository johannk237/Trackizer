import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../common/list.dart';
import '../../widgets/round_text_field.dart';
import '../../widgets/image_button.dart';
import '../../widgets/my_button.dart';
import '../../common/color_extension.dart';

class AddSubscriptionView extends StatefulWidget {
  const AddSubscriptionView({super.key});

  @override
  State<AddSubscriptionView> createState() => _AddSubscriptionViewState();
}

class _AddSubscriptionViewState extends State<AddSubscriptionView> {
  TextEditingController txtDescription = TextEditingController();

  double amountVal = 0.9;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
              child: SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: media.height * 0.05,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Image.asset("assets/icon/Back.png",
                                      width: 25,
                                      height: 25,
                                      color: TColor.gray30))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New",
                                style: TextStyle(
                                    color: TColor.gray30, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: media.height * 0.02),
                        child: Text(
                          "Add new\n Subscription",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 40),
                        ),
                      ),
                      SizedBox(
                        width: media.width,
                        height: media.width * 0.6,
                        child: CarouselSlider.builder(
                          itemCount: subArr.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            var sObj = subArr[itemIndex] as Map? ?? {};
                            return Container(
                                margin: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      sObj["icon"],
                                      width: media.width * 0.4,
                                      height: media.width * 0.4,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    const Spacer(),
                                    Text(
                                      sObj["name"],
                                      style: TextStyle(
                                          color: TColor.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ));
                          },
                          options: CarouselOptions(
                            autoPlay: false,
                            aspectRatio: 1,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            viewportFraction: 0.65,
                            enlargeFactor: 0.4,
                            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: media.width * 0.05,
                  right: media.width * 0.05,
                  top: media.height * 0.04),
              child: RoundTextField(
                title: "Description",
                titleAlign: TextAlign.center,
                controller: txtDescription,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: media.width * 0.05,
                  vertical: media.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageButton(
                    image: "assets/icon/Minus.png",
                    onPressed: () {
                      amountVal -= 0.1;

                      if (amountVal < 0) {
                        amountVal = 0;
                      }
                      setState(() {});
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        "Monthly price",
                        style: TextStyle(
                            color: TColor.gray40,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "\$${amountVal.toStringAsFixed(1)}",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: media.height * 0.15,
                        height: 1,
                        color: TColor.gray40,
                      )
                    ],
                  ),
                  ImageButton(
                    image: "assets/icon/Plus.png",
                    onPressed: () {
                      amountVal += 0.1;

                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.height * 0.05,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: MyButton(
                    title: "Add this platform ",
                    onPressed: () {},
                    color: TColor.secondary,
                    textColor: TColor.white,
                    image: "")),
          ],
        ),
      ),
    );
  }
}
