import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../widgets/custom_arc_painter.dart';
import '../../widgets/segment_button.dart';
import '../../widgets/status_button.dart';
import '../../widgets/subscription_home_row.dart';
import '../../widgets/upcoming_bills_row.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;
  List subArr = [
    {
      "name": "Spotify",
      "icon": "assets/logo/spotify_logo.png",
      "price": "5.99"
    },
    {
      "name": "Youtube Premium",
      "icon": "assets/logo/youtube_logo.png",
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/logo/OneDrive Logo.png",
      "price": "29.99"
    },
    {
      "name": "Netflix",
      "icon": "assets/logo/Netflix Logo.png",
      "price": "15.00"
    }
  ];

  List bilArr = [
    {"name": "Spotify", "date": DateTime(2024, 08, 28), "price": "5.99"},
    {
      "name": "Youtube Premium",
      "date": DateTime(2024, 08, 28),
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "date": DateTime(2024, 08, 28),
      "price": "29.99"
    },
    {"name": "Netflix", "date": DateTime(2024, 08, 28), "price": "15.00"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1,
              decoration: BoxDecoration(
                  color: TColor.gray70.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: media.width * 0.01),
                    width: media.width * 0.75,
                    height: media.width * 0.75,
                    child: CustomPaint(
                      painter: CustomArcPainter(end: 220),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Image.asset(
                        "assets/logo/logo.png",
                        width: media.width * 0.25,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Text(
                        "\$1.456",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Text(
                        "This month bills",
                        style: TextStyle(
                            color: TColor.gray40,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: TColor.border.withOpacity(0.15)),
                            color: TColor.gray60.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            "See your budget",
                            style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                                child: StatusButton(
                              text: 'Active subs',
                              value: '12',
                              statusColor: TColor.secondary,
                              onPressed: () {},
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: StatusButton(
                              text: 'Highest subs',
                              value: '\$9.99',
                              statusColor: TColor.primary10,
                              onPressed: () {},
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: StatusButton(
                              text: 'Lowest subs',
                              value: '\$5.99',
                              statusColor: TColor.secondaryG,
                              onPressed: () {},
                            )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  SegmentButton(
                    text: "Your subscription",
                    isActive: isSubscription,
                    onPressed: () {
                      setState(() {
                        isSubscription = !isSubscription;
                      });
                    },
                  ),
                  SegmentButton(
                    text: "Upcoming bills",
                    isActive: !isSubscription,
                    onPressed: () {
                      setState(() {
                        isSubscription = !isSubscription;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (isSubscription)
              ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subArr.length,
                  itemBuilder: (context, index) {
                    var sObj = subArr[index] as Map? ?? {};
                    return SubscriptionHomeRow(
                      onPressed: () {},
                      sObj: sObj,
                    );
                  }),
            if (!isSubscription)
              ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subArr.length,
                  itemBuilder: (context, index) {
                    var sObj = bilArr[index] as Map? ?? {};
                    return UpcomingBillsRow(
                      onPressed: () {},
                      sObj: sObj,
                    );
                  }),
            SizedBox(
              height: media.height * 0.15,
            )
          ],
        ),
      ),
    );
  }
}
