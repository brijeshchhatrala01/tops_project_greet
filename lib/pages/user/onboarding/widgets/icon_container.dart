import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/constant.dart';

class IconContainer extends StatelessWidget {
  final IconData iconData;
  final double padding;
  const IconContainer(
      {super.key, required this.iconData, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: kLightGold.withOpacity(0.25), shape: BoxShape.circle),
      child: Icon(
        iconData,
        size: 32,
        color: kLightGold,
      ),
    );
  }
}
