import 'package:flutter/material.dart';

enum HoverEffect {
  lift,
  glow,
  borderGlow,
  scale,
  none
}

class HoverContainer extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool elevate;
  final HoverEffect effect;
  final double scaleAmount;
  final VoidCallback? onHover;

  const HoverContainer({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.elevate = true,
    this.effect = HoverEffect.lift,
    this.scaleAmount = 1.01,
    this.onHover,
  });

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool isHovered = false;

  void _handleHoverChange(bool hover) {
    setState(() => isHovered = hover);
    if (hover && widget.onHover != null) {
      widget.onHover!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHoverChange(true),
      onExit: (_) => _handleHoverChange(false),
      child: AnimatedContainer(
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        transform: widget.effect == HoverEffect.scale && isHovered
            ? (Matrix4.identity()..scale(widget.scaleAmount))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          boxShadow: _buildShadows(),
        ),
        child: widget.child,
      ),
    );
  }

  List<BoxShadow>? _buildShadows() {
    if (!widget.elevate) return null;

    switch (widget.effect) {
      case HoverEffect.glow:
        return isHovered
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ]
            : null;
      case HoverEffect.borderGlow:
        return isHovered
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.03),
                  blurRadius: 8,
                  spreadRadius: -2,
                ),
              ]
            : null;
      case HoverEffect.lift:
        return isHovered
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.02),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ]
            : null;
      default:
        return null;
    }
  }
}