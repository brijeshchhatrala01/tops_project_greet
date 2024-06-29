import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/constant.dart';

class OnBoardingPageIndicator extends StatelessWidget {
  final int currentPage;
  final Widget child;
  const OnBoardingPageIndicator({
    super.key,
    required this.currentPage,
    required this.child,
  });

  Color _getPageIndicatorColor(int pageIndex) =>
      currentPage > pageIndex ? kWhite : kWhite.withOpacity(0.25);

  double get indicatorGap => pi / 12;
  double get indicatorLength => pi / 3;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _OnBoardingPageIndicatorPainter(
        color: _getPageIndicatorColor(0),
        startAngle: ((4 * indicatorLength) - (indicatorGap + indicatorLength)),
        indicatorLength: indicatorLength,
      ),
      child: CustomPaint(
        painter: _OnBoardingPageIndicatorPainter(
          color: _getPageIndicatorColor(1),
          startAngle: 4 * indicatorLength,
          indicatorLength: indicatorLength,
        ),
        child: CustomPaint(
          painter: _OnBoardingPageIndicatorPainter(
            color: _getPageIndicatorColor(2),
            startAngle:
                (4 * indicatorLength) + (indicatorLength + indicatorGap),
            indicatorLength: indicatorLength,
          ),
          child: child,
        ),
      ),
    );
  }
}

class _OnBoardingPageIndicatorPainter extends CustomPainter {
  final Color color;
  final double startAngle;
  final double indicatorLength;

  const _OnBoardingPageIndicatorPainter({
    required this.color,
    required this.startAngle,
    required this.indicatorLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: (size.shortestSide + 12) / 2),
      startAngle,
      indicatorLength,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_OnBoardingPageIndicatorPainter oldDelegate) {
    return color != oldDelegate.color || startAngle != oldDelegate.startAngle;
  }
}
