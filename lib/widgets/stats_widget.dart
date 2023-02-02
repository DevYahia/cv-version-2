import 'package:dev_yahia/ui/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StatsData {
  final IconData iconData;
  final String? title;
  final String? subtitle;
  final String? url;

  StatsData({
    required this.iconData,
    this.title,
    this.subtitle,
    this.url,
  });
}

class StatsWidget extends StatelessWidget {
  final StatsData statsData;
  const StatsWidget({
    Key? key,
    required this.statsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: statsData.url != null
          ? () async {
              if (await canLaunch(statsData.url!)) {
                launch(statsData.url!);
              }
            }
          : null,
      child: ResponsiveWidget(
        desktopScreen: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(statsData.iconData, size: 100, color: Colors.white),
            const SizedBox(height: 5),
            Text(
              statsData.title ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              statsData.subtitle ?? "",
              textAlign: TextAlign.center,
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
            Icon(statsData.iconData, size: 80, color: Colors.white),
            const SizedBox(height: 5),
            Text(
              statsData.title ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              statsData.subtitle ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
