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
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: const [
          Color(0xFF0A0A0A),
          Color(0xFF141414),
          Color(0xFF0A0A0A),
        ],
        stops: [
          0,
          0.5 + math.sin(animation * math.pi) * 0.05,
          1,
        ],
      ).createShader(rect);

    canvas.drawRect(rect, gradientPaint);

    // Draw subtle grid pattern
    _drawGrid(canvas, size);

    // Draw stars with subtle glow
    for (var star in stars) {
      final position = Offset(
        star.x * size.width,
        star.y * size.height,
      );
      
      final twinkle = (math.sin(animation * 2 * math.pi + star.x * 10) + 1) / 2;
      final starPaint = Paint()
        ..color = Colors.white.withOpacity(0.2 + twinkle * 0.1)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.5);
      
      // Draw very subtle star glow
      canvas.drawCircle(
        position,
        star.size * 1.5,
        Paint()
          ..color = Colors.white.withOpacity(0.03)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
      );
      
      // Draw star core
      canvas.drawCircle(position, star.size * 0.5, starPaint);
    }

    // Draw shooting stars with subtle trails
    final shootingStarPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0;

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

        // Draw shooting star trail with subtle gradient
        final gradient = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white.withOpacity(0.2),
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

  void _drawGrid(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.white.withOpacity(0.02)
      ..strokeWidth = 0.5;

    const gridSize = 60.0;
    final columns = (size.width / gridSize).ceil();
    final rows = (size.height / gridSize).ceil();

    for (var i = 0; i <= columns; i++) {
      final x = i * gridSize;
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        gridPaint,
      );
    }

    for (var i = 0; i <= rows; i++) {
      final y = i * gridSize;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant UniversePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}