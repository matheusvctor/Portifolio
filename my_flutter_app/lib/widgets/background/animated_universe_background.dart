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
    200,
    (index) => Star(
      x: math.Random().nextDouble(),
      y: math.Random().nextDouble(),
      size: math.Random().nextDouble() * 2 + 1,
    ),
  );

  final List<ShootingStar> _shootingStars = List.generate(
    5,
    (index) => ShootingStar(
      startX: math.Random().nextDouble(),
      startY: math.Random().nextDouble(),
      speed: math.Random().nextDouble() * 0.5 + 0.5,
      length: math.Random().nextDouble() * 50 + 50,
      delay: math.Random().nextDouble() * 5,
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
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
          painter: UniversePainter(_stars, _shootingStars, _controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}