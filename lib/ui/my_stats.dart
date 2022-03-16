import 'package:community_material_icon/community_material_icon.dart';
import 'package:dev_yahia/data/other_projects.dart';
import 'package:dev_yahia/providers/data_provider.dart';
import 'package:dev_yahia/widgets/stats_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'responsive_widget.dart';

class MyStatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final _statsList = <StatsData>[
      StatsData(
        iconData: CommunityMaterialIcons.medical_bag,
        title: '5th Year',
        subtitle: 'Medical Student',
      ),
      if (dataProvider.projects != null)
        StatsData(
          iconData: CommunityMaterialIcons.developer_board,
          title: '${dataProvider.projects!.length + OTHER_PROJECTS.length}+',
          subtitle: 'Projects Done',
        ),
    ];
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
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => StatsWidget(statsData: _statsList[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 50.0),
          itemCount: _statsList.length,
        ),
      ),
    );
  }
}
