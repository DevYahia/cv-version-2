import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:dev_yahia/data/other_projects.dart';

import '../data/projects.dart';
import 'responsive_widget.dart';
import 'icon.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        height: 400,
        color: Colors.black.withOpacity(.7),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _buildStatistic(context, CommunityMaterialIcons.medical_bag, '5th', 'Medical Student'),
          _buildStatistic(context, CommunityMaterialIcons.developer_board, '${PROJECTS.length + OTHER_PROJECTS.length}+', 'Projects Done'),
        ]),
      ),
      mobileScreen: Container(
        color: Colors.black54,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            _buildStatistic(context, CommunityMaterialIcons.medical_bag, '5th', 'Medical Student'),
            const SizedBox(height: 50),
            _buildStatistic(context, CommunityMaterialIcons.developer_board, '${PROJECTS.length + OTHER_PROJECTS.length}+', 'Projects Done'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistic(BuildContext context, IconData icon, String total, String description) {
    return ResponsiveWidget(
      desktopScreen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 100, color: Colors.white),
          const SizedBox(height: 5),
          Text(
            total,
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      mobileScreen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 80, color: Colors.white),
          const SizedBox(height: 5),
          Text(
            total,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
