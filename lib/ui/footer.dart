import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/data_provider.dart';
import 'responsive_widget.dart';
import '../data/projects.dart';
import '../config/constants.dart';
import '../config/colors.dart';

class Footer extends StatelessWidget {
  final String _getInTouch = "You have an idea, I am here to turn your dream into a real digital solution!";
  final String _description = AppConstants.description;

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return ResponsiveWidget(
      desktopScreen: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 30,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Get in touch
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 20,
                            color: AppColors.customAccentColor,
                          ),
                          const SizedBox(width: 7.5),
                          Text(
                            'GET IN TOUCH',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _getInTouch,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Email Address',
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 7),
                      SelectableText(
                        AppConstants.mail,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Location',
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        AppConstants.location,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Aout me
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 20,
                            color: AppColors.customAccentColor,
                          ),
                          const SizedBox(width: 7.5),
                          Text(
                            'ABOUT ME',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _description,
                        style: TextStyle(
                          color: AppColors.greyLight,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // My projects
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 2,
                            height: 20,
                            color: AppColors.customAccentColor,
                          ),
                          const SizedBox(width: 7.5),
                          Text(
                            'RECENT PROJECTS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (dataProvider.projects != null)
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: dataProvider.projects!.take(4).map((p) => _buildProject(context, p)).toList(),
                        )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Divider(
              color: AppColors.greyLight?.withOpacity(.75),
              thickness: .5,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Proudly powered by DevYahia ©${DateTime.now().year}',
                  style: TextStyle(
                    color: AppColors.greyLight?.withOpacity(.75),
                  ),
                ),
                Row(children: _socialMedia()),
              ],
            )
          ],
        ),
      ),
      mobileScreen: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 30,
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 20,
                      color: AppColors.customAccentColor,
                    ),
                    const SizedBox(width: 7.5),
                    Text(
                      'GET IN TOUCH',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  _getInTouch,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Email Address',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                SelectableText(
                  AppConstants.mail,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Location',
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  AppConstants.location,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            // About me
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 20,
                      color: AppColors.customAccentColor,
                    ),
                    const SizedBox(width: 7.5),
                    Text(
                      'ABOUT ME',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  _description,
                  style: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // My projects
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 2,
                      height: 20,
                      color: AppColors.customAccentColor,
                    ),
                    const SizedBox(width: 7.5),
                    Text(
                      'RECENT PROJECTS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                if (dataProvider.projects != null)
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: dataProvider.projects!.take(4).map((p) => _buildProject(context, p)).toList(),
                  )
              ],
            ),
            const SizedBox(height: 30),
            Divider(
              color: AppColors.greyLight?.withOpacity(.75),
              thickness: .5,
            ),
            const SizedBox(height: 20),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _socialMedia(),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Proudly powered by DevYahia ©${DateTime.now().year}',
              style: TextStyle(
                color: AppColors.greyLight?.withOpacity(.75),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProject(BuildContext context, Project project) => InkWell(
        onTap: () {
          launch(project.androidUrl);
        },
        child: ResponsiveWidget(
          desktopScreen: (project.downloadUrl != null)
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * .1,
                  height: MediaQuery.of(context).size.width * .1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          project.downloadUrl!,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * .1,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(Colors.amber),
                                  ),
                                ),
                              );
                            }
                          },
                          height: MediaQuery.of(context).size.width * .1,
                        ),
                      ),
                    ],
                  ),
                )
              : null,
          mobileScreen: (project.downloadUrl != null)
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * .2,
                  height: MediaQuery.of(context).size.width * .2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          project.downloadUrl!,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * .2,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(Colors.amber),
                                  ),
                                ),
                              );
                            }
                          },
                          height: MediaQuery.of(context).size.width * .2,
                        ),
                      ),
                    ],
                  ),
                )
              : null,
        ),
      );

  List<Widget> _socialMedia() => [
        InkWell(
          onTap: () async {
            launch(AppConstants.github);
          },
          child: Icon(
            CommunityMaterialIcons.github,
            size: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          onTap: () {
            launch(AppConstants.linkedin);
          },
          child: Icon(
            CommunityMaterialIcons.linkedin,
            size: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          onTap: () {
            launch(AppConstants.twitter);
          },
          child: Icon(
            CommunityMaterialIcons.twitter,
            size: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          onTap: () {
            launch(AppConstants.facebook);
          },
          child: Icon(
            CommunityMaterialIcons.facebook,
            size: 30,
            color: Colors.white,
          ),
        ),
      ];
}
