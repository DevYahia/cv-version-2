import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:dev_yahia/data/other_projects.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive_widget.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class MyOtherProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        color: AppColors.containerColor,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Text('OTHER PROJECTS', style: AppStyles.title),
            Container(width: 100, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            ...OTHER_PROJECTS.map((p) => _buildProject(context, p)).toList(),
          ],
        ),
      ),
      mobileScreen: Container(
        color: AppColors.containerColor,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            Text(
              'OTHER PROJECTS',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            Wrap(
              children: OTHER_PROJECTS.map((p) => _buildProject(context, p)).toList(),
              spacing: 5,
              runSpacing: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProject(BuildContext context, OtherProject project) => ResponsiveWidget(
        desktopScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.width * .3,
                  //   child: Image.asset(project.image),
                  // ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.width * .01),
                        Text(project.name!, style: AppStyles.title),
                        SizedBox(height: MediaQuery.of(context).size.width * .01),
                        Text(
                          project.description!,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width * .025),
                        Wrap(
                          spacing: 10,
                          children: project.skills!.map((s) => Chip(label: Text(s))).toList(),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width * .025),
                        ElevatedButton.icon(
                          onPressed: () {
                            launch(project.url!);
                          },
                          icon: Icon(CommunityMaterialIcons.github),
                          label: Text('Source Code'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0)
            ],
          ),
        ),
        mobileScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.width * .75,
              //   child: Image.asset(project.image),
              // ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .075,
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(project.name!, style: AppStyles.title),
              SizedBox(height: MediaQuery.of(context).size.width * .01),
              Text(
                project.description!,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.width * .025),
              Wrap(
                spacing: 10.0,
                runSpacing: 5.0,
                alignment: WrapAlignment.center,
                children: project.skills!.map((s) => Chip(label: Text(s))).toList(),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * .025),
              ElevatedButton.icon(
                onPressed: () {
                  launch(project.url!);
                },
                icon: Icon(CommunityMaterialIcons.github),
                label: Text('Source Code'),
              ),
              const SizedBox(height: 60.0),
            ],
          ),
        ),
      );
}
