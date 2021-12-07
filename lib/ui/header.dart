import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:dev_yahia/ui/responsive_widget.dart';

class Header extends StatelessWidget {
  final String _name = "Yahia Salem";

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        // DESKTOP
        desktopScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nameBuilder(40),
              const SizedBox(height: 100),
            ],
          ),
        ),
        // MOBILE
        mobileScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: SizedBox(
            height: 100.0,
            child: _nameBuilder(30),
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
          textAlign: TextAlign.center,
          cursor: '|',
          speed: Duration(milliseconds: 375),
          curve: Curves.easeInOut,
        ),
      ],
      repeatForever: true,
      isRepeatingAnimation: true,
    );
  }
}
