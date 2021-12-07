import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:dev_yahia/ui/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/constants.dart';

class Header extends StatelessWidget {
  final String _name = "Yahia Salem";
  final String _job = "App Developer";
  final String _description = AppConstants.description;
  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nameBuilder(40),
              // Text(
              //   _job,
              //   style: TextStyle(
              //     color: AppColors.yellow,
              //     fontSize: 40,
              //     fontWeight: FontWeight.w900,
              //   ),
              // ),
              // const SizedBox(height: 5),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width / 2,
              //   child: Text(
              //     _description,
              //     style: Theme.of(context).textTheme.bodyText2.copyWith(
              //           color: Colors.grey[100],
              //           fontSize: 17,
              //         ),
              //   ),
              // ),
              // const SizedBox(height: 30),
              // RaisedButton(
              //   color: AppColors.yellow,
              //   textColor: Colors.white,
              //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              //   onPressed: _downloadCV,
              //   child: Text('Download CV'),
              // ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        mobileScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: FittedBox(
            child: Column(
              children: [
                _nameBuilder(30),
                // Text(
                //   _job,
                //   style: TextStyle(
                //     color: AppColors.yellow,
                //     fontSize: 30,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ),
                // const SizedBox(height: 5),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width,
                //   child: Text(
                //     _description,
                //     style: Theme.of(context).textTheme.bodyText2.copyWith(
                //           color: Colors.grey[100],
                //           fontSize: 15,
                //           height: 1.8,
                //         ),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                // const SizedBox(height: 30),
                // RaisedButton(
                //   color: AppColors.yellow,
                //   textColor: Colors.white,
                //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                //   onPressed: _downloadCV,
                //   child: Text('Download CV'),
                // ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      );

  Widget _nameBuilder(double fontSize) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          _name,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
          ),
          cursor: '|',
          speed: Duration(milliseconds: 375),
          curve: Curves.easeInOut,
        ),
      ],
      repeatForever: true,
      isRepeatingAnimation: true,
    );
  }

  void _downloadCV() {
    launch(AppConstants.cv);
  }
}
