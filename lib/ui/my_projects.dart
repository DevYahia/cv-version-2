import 'package:community_material_icon/community_material_icon.dart';
import 'package:dev_yahia/services/firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive_widget.dart';
import '../data/projects.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class MyProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            FutureBuilder<List<Project>>(
              future: FirestoreDatabase().allProjects(),
              initialData: [],
              builder: (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    print("DATA: ${snapshot.data}");
                    return Column(children: snapshot.data!.map((p) => _buildProject(context, p)).toList());
                  }
                }
                return Text("");
              },
            ),
            // ...PROJECTS.map((p) => _buildProject(context, p)).toList(),
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
            FutureBuilder<List<Project>>(
              future: FirestoreDatabase().allProjects(),
              initialData: [],
              builder: (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Wrap(
                      children: snapshot.data!.map((p) => _buildProject(context, p)).toList(),
                      spacing: 5,
                      runSpacing: 5,
                    );
                  }
                }
                return Text("");
              },
            ),
            // Wrap(
            //   children: PROJECTS.map((p) => _buildProject(context, p)).toList(),
            //   spacing: 5,
            //   runSpacing: 5,
            // ),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .3,
                    child: FutureBuilder<String>(
                        future: project.getDownloadUrl,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Image.network(
                                snapshot.data!,
                                height: 100.0,
                              );
                            }
                          }
                          return Text("");
                        }),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .075),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(project.name, style: AppStyles.title),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(project.description),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        Wrap(
                          spacing: 10,
                          children: project.skills.map((s) => Chip(label: Text(s))).toList(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: project.androidId != null
                                  ? () {
                                      launch(project.androidUrl);
                                    }
                                  : null,
                              icon: Icon(CommunityMaterialIcons.google_play),
                              tooltip: 'Android',
                            ),
                            const SizedBox(width: 20.0),
                            IconButton(
                              onPressed: project.iosUrl != null
                                  ? () {
                                      launch(project.iosUrl!);
                                    }
                                  : null,
                              icon: Icon(CommunityMaterialIcons.apple_ios),
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
              SizedBox(
                height: MediaQuery.of(context).size.width * .75,
                child: FutureBuilder<String>(
                    future: project.getDownloadUrl,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Image.network(
                            snapshot.data!,
                            height: 100.0,
                          );
                        }
                      }
                      return Text("");
                    }),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .075),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(project.name, style: AppStyles.title),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(
                project.description,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children: project.skills.map((s) => Chip(label: Text(s))).toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: project.androidId != null
                        ? () {
                            launch(project.androidUrl);
                          }
                        : null,
                    icon: Icon(CommunityMaterialIcons.google_play),
                    tooltip: 'Android',
                  ),
                  const SizedBox(width: 20.0),
                  IconButton(
                    onPressed: project.iosUrl != null
                        ? () {
                            launch(project.iosUrl!);
                          }
                        : null,
                    icon: Icon(CommunityMaterialIcons.apple_ios),
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
