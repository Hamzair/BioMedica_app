import 'package:bio_medica/main.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoadingPercentageCircle extends StatelessWidget {
  final double percentage;
  final double size;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  const LoadingPercentageCircle({
    Key? key,
    required this.percentage,
    required this.size,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _LoadingPercentageCirclePainter(
              percentage: percentage,
              strokeWidth: strokeWidth,
              backgroundColor: backgroundColor,
              progressColor: progressColor,
            ),
          ),
          // Centered text showing the percentage
          Text(
            '${percentage.toStringAsFixed(0)}%',
            style: TextStyle(
              fontSize: size * 0.25, // Adjust text size relative to the circle size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingPercentageCirclePainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  _LoadingPercentageCirclePainter({
    required this.percentage,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);

    // Background circle paint
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Progress circle paint
    final Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw the background circle
    canvas.drawCircle(
      center,
      radius - strokeWidth / 2,
      backgroundPaint,
    );

    // Draw the progress arc
    final double sweepAngle = (percentage / 100) * 2 * pi;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -pi / 2, // Start at the top
      sweepAngle, // Sweep according to the percentage
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
