import 'package:dev_yahia/config/colors.dart';
import 'package:dev_yahia/data/skills.dart';
import 'package:flutter/material.dart';

class SkillWidget extends StatefulWidget {
  final Skill skill;
  const SkillWidget({Key? key, required this.skill}) : super(key: key);

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(isHovering ? 1.05 : 1.0),
        child: Chip(
          backgroundColor: isHovering ? Colors.grey[50] : null,
          label: Text(widget.skill.name!),
        ),
      ),
    );
  }
}
