import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../common/hover_container.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Skills',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white.withOpacity(0.95),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              'Flutter',
              'Dart',
              'React',
              'JavaScript',
              'Python',
              'Git',
            ].map((skill) => _buildSkillChip(context, skill)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(BuildContext context, String skill) {
    return HoverContainer(
      duration: AppTheme.defaultAnimationDuration,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          gradient: AppTheme.subtleGradient,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Text(
          skill,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.85),
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}