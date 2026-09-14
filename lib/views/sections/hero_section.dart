import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/fades.dart';
import '../../controllers/navigation_controller.dart';
import '../../controllers/portfolio_controller.dart';

class HeroSection extends GetView<PortfolioController> {
  const HeroSection({super.key});

  static const double _maxContentWidth = 1280;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return _buildMobile(context, constraints.maxWidth);
        }

        return _buildDesktop(context, constraints.maxWidth);
      },
    );
  }

  // ============================================================
  // DESKTOP / TABLET
  // ============================================================

  Widget _buildDesktop(BuildContext context, double width) {
    final height = MediaQuery.sizeOf(context).height;
    final isCompact = width < 1000;
    final isShort = height < 760;

    final heroHeight = (height - 80).clamp(
      isCompact ? 640.0 : 680.0,
      860.0,
    ).toDouble();

    final horizontalPadding = isCompact ? 28.0 : 48.0;

    final portraitWidth = isCompact
        ? (width * 0.68).clamp(460.0, 620.0).toDouble()
        : (width * 0.60).clamp(560.0, 760.0).toDouble();

    final nameSize = isCompact
        ? (width * 0.105).clamp(72.0, 104.0).toDouble()
        : (width * 0.108).clamp(92.0, 148.0).toDouble();

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: heroHeight),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.35),
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: _maxContentWidth,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              isShort ? 18 : 28,
              horizontalPadding,
              isShort ? 24 : 34,
            ),
            child: SizedBox(
              height: heroHeight - (isShort ? 42.0 : 62.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // ------------------------------------------------
                  // Editorial eyebrow
                  // ------------------------------------------------

                  Positioned(
                    top: 0,
                    left: 0,
                    child: _fade(
                      from: const Offset(-18, 0),
                      child: _buildEyebrow(context),
                    ),
                  ),

                  // ------------------------------------------------
                  // Oversized name
                  // ------------------------------------------------

                  Positioned(
                    top: heroHeight * 0.14,
                    left: 0,
                    right: 0,
                    child: _fade(
                      from: const Offset(0, -35),
                      delay: const Duration(milliseconds: 80),
                      child: _buildDesktopName(
                        context,
                        fontSize: nameSize,
                      ),
                    ),
                  ),

                  // ------------------------------------------------
                  // Portrait
                  // ------------------------------------------------

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: isShort ? -4 : -12,
                    child: _fade(
                      from: const Offset(0, 80),
                      delay: const Duration(milliseconds: 180),
                      duration: const Duration(milliseconds: 950),
                      child: Center(
                        child: _buildPortrait(
                          width: portraitWidth,
                        ),
                      ),
                    ),
                  ),

                  // ------------------------------------------------
                  // Introduction
                  // ------------------------------------------------

                  Positioned(
                    left: 0,
                    bottom: isShort ? 4 : 12,
                    child: _fade(
                      from: const Offset(-45, 0),
                      delay: const Duration(milliseconds: 360),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isCompact ? 230 : 300,
                        ),
                        child: _buildDesktopContent(
                          context,
                          isCompact: isCompact,
                        ),
                      ),
                    ),
                  ),

                  // ------------------------------------------------
                  // Social links
                  // ------------------------------------------------

                  Positioned(
                    right: 0,
                    bottom: isShort ? 4 : 12,
                    child: _fade(
                      from: const Offset(45, 0),
                      delay: const Duration(milliseconds: 500),
                      child: _buildDesktopSocials(context),
                    ),
                  ),

                  // ------------------------------------------------
                  // Scroll cue
                  // ------------------------------------------------

                  if (!isCompact)
                    Positioned(
                      left: 0,
                      bottom: -20,
                      child: _buildScrollCue(context),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // EYEBROW
  // ============================================================

  Widget _buildEyebrow(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'FLUTTER DEVELOPER · NEPAL',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
            color: color.withValues(alpha: 0.55),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DESKTOP NAME
  // ============================================================

  Widget _buildDesktopName(
    BuildContext context, {
    required double fontSize,
  }) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final accent = Theme.of(context).colorScheme.primary;

    final nameStyle = GoogleFonts.oswald(
      fontSize: fontSize,
      fontWeight: FontWeight.w900,
      height: 0.84,
      letterSpacing: -2.0,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'SANWOR',
          textAlign: TextAlign.center,
          style: nameStyle.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2.0
              ..color = textColor.withValues(alpha: 0.9),
          ),
        ),
        Text(
          'RAJBHANDARI',
          textAlign: TextAlign.center,
          style: nameStyle.copyWith(
            color: accent.withValues(alpha: 0.95),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // PORTRAIT
  // ============================================================

  Widget _buildPortrait({
    required double width,
  }) {
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 929 / 664,
        child: Image.asset(
          'assets/images/profile_picture.png',
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }

  // ============================================================
  // DESKTOP CONTENT
  // ============================================================

  Widget _buildDesktopContent(
    BuildContext context, {
    required bool isCompact,
  }) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.role,
          style: GoogleFonts.poppins(
            fontSize: isCompact ? 21 : 25,
            fontWeight: FontWeight.w700,
            height: 1.1,
            color: textColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Building beautiful, responsive and user-focused '
          'mobile experiences with Flutter.',
          style: GoogleFonts.inter(
            fontSize: isCompact ? 11 : 12,
            height: 1.6,
            fontWeight: FontWeight.w400,
            color: textColor.withValues(alpha: 0.58),
          ),
        ),
        const SizedBox(height: 18),
        _buildCollaborateButton(context),
      ],
    );
  }

  // ============================================================
  // COLLABORATE BUTTON
  // ============================================================

  Widget _buildCollaborateButton(BuildContext context) {
    final foreground = Theme.of(context).colorScheme.surface;
    final background = Theme.of(context).colorScheme.onSurface;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.find<NavigationController>().scrollToSection(6);
        },
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 13,
          ),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Let's collaborate",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: foreground,
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.arrow_outward_rounded,
                size: 15,
                color: foreground,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SOCIAL LINKS
  // ============================================================

  Widget _buildDesktopSocials(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildSocialLink(
          context,
          icon: Icons.mail_outline_rounded,
          label: 'Email',
          url: 'mailto:${controller.email}',
        ),
        const SizedBox(height: 8),
        _buildSocialLink(
          context,
          icon: Icons.code_rounded,
          label: 'GitHub',
          url: controller.github,
        ),
        const SizedBox(height: 8),
        _buildSocialLink(
          context,
          icon: Icons.work_outline_rounded,
          label: 'LinkedIn',
          url: controller.linkedin,
        ),
      ],
    );
  }

  Widget _buildSocialLink(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String url,
  }) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return _HeroSocialButton(
      icon: icon,
      label: label,
      foregroundColor: textColor,
      borderColor: textColor.withValues(alpha: 0.16),
      onPressed: () => _launchUrl(url),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.tryParse(url);

    if (uri == null) return;

    await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
    );
  }

  // ============================================================
  // MOBILE
  // ============================================================

  Widget _buildMobile(
    BuildContext context,
    double width,
  ) {
    final height = MediaQuery.sizeOf(context).height;

    final isSmall = width < 380;
    final isShort = height < 700;

    final horizontalPadding = isSmall ? 18.0 : 22.0;

    final nameSize = (width * 0.145)
        .clamp(48.0, 62.0)
        .toDouble();

    final portraitWidth = (width * 1.02)
        .clamp(300.0, 430.0)
        .toDouble();

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: (height - 80)
            .clamp(680.0, 920.0)
            .toDouble(),
      ),
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
          isShort ? 24 : 34,
          horizontalPadding,
          28,
        ),
        child: Column(
          children: [
            // ------------------------------------------------
            // Eyebrow
            // ------------------------------------------------

            Align(
              alignment: Alignment.centerLeft,
              child: _fade(
                from: const Offset(-18, 0),
                child: _buildEyebrow(context),
              ),
            ),

            SizedBox(
              height: isShort ? 26 : 38,
            ),

            // ------------------------------------------------
            // Name
            // ------------------------------------------------

            _fade(
              from: const Offset(0, -30),
              child: _buildMobileName(
                context,
                fontSize: nameSize,
              ),
            ),

            SizedBox(
              height: isShort ? 8 : 14,
            ),

            // ------------------------------------------------
            // Portrait
            // ------------------------------------------------

            _fade(
              from: const Offset(0, 70),
              delay: const Duration(milliseconds: 150),
              duration: const Duration(milliseconds: 900),
              child: _buildPortrait(
                width: portraitWidth,
              ),
            ),

            SizedBox(
              height: isShort ? 4 : 12,
            ),

            // ------------------------------------------------
            // Content
            // ------------------------------------------------

            _fade(
              from: const Offset(0, 30),
              delay: const Duration(milliseconds: 330),
              child: _buildMobileContent(context),
            ),

            SizedBox(
              height: isShort ? 18 : 26,
            ),

            // ------------------------------------------------
            // Social links
            // ------------------------------------------------

            _fade(
              from: const Offset(0, 20),
              delay: const Duration(milliseconds: 470),
              child: _buildMobileSocials(context),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // MOBILE NAME
  // ============================================================

  Widget _buildMobileName(
    BuildContext context, {
    required double fontSize,
  }) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final accent = Theme.of(context).colorScheme.primary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'SANWOR',
          textAlign: TextAlign.center,
          style: GoogleFonts.oswald(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            height: 0.86,
            letterSpacing: -1.2,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.4
              ..color = textColor.withValues(alpha: 0.9),
          ),
        ),
        Text(
          'RAJBHANDARI',
          textAlign: TextAlign.center,
          style: GoogleFonts.oswald(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            height: 0.86,
            letterSpacing: -1.2,
            color: accent.withValues(alpha: 0.95),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // MOBILE CONTENT
  // ============================================================

  Widget _buildMobileContent(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Column(
      children: [
        Text(
          controller.role,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            height: 1.15,
            color: textColor,
          ),
        ),
        const SizedBox(height: 9),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 390,
          ),
          child: Text(
            'Building beautiful, responsive and user-focused '
            'mobile experiences with Flutter.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              height: 1.55,
              color: textColor.withValues(alpha: 0.58),
            ),
          ),
        ),
        const SizedBox(height: 17),
        _buildCollaborateButton(context),
      ],
    );
  }

  // ============================================================
  // MOBILE SOCIALS
  // ============================================================

  Widget _buildMobileSocials(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildSocialLink(
          context,
          icon: Icons.mail_outline_rounded,
          label: 'Email',
          url: 'mailto:${controller.email}',
        ),
        _buildSocialLink(
          context,
          icon: Icons.code_rounded,
          label: 'GitHub',
          url: controller.github,
        ),
        _buildSocialLink(
          context,
          icon: Icons.work_outline_rounded,
          label: 'LinkedIn',
          url: controller.linkedin,
        ),
      ],
    );
  }

  // ============================================================
  // SCROLL CUE
  // ============================================================

  Widget _buildScrollCue(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.arrow_downward_rounded,
          size: 14,
          color: textColor.withValues(alpha: 0.45),
        ),
        const SizedBox(width: 7),
        Text(
          'SCROLL TO EXPLORE',
          style: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
            color: textColor.withValues(alpha: 0.42),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // ANIMATION HELPER
  // ============================================================

  Widget _fade({
    required Offset from,
    required Widget child,
    Duration delay = Duration.zero,
    Duration duration = const Duration(
      milliseconds: 800,
    ),
  }) {
    if (from.dx != 0) {
      return FadeInRight(
        from: from.dx,
        delay: delay,
        duration: duration,
        child: child,
      );
    }

    return FadeInUp(
      from: from.dy,
      delay: delay,
      duration: duration,
      child: child,
    );
  }
}

// ============================================================
// HERO SOCIAL BUTTON
// ============================================================

class _HeroSocialButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color foregroundColor;
  final Color borderColor;
  final VoidCallback onPressed;

  const _HeroSocialButton({
    required this.icon,
    required this.label,
    required this.foregroundColor,
    required this.borderColor,
    required this.onPressed,
  });

  @override
  State<_HeroSocialButton> createState() =>
      _HeroSocialButtonState();
}

class _HeroSocialButtonState
    extends State<_HeroSocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final background = widget.foregroundColor.withValues(
      alpha: _hovered ? 0.07 : 0.025,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _hovered = true);
      },
      onExit: (_) {
        setState(() => _hovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            color: _hovered
                ? widget.foregroundColor.withValues(
                    alpha: 0.32,
                  )
                : widget.borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 10,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.icon,
                    size: 15,
                    color: widget.foregroundColor
                        .withValues(alpha: 0.75),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.label,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: widget.foregroundColor,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    Icons.arrow_outward_rounded,
                    size: 12,
                    color: widget.foregroundColor
                        .withValues(alpha: 0.5),
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