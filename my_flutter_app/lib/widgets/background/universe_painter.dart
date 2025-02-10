import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'models/star.dart';
import 'models/shooting_star.dart';

class UniversePainter extends CustomPainter {
  final List<Star> stars;
  final List<ShootingStar> shootingStars;
  final double animation;

  UniversePainter(this.stars, this.shootingStars, this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw gradient background
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Paint gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0B1026),
          const Color(0xFF1B2559),
          const Color(0xFF19063A),
        ],
        stops: [
          0,
          0.5 + math.sin(animation * math.pi) * 0.1,
          1,
        ],
      ).createShader(rect);

    canvas.drawRect(rect, gradientPaint);

    // Draw stars with glow effect
    for (var star in stars) {
      final position = Offset(
        star.x * size.width,
        star.y * size.height,
      );
      
      final twinkle = (math.sin(animation * 2 * math.pi + star.x * 10) + 1) / 2;
      final starPaint = Paint()
        ..color = Colors.white.withOpacity(0.5 + twinkle * 0.5)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.5);
      
      // Draw star glow
      canvas.drawCircle(
        position,
        star.size * 2,
        Paint()
          ..color = Colors.white.withOpacity(0.1)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
      );
      
      // Draw star core
      canvas.drawCircle(position, star.size, starPaint);
    }

    // Draw shooting stars with trails
    final shootingStarPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    for (var shootingStar in shootingStars) {
      final progress = ((animation + shootingStar.delay) % 1) * shootingStar.speed;
      if (progress <= 1) {
        final path = Path();
        final startPoint = Offset(
          shootingStar.startX * size.width,
          shootingStar.startY * size.height,
        );
        final endPoint = Offset(
          startPoint.dx + shootingStar.length,
          startPoint.dy + shootingStar.length,
        );

        path.moveTo(startPoint.dx, startPoint.dy);
        path.lineTo(
          startPoint.dx + (endPoint.dx - startPoint.dx) * progress,
          startPoint.dy + (endPoint.dy - startPoint.dy) * progress,
        );

        // Draw shooting star trail with gradient
        final gradient = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white.withOpacity(0.8),
            Colors.white.withOpacity(0),
          ],
        );

        shootingStarPaint.shader = gradient.createShader(
          Rect.fromPoints(startPoint, endPoint),
        );

        canvas.drawPath(path, shootingStarPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant UniversePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}