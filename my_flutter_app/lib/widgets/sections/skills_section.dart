import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
              ].map((skill) => Chip(
                backgroundColor: Colors.blue.withOpacity(0.2),
                label: Text(
                  skill,
                  style: const TextStyle(color: Colors.white),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}