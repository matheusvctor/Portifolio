import 'package:flutter/material.dart';
import 'screens/portfolio_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: AppTheme.darkTheme,
      home: const PortfolioPage(),
    );
  }
}
