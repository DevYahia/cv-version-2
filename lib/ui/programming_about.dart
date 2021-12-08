import 'package:dev_yahia/ui/statistics.dart';
import 'package:dev_yahia/widgets/double_stroke.dart';
import 'package:dev_yahia/widgets/skill_widget.dart';
import 'package:flutter/material.dart';

import 'responsive_widget.dart';
import '../data/skills.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class ProgrammingAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        // DESKTOP
        desktopScreen: Column(
          children: [
            Container(
              color: AppColors.containerColor,
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .15, vertical: 100),
              width: double.infinity,
              child: Column(
                children: [
                  Text('MY PROGRAMMING SKILLS', style: AppStyles.title, textAlign: TextAlign.center),
                  DoubleStrokeWidget(),
                  const SizedBox(height: 50.0),
                  Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    runAlignment: WrapAlignment.spaceBetween,
                    children: SKILLS.map(_buildSkill).toList(),
                  ),
                ],
              ),
            ),
            ProgrammingStatsSection(),
          ],
        ),
        // MOBILE
        mobileScreen: Column(
          children: [
            Container(
              color: AppColors.containerColor,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .15, vertical: 50),
              child: Column(
                children: [
                  Text('MY PROGRAMMING SKILLS', style: AppStyles.title, textAlign: TextAlign.center),
                  DoubleStrokeWidget(),
                  const SizedBox(height: 25.0),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.spaceBetween,
                    children: SKILLS.map(_buildSkill).toList(),
                  ),
                ],
              ),
            ),
            ProgrammingStatsSection(),
          ],
        ),
      );

  Widget _buildSkill(Skill skill) => SkillWidget(skill: skill);
}
