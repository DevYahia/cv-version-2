import 'package:dev_yahia/ui/my_stats.dart';
import 'package:dev_yahia/widgets/double_stroke.dart';
import 'package:flutter/material.dart';

import 'responsive_widget.dart';
import '../config/constants.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class MyAbout extends StatelessWidget {
  final String _description = AppConstants.description;

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        // DESKTOP
        desktopScreen: Column(
          children: [
            Container(
              color: AppColors.containerColor,
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .15, vertical: 100),
              child: Column(
                children: [
                  Text(
                    'WELCOME TO MY WEBSITE',
                    style: TextStyle(
                      color: AppColors.customAccentColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  DoubleStrokeWidget(),
                  const SizedBox(height: 50.0),
                  Text(
                    _description,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            MyStatsSection(),
          ],
        ),
        // MOBILE
        mobileScreen: Column(
          children: [
            Container(
              color: AppColors.containerColor,
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .15, vertical: 50),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text('WELCOME TO MY WEBSITE', style: AppStyles.title, textAlign: TextAlign.center),
                  DoubleStrokeWidget(),
                  const SizedBox(height: 25.0),
                  Text(
                    _description,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            MyStatsSection(),
          ],
        ),
      );
}
