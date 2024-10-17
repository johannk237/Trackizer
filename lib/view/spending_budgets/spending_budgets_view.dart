import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../widgets/budget_row.dart';
import '../../widgets/custom_arc_180_painter.dart';

class SpendingBudgetsView extends StatefulWidget {
  const SpendingBudgetsView({super.key});

  @override
  State<SpendingBudgetsView> createState() => _HomeViewState();
}

class _HomeViewState extends State<SpendingBudgetsView> {
  List budgetArr = [
    {
      "name": "Auto & Transport",
      "icon": "assets/icon/Auto & Transport.png",
      "spend_amount": "25.99",
      "total_budget": "480",
      "left_amount": "374.01",
      "color": TColor.secondaryG
    },
    {
      "name": "Entertainment",
      "icon": "assets/icon/Entertainment.png",
      "spend_amount": "50.99",
      "total_budget": "600",
      "left_amount": "549.01",
      "color": TColor.secondary50
    },
    {
      "name": "Security",
      "icon": "assets/icon/Security.png",
      "spend_amount": "5.99",
      "total_budget": "600",
      "left_amount": "594.01",
      "color": TColor.primary10
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: media.height * 0.07,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: media.width * 0.5,
                  height: media.width * 0.25,
                  child: CustomPaint(
                    painter: CustomArc180Painter(
                      drawArcs: [
                        ArcValueModel(value: 20, color: TColor.secondaryG),
                        ArcValueModel(value: 45, color: TColor.secondary),
                        ArcValueModel(value: 70, color: TColor.primary10)
                      ],
                      end: 50,
                      width: 12,
                      bgWidth: 8,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "\$82,90",
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "of \$2,000 budget",
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
             SizedBox(
              height: media.height * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 64,
                  decoration: BoxDecoration(
                    border: Border.all(color: TColor.border.withOpacity(0.1)),
                    //color: TColor.gray60.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your budget are on tack",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: budgetArr.length,
                itemBuilder: (context, index) {
                  var bObj = budgetArr[index] as Map? ?? {};
                  return BudgetRow(
                    onPressed: () {},
                    bObj: bObj,
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: DottedBorder(
                  dashPattern: [5, 4],
                  strokeWidth: 1,
                  radius: Radius.circular(16),
                  borderType: BorderType.RRect,
                  color: TColor.border.withOpacity(0.1),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 64,
                    decoration: BoxDecoration(
                      border: Border.all(color: TColor.border.withOpacity(0.1)),
                      //color: TColor.gray60.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add new category",
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: media.width * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: TColor.border.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.add,
                            color: TColor.gray30,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
