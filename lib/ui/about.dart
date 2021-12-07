import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive_widget.dart';
import '../data/skills.dart';
import '../config/constants.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class About extends StatelessWidget {
  final String _avatar = 'images/yahia.jpg';
  final String _description = AppConstants.description;

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        // DESKTOP
        desktopScreen: Container(
          color: AppColors.containerColor,
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .15, vertical: 100),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WELCOME TO MY WEBSITE',
                          style: TextStyle(
                            color: AppColors.yellow,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          _description,
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 17),
                        ),
                        // const SizedBox(height: 30),
                        // Row(
                        // children: [
                        // RaisedButton(
                        //   onPressed: () {},
                        //   color: AppColors.yellow,
                        //   textColor: Colors.white,
                        //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        //   child: Text('HIRE ME NOW'),
                        // ),
                        // const SizedBox(width: 20),
                        // RaisedButton(
                        //   onPressed: _downloadCV,
                        //   color: AppColors.black,
                        //   textColor: Colors.white,
                        //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        //   child: Text('VIEW RESUME'),
                        // ),
                        // ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Text('MY PROGRAMMING SKILLS', style: AppStyles.title, textAlign: TextAlign.center),
              Container(width: 100, height: 2, color: AppColors.yellow),
              const SizedBox(height: 3),
              Container(width: 75, height: 2, color: AppColors.yellow),
              const SizedBox(height: 50),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                runAlignment: WrapAlignment.spaceBetween,
                children: SKILLS.map(_buildSkill).toList(),
              ),
            ],
          ),
        ),
        // MOBILE
        mobileScreen: Container(
          color: AppColors.containerColor,
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .15, vertical: 50),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text('WELCOME TO MY WEBSITE', style: AppStyles.title, textAlign: TextAlign.center),
              const SizedBox(height: 10),
              Text(
                _description,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 13),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Text('MY PROGRAMMING SKILLS', style: AppStyles.title, textAlign: TextAlign.center),
              Container(width: 75, height: 2, color: AppColors.yellow),
              const SizedBox(height: 3),
              Container(width: 50, height: 2, color: AppColors.yellow),
              const SizedBox(height: 25),
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
      );

  Widget _buildSkill(Skill skill) => Chip(label: Text(skill.name!));
}
