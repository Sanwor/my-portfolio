import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/portfolio_controller.dart';
import '../../utils/breakpoints.dart';
import '../../utils/constants.dart';
import '../../utils/fades.dart';

class ContactSection extends GetView<PortfolioController> {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width < Breakpoints.mobile) {
          return _buildMobile(context, width);
        }

        return _buildDesktop(context, width);
      },
    );
  }

  // ============================================================
  // DESKTOP / TABLET
  // ============================================================

  Widget _buildDesktop(
    BuildContext context,
    double width,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    final isTablet = width < Breakpoints.tablet;

    final horizontalPadding = isTablet ? 32.0 : 48.0;
    final verticalPadding = isTablet ? 78.0 : 100.0;

    final titleSize = isTablet ? 58.0 : 78.0;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context)
                .dividerColor
                .withValues(alpha: 0.35),
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ------------------------------------------------
                // SECTION LABEL
                // ------------------------------------------------

                FadeInRight(
                  from: 24,
                  child: _buildSectionLabel(context),
                ),

                const SizedBox(height: 28),

                // ------------------------------------------------
                // MAIN CONTACT AREA
                // ------------------------------------------------

                FadeInUp(
                  from: 35,
                  delay: const Duration(
                    milliseconds: 100,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // ------------------------------------------
                      // LEFT — LARGE MESSAGE
                      // ------------------------------------------

                      Expanded(
                        flex: 6,
                        child: _buildDesktopIntro(
                          context,
                          titleSize: titleSize,
                        ),
                      ),

                      SizedBox(
                        width: isTablet ? 55 : 90,
                      ),

                      // ------------------------------------------
                      // RIGHT — CONTACT LINKS
                      // ------------------------------------------

                      Expanded(
                        flex: 4,
                        child: _buildContactLinks(
                          context,
                          compact: isTablet,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: isTablet ? 72 : 92,
                ),

                // ------------------------------------------------
                // DIVIDER
                // ------------------------------------------------

                FadeInUp(
                  from: 20,
                  delay: const Duration(
                    milliseconds: 220,
                  ),
                  child: Divider(
                    height: 1,
                    color: colorScheme.onSurface.withValues(
                      alpha: 0.12,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // ------------------------------------------------
                // FOOTER
                // ------------------------------------------------

                FadeInUp(
                  from: 20,
                  delay: const Duration(
                    milliseconds: 280,
                  ),
                  child: _buildFooter(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // MOBILE
  // ============================================================

  Widget _buildMobile(
    BuildContext context,
    double width,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    final horizontalPadding = width < 380 ? 20.0 : 22.0;

    final titleSize = width < 360 ? 48.0 : 54.0;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context)
                .dividerColor
                .withValues(alpha: 0.35),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          horizontalPadding,
          72,
          horizontalPadding,
          28,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------------------------------------------------
            // SECTION LABEL
            // --------------------------------------------------

            FadeInRight(
              from: 20,
              child: _buildSectionLabel(context),
            ),

            const SizedBox(height: 24),

            // --------------------------------------------------
            // MAIN INTRO
            // --------------------------------------------------

            FadeInUp(
              from: 30,
              delay: const Duration(
                milliseconds: 80,
              ),
              child: _buildMobileIntro(
                context,
                titleSize: titleSize,
              ),
            ),

            const SizedBox(height: 44),

            // --------------------------------------------------
            // CONTACT LINKS
            // --------------------------------------------------

            FadeInUp(
              from: 30,
              delay: const Duration(
                milliseconds: 160,
              ),
              child: _buildContactLinks(
                context,
                compact: true,
              ),
            ),

            const SizedBox(height: 48),

            // --------------------------------------------------
            // DIVIDER
            // --------------------------------------------------

            FadeInUp(
              from: 20,
              delay: const Duration(
                milliseconds: 220,
              ),
              child: Divider(
                height: 1,
                color: colorScheme.onSurface.withValues(
                  alpha: 0.12,
                ),
              ),
            ),

            const SizedBox(height: 22),

            // --------------------------------------------------
            // FOOTER
            // --------------------------------------------------

            FadeInUp(
              from: 20,
              delay: const Duration(
                milliseconds: 260,
              ),
              child: _buildFooter(context),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SECTION LABEL
  // ============================================================

  Widget _buildSectionLabel(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 10),

        Text(
          'CONTACT',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
            color: colorScheme.onSurface.withValues(
              alpha: 0.48,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DESKTOP INTRO
  // ============================================================

  Widget _buildDesktopIntro(
    BuildContext context, {
    required double titleSize,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "GET IN TOUCH",
          style: GoogleFonts.oswald(
            fontSize: titleSize,
            fontWeight: FontWeight.w800,
            height: 0.9,
            letterSpacing: -1.5,
            color: colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: 28),

        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 520,
          ),
          child: Text(
            'Interested in working together or have a question?',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 1.55,
              color: colorScheme.onSurface.withValues(
                alpha: 0.62,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // MOBILE INTRO
  // ============================================================

  Widget _buildMobileIntro(
    BuildContext context, {
    required double titleSize,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "GET IN TOUCH",
          style: GoogleFonts.oswald(
            fontSize: titleSize,
            fontWeight: FontWeight.w800,
            height: 0.9,
            letterSpacing: -1.2,
            color: colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: 22),

        Text(
          'Interested in working together or have a question?',
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 1.6,
            color: colorScheme.onSurface.withValues(
              alpha: 0.62,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CONTACT LINKS
  // ============================================================

  Widget _buildContactLinks(
    BuildContext context, {
    required bool compact,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactLink(
          context,
          label: 'EMAIL',
          value: controller.email,
          icon: Icons.mail_outline_rounded,
          url: 'mailto:${controller.email}',
          compact: compact,
        ),

        const SizedBox(height: 12),

        _buildContactLink(
          context,
          label: 'GITHUB',
          value: 'View my work',
          icon: Icons.code_rounded,
          url: controller.github,
          compact: compact,
        ),

        const SizedBox(height: 12),

        _buildContactLink(
          context,
          label: 'LINKEDIN',
          value: 'Connect with me',
          icon: Icons.business_center_outlined,
          url: controller.linkedin,
          compact: compact,
        ),
      ],
    );
  }

  // ============================================================
  // CONTACT LINK
  // ============================================================

  Widget _buildContactLink(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    required String url,
    required bool compact,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return _ContactLink(
      label: label,
      value: value,
      icon: icon,
      url: url,
      compact: compact,
      colorScheme: colorScheme,
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter(BuildContext context) {
    // ignore: unused_local_variable
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 520;

        if (isNarrow) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCopyright(context),
              const SizedBox(height: 8),
              _buildBuiltWith(context),
            ],
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCopyright(context),
            _buildBuiltWith(context),
          ],
        );
      },
    );
  }

  Widget _buildCopyright(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      '© 2026 Sanwor Prasad Rajbhandari',
      style: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.6,
        color: colorScheme.onSurface.withValues(
          alpha: 0.42,
        ),
      ),
    );
  }

  Widget _buildBuiltWith(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'BUILT WITH',
          style: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: colorScheme.onSurface.withValues(
              alpha: 0.36,
            ),
          ),
        ),

        const SizedBox(width: 5),

        Text(
          'FLUTTER',
          style: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: colorScheme.onSurface.withValues(
              alpha: 0.42,
            ),
          ),
        ),
      ],
    );
  }
}

// ==================================================================
// CONTACT LINK WIDGET
// ==================================================================

class _ContactLink extends StatefulWidget {
  final String label;
  final String value;
  final IconData icon;
  final String url;
  final bool compact;
  final ColorScheme colorScheme;

  const _ContactLink({
    required this.label,
    required this.value,
    required this.icon,
    required this.url,
    required this.compact,
    required this.colorScheme,
  });

  @override
  State<_ContactLink> createState() => _ContactLinkState();
}

class _ContactLinkState extends State<_ContactLink> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final uri = Uri.tryParse(widget.url);

    if (uri == null) return;

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        webOnlyWindowName: '_blank',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = widget.colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        if (!widget.compact) {
          setState(() {
            _isHovered = true;
          });
        }
      },
      onExit: (_) {
        if (!widget.compact) {
          setState(() {
            _isHovered = false;
          });
        }
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _launchUrl,
          borderRadius: BorderRadius.circular(6),
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 180,
            ),
            curve: Curves.easeOut,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: widget.compact ? 14 : 16,
              vertical: widget.compact ? 13 : 15,
            ),
            decoration: BoxDecoration(
              color: _isHovered
                  ? colorScheme.onSurface.withValues(
                      alpha: 0.035,
                    )
                  : Colors.transparent,
              border: Border.all(
                color: _isHovered
                    ? colorScheme.primary.withValues(
                        alpha: 0.30,
                      )
                    : colorScheme.onSurface.withValues(
                        alpha: 0.10,
                      ),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                // ------------------------------------------------
                // ICON
                // ------------------------------------------------

                Icon(
                  widget.icon,
                  size: widget.compact ? 17 : 18,
                  color: _isHovered
                      ? colorScheme.primary
                      : colorScheme.onSurface.withValues(
                          alpha: 0.58,
                        ),
                ),

                SizedBox(
                  width: widget.compact ? 12 : 14,
                ),

                // ------------------------------------------------
                // TEXT
                // ------------------------------------------------

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.4,
                          color: colorScheme.onSurface.withValues(
                            alpha: 0.40,
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        widget.value,
                        maxLines: widget.label == 'EMAIL'
                            ? 2
                            : 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: widget.compact ? 12 : 13,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                          color: _isHovered
                              ? colorScheme.primary
                              : colorScheme.onSurface.withValues(
                                  alpha: 0.72,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                // ------------------------------------------------
                // ARROW
                // ------------------------------------------------

                AnimatedSlide(
                  duration: const Duration(
                    milliseconds: 180,
                  ),
                  offset: _isHovered
                      ? const Offset(0.15, 0)
                      : Offset.zero,
                  child: Icon(
                    Icons.arrow_outward_rounded,
                    size: 15,
                    color: _isHovered
                        ? colorScheme.primary
                        : colorScheme.onSurface.withValues(
                            alpha: 0.35,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
