import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_theme.dart';
import '../common/hover_container.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white.withOpacity(0.95),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          decoration: AppTheme.cardDecoration,
          child: Column(
            children: [
              _buildContactItem(
                context,
                Icons.email_outlined,
                'matheusrochamil203@gmail.com',
                url: 'mailto:matheusrochamil203@gmail.com',
              ),
              _buildDivider(),
              _buildContactItem(
                context,
                Icons.code,
                'github.com/matheusvctor',
                url: 'https://github.com/matheusvctor',
              ),
              _buildDivider(),
              _buildContactItem(
                context,
                Icons.phone_outlined,
                '(83) 9 8135-1770',
                url: 'tel:+5583981351770',
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    IconData icon,
    String text, {
    String? url,
    bool isLast = false,
  }) {
    return HoverContainer(
      elevate: false,
      duration: AppTheme.defaultAnimationDuration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: url != null ? () => _launchURL(url) : null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white.withOpacity(0.7),
                  size: 20,
                ),
                const SizedBox(width: 16),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const Spacer(),
                if (url != null)
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(0.3),
                    size: 16,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: Colors.white.withOpacity(0.1),
    );
  }
}