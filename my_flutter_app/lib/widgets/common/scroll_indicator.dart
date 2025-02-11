import 'package:flutter/material.dart';

class ScrollIndicator extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollIndicator({
    super.key,
    required this.scrollController,
  });

  @override
  State<ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator> {
  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_updateScrollProgress);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateScrollProgress);
    super.dispose();
  }

  void _updateScrollProgress() {
    final progress = widget.scrollController.position.pixels /
        widget.scrollController.position.maxScrollExtent;
    setState(() {
      _scrollProgress = progress.clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24,
      top: 0,
      bottom: 0,
      child: Center(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              final newPosition = widget.scrollController.position.pixels +
                  details.delta.dy * 2;
              widget.scrollController.jumpTo(newPosition);
            },
            child: Container(
              width: 2,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(1),
              ),
              child: FractionallySizedBox(
                heightFactor: _scrollProgress,
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}