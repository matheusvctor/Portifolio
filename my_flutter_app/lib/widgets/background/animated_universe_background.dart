import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'models/star.dart';
import 'models/shooting_star.dart';
import 'universe_painter.dart';

class AnimatedUniverseBackground extends StatefulWidget {
  const AnimatedUniverseBackground({super.key});

  @override
  State<AnimatedUniverseBackground> createState() => _AnimatedUniverseBackgroundState();
}

class _AnimatedUniverseBackgroundState extends State<AnimatedUniverseBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<Star> _stars = List.generate(
    80, // Reduced number for more minimalist look
    (index) => Star(
      x: math.Random().nextDouble(),
      y: math.Random().nextDouble(),
      size: math.Random().nextDouble() * 1.2 + 0.3, // Smaller stars
    ),
  );

  final List<ShootingStar> _shootingStars = List.generate(
    2, // Fewer shooting stars for subtlety
    (index) => ShootingStar(
      startX: math.Random().nextDouble(),
      startY: math.Random().nextDouble() * 0.3, // Start from top third
      speed: math.Random().nextDouble() * 0.2 + 0.1, // Slower movement
      length: math.Random().nextDouble() * 25 + 15, // Shorter trails
      delay: math.Random().nextDouble() * 10, // More spread out timing
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20), // Slower animation
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: UniversePainter(
            _stars,
            _shootingStars,
            _controller.value,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}