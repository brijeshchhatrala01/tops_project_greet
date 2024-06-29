import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/constant.dart';

class TextColumn extends StatelessWidget {
  final String title;
  final String text;
  const TextColumn({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: kLightGold, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: kSpaceS,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: kLightGold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
