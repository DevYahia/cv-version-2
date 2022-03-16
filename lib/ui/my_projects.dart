import 'package:auto_animated/auto_animated.dart';
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
  final options = LiveOptions(
    showItemInterval: Duration(milliseconds: 100),
    showItemDuration: Duration(milliseconds: 375),
    visibleFraction: 0.025,
    reAnimateOnVisibility: false,
  );
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
            if (dataProvider.projects != null) // With predefined options
              LiveList.options(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                options: options,
                itemBuilder: (context, index, animation) {
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                    child: SlideTransition(
                      position: Tween<Offset>(begin: Offset(0.0, -0.05), end: Offset.zero).animate(animation),
                      child: _ProjectWidget(project: dataProvider.projects![index]),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 10.0),
                itemCount: dataProvider.projects!.length,
              ),
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
                children: dataProvider.projects!.map((p) => _ProjectWidget(project: p)).toList(),
                spacing: 5,
                runSpacing: 5,
              ),
          ],
        ),
      ),
    );
  }
}

class _ProjectWidget extends StatelessWidget {
  final Project project;
  const _ProjectWidget({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: FractionallySizedBox(
        widthFactor: .7,
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
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return SizedBox(
                                width: 200.0,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(Colors.amber),
                                  ),
                                ),
                              );
                            }
                          },
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
                          // Android
                          linkButtonBuilder(project.androidUrl, ProjectPlatform.android),
                          // space
                          const SizedBox(width: 20.0),
                          // iOS
                          linkButtonBuilder(project.iosUrl, ProjectPlatform.ios),
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
                // Android
                linkButtonBuilder(project.androidUrl, ProjectPlatform.android),
                // space
                const SizedBox(width: 20.0),
                // iOS
                linkButtonBuilder(project.iosUrl, ProjectPlatform.ios),
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

  Widget linkButtonBuilder(String? link, ProjectPlatform platform) {
    return IconButton(
      onPressed: link != null
          ? () {
              launch(link);
            }
          : null,
      disabledColor: Colors.grey,
      color: Colors.white,
      icon: Icon(
        platform == ProjectPlatform.ios ? CommunityMaterialIcons.apple_ios : CommunityMaterialIcons.google_play,
      ),
      tooltip: platform == ProjectPlatform.ios ? 'iOS' : 'Android',
    );
  }
}

enum ProjectPlatform {
  ios,
  android,
  web,
}
