import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}