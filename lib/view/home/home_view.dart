import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common/list.dart';
import '../../widgets/custom_arc_painter.dart';
import '../../widgets/segment_button.dart';
import '../../widgets/status_button.dart';
import '../../widgets/subscription_home_row.dart';
import '../../widgets/upcoming_bills_row.dart';
import '../settings/settings_view.dart';
import '../subscription_info/subscription_info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;




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
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: media.width * 0.01),
                        width: media.width * 0.75,
                        height: media.width * 0.75,
                        child: CustomPaint(
                          painter: CustomArcPainter(end: 220),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: media.height * 0.01),
                        child: Row(
                          children: [
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SettingsView()));
                                },
                                icon: Image.asset(
                                  "assets/icon/Settings.png",
                                  width: 25,
                                  height: 25,
                                  color: TColor.gray30,
                                ))
                          ],
                        ),
                      ),
                    ],
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SubscriptionInfoView(sObj: sObj)));
                      },
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
