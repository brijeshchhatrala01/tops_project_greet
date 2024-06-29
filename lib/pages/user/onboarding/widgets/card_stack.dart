// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/constant.dart';

class CardStack extends StatelessWidget {
  final int page_number;
  final Widget lightCardChild;
  final Widget darkCardChild;
  const CardStack(
      {super.key,
      required this.page_number,
      required this.lightCardChild,
      required this.darkCardChild});

  bool get isOddPageNumber => page_number % 2 == 1;

  @override
  Widget build(BuildContext context) {
    final darkCardWidth = MediaQuery.of(context).size.width - 2 * kPaddingL;
    final darkCardHeight = MediaQuery.of(context).size.height / 3;
    return Padding(
      padding: EdgeInsets.only(top: isOddPageNumber ? 25.00 : 50.00),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: AlignmentDirectional.center,
          clipBehavior: Clip.none,
          children: [
            Card(
              margin: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: kTerracotta,
              child: Container(
                width: darkCardWidth,
                height: darkCardHeight,
                padding: EdgeInsets.only(
                  top: !isOddPageNumber ? 100 : 0,
                  bottom: isOddPageNumber ? 100 : 0,
                ),
                child: Center(
                  child: darkCardChild,
                ),
              ),
            ),
            Positioned(
              top: !isOddPageNumber ? 25 : null,
              bottom: isOddPageNumber ? 25 : null,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: kDarkBrown,
                child: Container(
                  width: darkCardWidth * 0.8,
                  height: darkCardHeight * 0.5,
                  padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
                  child: Center(
                    child: lightCardChild,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
