import 'package:community_material_icon/community_material_icon.dart';
import 'package:dev_yahia/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive_widget.dart';
import '../data/projects.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class MyProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return ResponsiveWidget(
      desktopScreen: Container(
        color: AppColors.containerColor,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Text('APP PROJECTS', style: AppStyles.title),
            Container(width: 100, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            if (dataProvider.projects != null) ...dataProvider.projects!.map((p) => _buildProject(context, p)).toList()
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
              'APP PROJECTS',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            if (dataProvider.projects != null)
              Wrap(
                children: dataProvider.projects!.map((p) => _buildProject(context, p)).toList(),
                spacing: 5,
                runSpacing: 5,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProject(BuildContext context, Project project) => ResponsiveWidget(
        desktopScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (project.downloadUrl != null)
                    SizedBox(
                      height: MediaQuery.of(context).size.width * .3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.yellow!,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.yellow!.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                            )
                          ],
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            project.downloadUrl!,
                            height: 100.0,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(width: MediaQuery.of(context).size.width * .075),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.width * .01),
                        Text(project.name, style: AppStyles.title),
                        SizedBox(height: MediaQuery.of(context).size.width * .01),
                        Text(project.description),
                        SizedBox(height: MediaQuery.of(context).size.width * .025),
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: project.skills.map((s) => Chip(label: Text(s))).toList(),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width * .025),
                        Row(
                          children: [
                            IconButton(
                              onPressed: project.androidId != null
                                  ? () {
                                      launch(project.androidUrl);
                                    }
                                  : null,
                              icon: Icon(CommunityMaterialIcons.google_play, color: Colors.white),
                              tooltip: 'Android',
                            ),
                            const SizedBox(width: 20.0),
                            IconButton(
                              onPressed: project.iosUrl != null
                                  ? () {
                                      launch(project.iosUrl!);
                                    }
                                  : null,
                              icon: Icon(CommunityMaterialIcons.apple_ios, color: Colors.white),
                              tooltip: 'iOS',
                            ),
                            const SizedBox(width: 20.0),
                            IconButton(
                              onPressed: project.webUrl != null
                                  ? () {
                                      launch(project.webUrl!);
                                    }
                                  : null,
                              icon: Icon(CommunityMaterialIcons.web, color: Colors.white),
                              tooltip: 'Web',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.black.withOpacity(.1),
                height: 20,
                thickness: 1,
              ),
            ],
          ),
        ),
        mobileScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              if (project.downloadUrl != null)
                SizedBox(
                  height: MediaQuery.of(context).size.width * .75,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.yellow!,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.yellow!.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                        )
                      ],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        project.downloadUrl!,
                        height: 100.0,
                      ),
                    ),
                  ),
                ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .075,
                height: MediaQuery.of(context).size.width * .02,
              ),
              Text(project.name, style: AppStyles.title),
              SizedBox(height: MediaQuery.of(context).size.width * .01),
              Text(
                project.description,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.width * .025),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                alignment: WrapAlignment.center,
                children: project.skills.map((s) => Chip(label: Text(s))).toList(),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * .025),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: project.androidId != null
                        ? () {
                            launch(project.androidUrl);
                          }
                        : null,
                    icon: Icon(CommunityMaterialIcons.google_play, color: Colors.white),
                    tooltip: 'Android',
                  ),
                  const SizedBox(width: 20.0),
                  IconButton(
                    onPressed: project.iosUrl != null
                        ? () {
                            launch(project.iosUrl!);
                          }
                        : null,
                    icon: Icon(CommunityMaterialIcons.apple_ios, color: Colors.white),
                    tooltip: 'iOS',
                  ),
                  const SizedBox(width: 20.0),
                  IconButton(
                    onPressed: project.webUrl != null
                        ? () {
                            launch(project.webUrl!);
                          }
                        : null,
                    icon: Icon(CommunityMaterialIcons.web),
                    tooltip: 'Web',
                  ),
                ],
              ),
              Divider(
                color: AppColors.black.withOpacity(.1),
                height: 50,
                thickness: 1,
              ),
            ],
          ),
        ),
      );
}
