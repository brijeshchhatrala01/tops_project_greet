import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/constant.dart';

class NextPageButton extends StatelessWidget {
  final void Function()? onPressed;
  const NextPageButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(kPaddingM),
      elevation: 0,
      shape: const CircleBorder(),
      fillColor: kLightGold,
      child: const Icon(
        Icons.arrow_forward,
        color: kBrown,
        size: 32,
      ),
    );
  }
}
