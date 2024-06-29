import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/card_stack.dart';

class OnBoardingPage extends StatelessWidget {
  final int number;
  final Widget lightCardChild;
  final Widget darkCardChild;
  final Widget textColumn;

  const OnBoardingPage({
    super.key,
    required this.number,
    required this.lightCardChild,
    required this.darkCardChild,
    required this.textColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardStack(
            page_number: number,
            lightCardChild: lightCardChild,
            darkCardChild: darkCardChild),
        SizedBox(
          height: number % 2 == 1 ? 50 : 25,
        ),
        textColumn,
      ],
    );
  }
}
