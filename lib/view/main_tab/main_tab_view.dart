import 'package:flutter/material.dart';

import '../add_subscription/add_subscription_view.dart';
import '../../common/color_extension.dart';
import '../calender/calender_view.dart';
import '../cards/cards_view.dart';
import '../home/home_view.dart';
import '../spending_budgets/spending_budgets_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const HomeView();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(
        children: [
          PageStorage(bucket: pageStorageBucket, child: currentTabView),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: media.width * 0.1,
                      vertical: media.height * 0.05),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/image/BG.png",
                            width: media.width,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTab = 0;
                                      currentTabView = const HomeView();
                                    });
                                  },
                                  icon: Image.asset(
                                    "assets/icon/Home.png",
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 0
                                        ? TColor.white
                                        : TColor.gray40,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTab = 1;
                                      currentTabView =
                                          const SpendingBudgetsView();
                                    });
                                  },
                                  icon: Image.asset(
                                    "assets/icon/Budgets.png",
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 1
                                        ? TColor.white
                                        : TColor.gray40,
                                  )),
                              const SizedBox(
                                width: 40,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTab = 2;
                                      currentTabView = const CalenderView();
                                    });
                                  },
                                  icon: Image.asset(
                                    "assets/icon/Calendar.png",
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 2
                                        ? TColor.white
                                        : TColor.gray40,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectTab = 3;
                                      currentTabView = const CardsView();
                                    });
                                  },
                                  icon: Image.asset(
                                    "assets/icon/Credit Cards.png",
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 3
                                        ? TColor.white
                                        : TColor.gray40,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddSubscriptionView(),
                            ),
                          );
                        },
                        child: Container(
                          width: media.width * 0.125,
                          height: media.width * 0.125,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: TColor.secondary,
                              boxShadow: [
                                BoxShadow(
                                    color: TColor.secondary.withOpacity(0.25),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4))
                              ],
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.add,
                            color: TColor.white,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
