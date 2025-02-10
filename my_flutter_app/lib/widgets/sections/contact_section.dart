import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            Card(
              color: Colors.white.withOpacity(0.1),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.blue.withOpacity(0.7)),
                    title: const Text(
                      'your.email@example.com',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.link, color: Colors.blue.withOpacity(0.7)),
                    title: const Text(
                      'github.com/yourusername',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.blue.withOpacity(0.7)),
                    title: const Text(
                      '+1 234 567 890',
                      style: TextStyle(color: Colors.white),
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
}