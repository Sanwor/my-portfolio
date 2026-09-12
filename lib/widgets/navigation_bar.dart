import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/navigation_controller.dart';
import '../../controllers/theme_controller.dart';
import '../../utils/breakpoints.dart';

class PortfolioNavbar extends GetView<NavigationController> {
  const PortfolioNavbar({super.key});

  static const List<String> _navItems = [
    'Home',
    'About',
    'Experience',
    'Projects',
    'Skills',
    'Education',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop =
            constraints.maxWidth >= Breakpoints.tablet;

        return Container(
          height: 78,
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .surface
                .withValues(alpha: 0.94),
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context)
                    .dividerColor
                    .withValues(alpha: 0.45),
                width: 1,
              ),
            ),
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: const ColorFilter.mode(
                Colors.transparent,
                BlendMode.srcOver,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _horizontalPadding(
                    constraints.maxWidth,
                  ),
                ),
                child: Row(
                  children: [
                    _buildLogo(context),

                    if (isDesktop) ...[
                      const Spacer(),
                      _buildDesktopNavigation(context),
                      const SizedBox(width: 20),
                      _buildThemeToggle(
                        context,
                        themeController,
                      ),
                    ] else ...[
                      const Spacer(),
                      _buildThemeToggle(
                        context,
                        themeController,
                      ),
                      const SizedBox(width: 8),
                      _buildMenuButton(context),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // LOGO
  // ============================================================

  Widget _buildLogo(BuildContext context) {
    final textColor =
        Theme.of(context).colorScheme.onSurface;

    return Semantics(
      label: 'Sanwor Rajbhandari home',
      button: true,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => controller.scrollToSection(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'SR',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                  color: textColor,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 1,
                height: 19,
                color: textColor.withValues(alpha: 0.18),
              ),
              const SizedBox(width: 10),
              Text(
                'SANWOR',
                style: GoogleFonts.inter(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: textColor.withValues(alpha: 0.48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DESKTOP NAVIGATION
  // ============================================================

  Widget _buildDesktopNavigation(BuildContext context) {
    return Obx(
      () {
        final activeIndex = controller.activeIndex.value;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            _navItems.length,
            (index) {
              return _DesktopNavItem(
                label: _navItems[index],
                isActive: activeIndex == index,
                onTap: () => controller.scrollToSection(index),
              );
            },
          ),
        );
      },
    );
  }

  // ============================================================
  // THEME TOGGLE
  // ============================================================

  Widget _buildThemeToggle(
    BuildContext context,
    ThemeController themeController,
  ) {
    return Obx(
      () {
        final isDark = themeController.isDarkMode.value;

        return _ThemeToggle(
          isDark: isDark,
          onTap: themeController.toggleTheme,
        );
      },
    );
  }

  // ============================================================
  // MOBILE / TABLET MENU
  // ============================================================

  Widget _buildMenuButton(BuildContext context) {
    final foreground =
        Theme.of(context).colorScheme.onSurface;

    return Builder(
      builder: (drawerContext) {
        return Semantics(
          label: 'Open navigation menu',
          button: true,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(11),
              onTap: () {
                Scaffold.of(drawerContext).openDrawer();
              },
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    color: foreground.withValues(alpha: 0.14),
                  ),
                ),
                child: Icon(
                  Icons.menu_rounded,
                  size: 20,
                  color: foreground,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // RESPONSIVE PADDING
  // ============================================================

  double _horizontalPadding(double width) {
    if (width >= 1400) {
      return 44;
    }

    if (width >= Breakpoints.tablet) {
      return 32;
    }

    if (width >= Breakpoints.mobile) {
      return 28;
    }

    return 18;
  }
}

// ================================================================
// DESKTOP NAV ITEM
// ================================================================

class _DesktopNavItem extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _DesktopNavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_DesktopNavItem> createState() =>
      _DesktopNavItemState();
}

class _DesktopNavItemState extends State<_DesktopNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    final baseColor = colorScheme.onSurface;

    final textColor = widget.isActive
        ? colorScheme.primary
        : baseColor.withValues(
            alpha: _isHovered ? 0.9 : 0.58,
          );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(
            horizontal: 2,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 11,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: _isHovered && !widget.isActive
                ? baseColor.withValues(alpha: 0.035)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: widget.isActive
                      ? FontWeight.w700
                      : FontWeight.w500,
                  letterSpacing: 0.05,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 5),
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 180,
                ),
                curve: Curves.easeOut,
                width: widget.isActive
                    ? 14
                    : _isHovered
                        ? 8
                        : 0,
                height: 2,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius:
                      BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================================================================
// THEME TOGGLE
// ================================================================

class _ThemeToggle extends StatefulWidget {
  final bool isDark;
  final VoidCallback onTap;

  const _ThemeToggle({
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_ThemeToggle> createState() =>
      _ThemeToggleState();
}

class _ThemeToggleState extends State<_ThemeToggle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    final foreground = colorScheme.onSurface;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
      },
      child: Semantics(
        label: widget.isDark
            ? 'Switch to light theme'
            : 'Switch to dark theme',
        button: true,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(11),
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              width: 44,
              height: 42,
              decoration: BoxDecoration(
                color: _isHovered
                    ? foreground.withValues(alpha: 0.07)
                    : foreground.withValues(alpha: 0.025),
                border: Border.all(
                  color: foreground.withValues(
                    alpha: _isHovered ? 0.24 : 0.14,
                  ),
                ),
                borderRadius:
                    BorderRadius.circular(11),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(
                  milliseconds: 220,
                ),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder:
                    (child, animation) {
                  return RotationTransition(
                    turns: Tween<double>(
                      begin: 0.75,
                      end: 1,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: Icon(
                  widget.isDark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  key: ValueKey(widget.isDark),
                  size: 18,
                  color: foreground.withValues(
                    alpha: 0.78,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}