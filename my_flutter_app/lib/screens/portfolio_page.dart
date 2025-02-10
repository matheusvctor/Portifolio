import 'package:flutter/material.dart';
import '../widgets/sections/profile_section.dart';
import '../widgets/sections/skills_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/background/animated_universe_background.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const AnimatedUniverseBackground(),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppBar().preferredSize.height + 20),
                      const ProfileSection(),
                      const SizedBox(height: 32),
                      const SkillsSection(),
                      const SizedBox(height: 32),
                      ProjectsSection(constraints: constraints),
                      const SizedBox(height: 32),
                      const ContactSection(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}