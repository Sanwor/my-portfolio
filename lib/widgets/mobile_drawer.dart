import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/navigation_controller.dart';

class MobileNavigationDrawer
    extends GetView<NavigationController> {
  const MobileNavigationDrawer({super.key});

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Drawer(
      width: 310,
      backgroundColor: colorScheme.surface,
      elevation: 0,
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),

            const SizedBox(height: 20),

            Divider(
              height: 1,
              color: colorScheme.onSurface
                  .withValues(alpha: 0.09),
            ),

            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(
                  18,
                  24,
                  18,
                  24,
                ),
                itemCount: _navItems.length,
                separatorBuilder: (_, _) =>
                    const SizedBox(height: 4),
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      final isActive =
                          controller.activeIndex.value ==
                              index;

                      return _DrawerNavItem(
                        index: index + 1,
                        label: _navItems[index],
                        isActive: isActive,
                        onTap: () {
                          Navigator.of(context).pop();
                          controller
                              .scrollToSection(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),

            Divider(
              height: 1,
              color: colorScheme.onSurface
                  .withValues(alpha: 0.09),
            ),

            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        24,
        22,
        18,
        0,
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colorScheme.onSurface
                    .withValues(alpha: 0.12),
              ),
            ),
            child: Text(
              'SR',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.4,
                color: colorScheme.onSurface,
              ),
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Sanwor Rajbhandari',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Flutter Developer',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                    color: colorScheme.onSurface
                        .withValues(alpha: 0.45),
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            tooltip: 'Close menu',
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close_rounded,
              size: 20,
              color: colorScheme.onSurface
                  .withValues(alpha: 0.65),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        24,
        18,
        24,
        22,
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'AVAILABLE FOR OPPORTUNITIES',
            style: GoogleFonts.inter(
              fontSize: 8,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.25,
              color: colorScheme.onSurface
                  .withValues(alpha: 0.42),
            ),
          ),
        ],
      ),
    );
  }
}

// ================================================================
// DRAWER NAV ITEM
// ================================================================

class _DrawerNavItem extends StatefulWidget {
  final int index;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _DrawerNavItem({
    required this.index,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_DrawerNavItem> createState() =>
      _DrawerNavItemState();
}

class _DrawerNavItemState
    extends State<_DrawerNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    final baseColor = colorScheme.onSurface;

    final foreground = widget.isActive
        ? colorScheme.primary
        : baseColor.withValues(
            alpha: _isHovered ? 0.9 : 0.65,
          );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: widget.isActive
              ? colorScheme.primary.withValues(
                  alpha: 0.08,
                )
              : _isHovered
                  ? baseColor.withValues(alpha: 0.035)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 13,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 27,
                    child: Text(
                      widget.index
                          .toString()
                          .padLeft(2, '0'),
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: foreground
                            .withValues(alpha: 0.4),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      widget.label,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: widget.isActive
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: foreground,
                      ),
                    ),
                  ),

                  AnimatedOpacity(
                    duration: const Duration(
                      milliseconds: 180,
                    ),
                    opacity:
                        widget.isActive ? 1 : 0,
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 15,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}