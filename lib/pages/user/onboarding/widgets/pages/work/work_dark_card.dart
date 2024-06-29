import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/constant.dart';

class WorkDarkCard extends StatelessWidget {
  const WorkDarkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.person_pin,
              color: kLightGold,
              size: 32,
            ),
          ],
        ),
        SizedBox(
          height: kSpaceM,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.person,
              color: kLightGold,
              size: 32,
            ),
            Icon(
              Icons.group,
              color: kLightGold,
              size: 32,
            ),
            Icon(
              Icons.insert_emoticon,
              color: kLightGold,
              size: 32,
            ),
          ],
        )
      ],
    );
  }
}
