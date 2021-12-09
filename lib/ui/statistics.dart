import 'package:community_material_icon/community_material_icon.dart';
import 'package:dev_yahia/widgets/stats_widget.dart';
import 'package:flutter/material.dart';
import 'responsive_widget.dart';

class ProgrammingStatsSection extends StatelessWidget {
  final _statsList = <StatsData>[
    StatsData(
      iconData: CommunityMaterialIcons.language_python,
      title: 'Python',
      subtitle: 'Data Science',
      url: 'https://www.python.org',
    ),
    StatsData(
      iconData: Icons.flutter_dash_rounded,
      title: 'Flutter',
      subtitle: 'iOS/Android/Web',
      url: 'https://flutter.dev',
    ),
    StatsData(
      iconData: CommunityMaterialIcons.git,
      title: 'Git',
      subtitle: 'Version Control',
      url: 'https://git-scm.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        height: 400,
        color: Colors.black.withOpacity(.7),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _statsList.map((e) => StatsWidget(statsData: e)).toList(),
        ),
      ),
      mobileScreen: Container(
        color: Colors.black54,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .15, vertical: 50),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => StatsWidget(statsData: _statsList[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 50.0),
          itemCount: _statsList.length,
        ),
      ),
    );
  }
}
