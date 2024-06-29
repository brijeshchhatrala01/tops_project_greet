import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/textcolumn.dart';

class CommunityTextColumn extends StatelessWidget {
  const CommunityTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Free Make Greeting Cards',
      text: 'Make free greeting cards with E-Wishes without any charges',
    );
  }
}
