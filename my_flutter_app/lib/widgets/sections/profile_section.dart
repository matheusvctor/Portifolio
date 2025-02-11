import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 1, end: 1),
            duration: AppTheme.defaultAnimationDuration,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [AppTheme.subtleShadow],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Matheus Victor',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.white.withOpacity(0.95),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Software Developer',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: AppTheme.cardDecoration,
          child: Text(
            'Passionate developer with experience in mobile and web development. '
            'Creating elegant solutions for complex problems.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}