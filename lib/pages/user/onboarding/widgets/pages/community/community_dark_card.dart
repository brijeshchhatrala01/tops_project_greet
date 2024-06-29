import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/constant.dart';

class CommunityDarkCard extends StatelessWidget {
  const CommunityDarkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(top: kPaddingL),
          child: Icon(
            Icons.brush,
            color: kLightGold,
            size: 32,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: kPaddingL),
          child: Icon(
            Icons.camera_alt,
            color: kLightGold,
            size: 32,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: kPaddingL),
          child: Icon(
            Icons.straighten,
            color: kLightGold,
            size: 32,
          ),
        ),
      ],
    );
  }
}
