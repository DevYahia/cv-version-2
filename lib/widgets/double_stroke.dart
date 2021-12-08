import 'package:dev_yahia/config/colors.dart';
import 'package:flutter/material.dart';

class DoubleStrokeWidget extends StatelessWidget {
  const DoubleStrokeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 100, height: 2, color: AppColors.yellow),
        const SizedBox(height: 3),
        Container(width: 75, height: 2, color: AppColors.yellow),
      ],
    );
  }
}
