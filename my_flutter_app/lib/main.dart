import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const AnimatedUniverseBackground(),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppBar().preferredSize.height + 20),
                      // Profile Section
                      Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 800),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.3),
                                      blurRadius: 20,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  radius: 80,
                                  backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/160',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Your Name',
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: Colors.white,
                                  shadows: [
                                    const Shadow(
                                      color: Colors.blue,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Software Developer',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Passionate developer with experience in mobile and web development. '
                                'Creating elegant solutions for complex problems.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Skills Section
                      Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 800),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Skills',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  'Flutter',
                                  'Dart',
                                  'React',
                                  'JavaScript',
                                  'Python',
                                  'Git',
                                ].map((skill) => Chip(label: Text(skill, style: const TextStyle(color: Colors.white)))).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Projects Section
                      Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 800),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Projects',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: constraints.maxWidth > 600 ? 2 : 1,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 1.5,
                                ),
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: Colors.white.withOpacity(0.1),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Project ${index + 1}',
                                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Description of the project. This is where you can describe what the project does and what technologies were used.',
                                            style: TextStyle(color: Colors.white.withOpacity(0.8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Contact Section
                      Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 800),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contact',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const ListTile(
                                leading: Icon(Icons.email, color: Colors.white),
                                title: Text('your.email@example.com', style: TextStyle(color: Colors.white)),
                              ),
                              const ListTile(
                                leading: Icon(Icons.link, color: Colors.white),
                                title: Text('github.com/yourusername', style: TextStyle(color: Colors.white)),
                              ),
                              const ListTile(
                                leading: Icon(Icons.phone, color: Colors.white),
                                title: Text('+1 234 567 890', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

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

class Star {
  final double x;
  final double y;
  final double size;

  Star({required this.x, required this.y, required this.size});
}

class ShootingStar {
  final double startX;
  final double startY;
  final double speed;
  final double length;
  final double delay;

  ShootingStar({
    required this.startX,
    required this.startY,
    required this.speed,
    required this.length,
    required this.delay,
  });
}

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
          Color.fromARGB(255, 25, 10, 54),
        ],
        stops: [
          0,
          0.5 + math.sin(animation * math.pi) * 0.1,
          1,
        ],
      ).createShader(rect);

    canvas.drawRect(rect, gradientPaint);

    // Draw stars
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

    // Draw shooting stars
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

        // Draw shooting star trail
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
