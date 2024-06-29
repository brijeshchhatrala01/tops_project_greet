import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/constant.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/icon_container.dart';

class CommunityLightCard extends StatelessWidget {
  const CommunityLightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconContainer(iconData: Icons.person, padding: kPaddingS),
        IconContainer(iconData: Icons.group, padding: kPaddingM),
        IconContainer(iconData: Icons.insert_emoticon, padding: kPaddingS),
      ],
    );
  }
}
