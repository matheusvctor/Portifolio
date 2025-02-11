import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../common/hover_container.dart';

class ProjectsSection extends StatelessWidget {
  final BoxConstraints constraints;

  const ProjectsSection({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Projects',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white.withOpacity(0.95),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          constraints: const BoxConstraints(maxWidth: 900),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth > 600 ? 2 : 1,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 1.6,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return HoverContainer(
                duration: AppTheme.defaultAnimationDuration,
                child: Container(
                  decoration: AppTheme.cardDecoration,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Project ${index + 1}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Description of the project. This is where you can describe what the project does and what technologies were used.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const Spacer(),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white.withOpacity(0.5),
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'View Project',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}