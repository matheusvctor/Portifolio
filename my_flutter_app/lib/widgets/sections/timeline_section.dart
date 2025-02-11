import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../common/hover_container.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Journey',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white.withOpacity(0.95),
          ),
        ),
        const SizedBox(height: 32),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: _buildTimeline(context),
        ),
      ],
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return Column(
      children: [
        _buildTimelineItem(
          context,
          year: '2008',
          title: 'First Contact with Computers',
          description: 'Started exploring computers at 8 years old',
          isFirst: true,
        ),
        _buildTimelineLine(),
        _buildTimelineItem(
          context,
          year: '2021',
          title: 'Programming Journey Begins',
          description: 'First contact with programming on October 4th',
        ),
        _buildTimelineLine(),
        _buildTimelineItem(
          context,
          year: '2021',
          title: 'Computer Science',
          description: 'Started Computer Science degree on October 21st',
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required String year,
    required String title,
    required String description,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return HoverContainer(
      duration: AppTheme.defaultAnimationDuration,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(24),
        decoration: AppTheme.cardDecoration,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.07),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Text(
                year,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineLine() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      width: 2,
      height: 32,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.03),
          ],
        ),
      ),
    );
  }
}