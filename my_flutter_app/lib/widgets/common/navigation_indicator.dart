import 'package:flutter/material.dart';

class NavigationIndicator extends StatefulWidget {
  final bool isUp;

  const NavigationIndicator({
    super.key,
    required this.isUp,
  });

  @override
  State<NavigationIndicator> createState() => _NavigationIndicatorState();
}

class _NavigationIndicatorState extends State<NavigationIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      reverseCurve: const Interval(0.7, 1.0, curve: Curves.easeIn),
    ));

    _slideAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 1.0, curve: Curves.easeOutCubic),
    ));

    _controller.forward().then((_) => _controller.reverse());
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
        return Positioned(
          right: 64,
          top: widget.isUp ? null : MediaQuery.of(context).size.height / 2 + 40,
          bottom: widget.isUp ? MediaQuery.of(context).size.height / 2 + 40 : null,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Transform.translate(
              offset: Offset(
                0,
                widget.isUp
                    ? -20 * _slideAnimation.value
                    : 20 * _slideAnimation.value,
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  widget.isUp
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: Colors.white.withOpacity(0.7),
                  size: 24,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}