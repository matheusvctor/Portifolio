import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import '../widgets/sections/profile_section.dart';
import '../widgets/sections/skills_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/timeline_section.dart';
import '../widgets/background/animated_universe_background.dart';
import '../widgets/common/scroll_indicator.dart';
import '../widgets/common/scroll_to_top_button.dart';
import '../widgets/common/navigation_indicator.dart';
import '../widgets/common/loading_indicator.dart';

class PortfolioPage extends material.StatefulWidget {
  const PortfolioPage({super.key});

  @override
  material.State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends material.State<PortfolioPage> {
  final material.ScrollController _scrollController = material.ScrollController();
  final List<material.GlobalKey> _sectionKeys = List.generate(5, (_) => material.GlobalKey());
  bool _showUpIndicator = false;
  bool _showDownIndicator = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _setupKeyboardListener();
    _preloadAssets();
  }

  Future<void> _preloadAssets() async {
    await material.precacheImage(const material.AssetImage('assets/images/profile.png'), context);
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _setupKeyboardListener() {
    RawKeyboard.instance.addListener((RawKeyEvent event) {
      if (event is RawKeyDownEvent) {
        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          setState(() => _showDownIndicator = true);
          _scrollToNextSection();
          Future.delayed(const Duration(milliseconds: 600), () {
            if (mounted) setState(() => _showDownIndicator = false);
          });
        } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          setState(() => _showUpIndicator = true);
          _scrollToPreviousSection();
          Future.delayed(const Duration(milliseconds: 600), () {
            if (mounted) setState(() => _showUpIndicator = false);
          });
        }
      }
    });
  }

  void _scrollToNextSection() {
    double? nextPosition;
    double currentScroll = _scrollController.offset;
    
    for (var key in _sectionKeys) {
      final context = key.currentContext;
      if (context != null) {
        final renderBox = context.findRenderObject() as material.RenderBox;
        final position = renderBox.localToGlobal(material.Offset.zero).dy;
        if (position > currentScroll + 100) {
          nextPosition = position - 80;
          break;
        }
      }
    }

    if (nextPosition != null) {
      _scrollController.animateTo(
        nextPosition,
        duration: const Duration(milliseconds: 600),
        curve: material.Curves.easeOutCubic,
      );
    }
  }

  void _scrollToPreviousSection() {
    double? previousPosition;
    double currentScroll = _scrollController.offset;
    
    for (var key in _sectionKeys.reversed) {
      final context = key.currentContext;
      if (context != null) {
        final renderBox = context.findRenderObject() as material.RenderBox;
        final position = renderBox.localToGlobal(material.Offset.zero).dy;
        if (position < currentScroll - 100) {
          previousPosition = position - 80;
          break;
        }
      }
    }

    if (previousPosition != null) {
      _scrollController.animateTo(
        previousPosition,
        duration: const Duration(milliseconds: 600),
        curve: material.Curves.easeOutCubic,
      );
    }
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.Stack(
      children: [
        material.Scaffold(
          extendBodyBehindAppBar: true,
          appBar: material.AppBar(
            backgroundColor: material.Colors.transparent,
            elevation: 0,
          ),
          body: material.Stack(
            children: [
              const AnimatedUniverseBackground(),
              material.SafeArea(
                child: material.LayoutBuilder(
                  builder: (context, constraints) {
                    final horizontalPadding = constraints.maxWidth > 1200 
                        ? (constraints.maxWidth - 1200) / 2 + 64 
                        : constraints.maxWidth > 768 
                            ? 64.0 
                            : 24.0;

                    return material.SingleChildScrollView(
                      controller: _scrollController,
                      physics: const material.ClampingScrollPhysics(),
                      child: material.Container(
                        padding: material.EdgeInsets.only(
                          left: horizontalPadding,
                          right: horizontalPadding,
                          top: 32.0,
                          bottom: 32.0,
                        ),
                        child: material.Column(
                          crossAxisAlignment: material.CrossAxisAlignment.start,
                          children: [
                            material.Container(key: _sectionKeys[0], child: const ProfileSection()),
                            const material.SizedBox(height: 100),
                            material.Container(key: _sectionKeys[1], child: const TimelineSection()),
                            const material.SizedBox(height: 100),
                            material.Container(key: _sectionKeys[2], child: const SkillsSection()),
                            const material.SizedBox(height: 100),
                            material.Container(key: _sectionKeys[3], child: ProjectsSection(constraints: constraints)),
                            const material.SizedBox(height: 100),
                            material.Container(key: _sectionKeys[4], child: const ContactSection()),
                            const material.SizedBox(height: 60),
                            material.Center(
                              child: material.Text(
                                '© ${DateTime.now().year} Matheus Victor',
                                style: material.TextStyle(
                                  color: material.Colors.white.withOpacity(0.5),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const material.SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ScrollIndicator(scrollController: _scrollController),
              ScrollToTopButton(scrollController: _scrollController),
              if (_showUpIndicator) const NavigationIndicator(isUp: true),
              if (_showDownIndicator) const NavigationIndicator(isUp: false),
            ],
          ),
        ),
        if (_isLoading) const LoadingIndicator(),
      ],
    );
  }
}