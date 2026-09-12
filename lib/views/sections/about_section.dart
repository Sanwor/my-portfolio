import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utils/breakpoints.dart';

import '../../controllers/portfolio_controller.dart';
import '../../utils/constants.dart';
import '../../utils/fades.dart';

class AboutSection extends GetView<PortfolioController> {
  const AboutSection({super.key});

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
    final isTablet = width < Breakpoints.tablet;

    final horizontalPadding = isTablet ? 32.0 : 48.0;

    final titleSize = isTablet ? 54.0 : 72.0;

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
              vertical: isTablet ? 78 : 110,
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

                const SizedBox(height: 26),

                // ------------------------------------------------
                // INTRO
                // ------------------------------------------------

                FadeInUp(
                  from: 35,
                  delay: const Duration(
                    milliseconds: 100,
                  ),
                  child: _buildDesktopIntro(
                    context,
                    titleSize: titleSize,
                    isTablet: isTablet,
                  ),
                ),

                SizedBox(
                  height: isTablet ? 58 : 78,
                ),

                // ------------------------------------------------
                // STORY + STATS
                // ------------------------------------------------

                FadeInUp(
                  from: 45,
                  delay: const Duration(
                    milliseconds: 180,
                  ),
                  child: _buildStoryRow(
                    context,
                    isTablet: isTablet,
                  ),
                ),

                SizedBox(
                  height: isTablet ? 60 : 82,
                ),

                // ------------------------------------------------
                // PRINCIPLES
                // ------------------------------------------------

                FadeInUp(
                  from: 45,
                  delay: const Duration(
                    milliseconds: 300,
                  ),
                  child: _buildPrinciples(
                    context,
                    isTablet: isTablet,
                  ),
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
    final horizontalPadding = width < 380 ? 20.0 : 22.0;

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
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 72,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInRight(
              from: 20,
              child: _buildSectionLabel(context),
            ),

            const SizedBox(height: 24),

            FadeInUp(
              from: 30,
              delay: const Duration(
                milliseconds: 80,
              ),
              child: _buildMobileIntro(context),
            ),

            const SizedBox(height: 42),

            FadeInUp(
              from: 35,
              delay: const Duration(
                milliseconds: 160,
              ),
              child: _buildMobileStats(context),
            ),

            const SizedBox(height: 46),

            FadeInUp(
              from: 35,
              delay: const Duration(
                milliseconds: 240,
              ),
              child: _buildMobileStory(context),
            ),

            const SizedBox(height: 48),

            FadeInUp(
              from: 35,
              delay: const Duration(
                milliseconds: 320,
              ),
              child: _buildMobilePrinciples(context),
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
    final colorScheme =
        Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '01 / ABOUT',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.8,
            color: colorScheme.onSurface
                .withValues(alpha: 0.48),
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
    required bool isTablet,
  }) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I BUILD DIGITAL',
          style: GoogleFonts.oswald(
            fontSize: titleSize,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1.5,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          'EXPERIENCES WITH',
          style: GoogleFonts.oswald(
            fontSize: titleSize,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1.5,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          'CLARITY & PURPOSE.',
          style: GoogleFonts.oswald(
            fontSize: titleSize,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1.5,
            color: colorScheme.primary,
          ),
        ),

        SizedBox(
          height: isTablet ? 18 : 22,
        ),

        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isTablet ? 620 : 760,
          ),
          child: Text(
            'I’m a Flutter developer focused on turning '
            'ideas into reliable, responsive and '
            'thoughtfully crafted mobile experiences.',
            style: GoogleFonts.inter(
              fontSize: isTablet ? 16 : 18,
              height: 1.55,
              fontWeight: FontWeight.w400,
              color: colorScheme.onSurface
                  .withValues(alpha: 0.56),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // MOBILE INTRO
  // ============================================================

  Widget _buildMobileIntro(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I BUILD DIGITAL',
          style: GoogleFonts.oswald(
            fontSize: 50,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          'EXPERIENCES WITH',
          style: GoogleFonts.oswald(
            fontSize: 50,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          'CLARITY.',
          style: GoogleFonts.oswald(
            fontSize: 50,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Flutter developer focused on building '
          'reliable, responsive and thoughtful '
          'mobile experiences.',
          style: GoogleFonts.inter(
            fontSize: 14,
            height: 1.6,
            color: colorScheme.onSurface
                .withValues(alpha: 0.56),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // STORY + STATS
  // ============================================================

  Widget _buildStoryRow(
    BuildContext context, {
    required bool isTablet,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: isTablet ? 6 : 7,
          child: _buildStory(context),
        ),
        SizedBox(
          width: isTablet ? 42 : 80,
        ),
        Expanded(
          flex: isTablet ? 4 : 3,
          child: _buildStats(context),
        ),
      ],
    );
  }

  // ============================================================
  // STORY
  // ============================================================

  Widget _buildStory(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    final paragraphs = controller.aboutMe
        .split('\n\n')
        .where((text) => text.trim().isNotEmpty)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A LITTLE MORE ABOUT ME',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.6,
            color: colorScheme.onSurface
                .withValues(alpha: 0.42),
          ),
        ),

        const SizedBox(height: 20),

        ...paragraphs.map(
          (paragraph) => Padding(
            padding: const EdgeInsets.only(
              bottom: 18,
            ),
            child: Text(
              paragraph,
              style: GoogleFonts.inter(
                fontSize: 16,
                height: 1.75,
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface
                    .withValues(alpha: 0.68),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // STATS
  // ============================================================

  Widget _buildStats(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context)
                .dividerColor
                .withValues(alpha: 0.6),
          ),
          bottom: BorderSide(
            color: Theme.of(context)
                .dividerColor
                .withValues(alpha: 0.6),
          ),
        ),
      ),
      child: Column(
        children: [
          _buildStat(
            context,
            value: '15+',
            label: 'MONTHS OF PRODUCTION EXPERIENCE',
          ),
          _buildStat(
            context,
            value: 'FLUTTER',
            label: 'PRIMARY DEVELOPMENT STACK',
          ),
          _buildStat(
            context,
            value: '2026',
            label: 'BACHELOR IN INFORMATION TECHNOLOGY',
          ),
          _buildStat(
            context,
            value: 'NEPAL',
            label: 'BASED IN BHaktapur',
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildStat(
    BuildContext context, {
    required String value,
    required String label,
    bool isLast = false,
  }) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: isLast
          ? null
          : BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: colorScheme.onSurface
                      .withValues(alpha: 0.08),
                ),
              ),
            ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: GoogleFonts.oswald(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              height: 1,
              letterSpacing: -0.3,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 8,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
              height: 1.35,
              color: colorScheme.onSurface
                  .withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PRINCIPLES
  // ============================================================

  Widget _buildPrinciples(
    BuildContext context, {
    required bool isTablet,
  }) {
    final principles = [
      (
        number: '01',
        title: 'USER FIRST',
        description:
            'Interfaces should feel natural, clear and '
            'easy to navigate—not just technically correct.',
      ),
      (
        number: '02',
        title: 'SOLID ENGINEERING',
        description:
            'I value maintainable architecture, clean '
            'state management and dependable integrations.',
      ),
      (
        number: '03',
        title: 'DETAIL MATTERS',
        description:
            'Responsive behavior, performance and small '
            'interaction details are part of the product.',
      ),
    ];

    if (isTablet) {
      return Column(
        children: principles
            .map(
              (principle) => Padding(
                padding: const EdgeInsets.only(
                  bottom: 12,
                ),
                child: _buildPrinciple(
                  context,
                  number: principle.number,
                  title: principle.title,
                  description: principle.description,
                ),
              ),
            )
            .toList(),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: principles
          .map(
            (principle) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                ),
                child: _buildPrinciple(
                  context,
                  number: principle.number,
                  title: principle.title,
                  description: principle.description,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildPrinciple(
    BuildContext context, {
    required String number,
    required String title,
    required String description,
  }) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        20,
        20,
        20,
        22,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.onSurface
              .withValues(alpha: 0.1),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                number,
                style: GoogleFonts.inter(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  color: colorScheme.primary,
                ),
              ),
              Icon(
                Icons.arrow_outward_rounded,
                size: 14,
                color: colorScheme.onSurface
                    .withValues(alpha: 0.3),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.1,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 11,
              height: 1.6,
              color: colorScheme.onSurface
                  .withValues(alpha: 0.52),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MOBILE STATS
  // ============================================================

  Widget _buildMobileStats(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.onSurface
                .withValues(alpha: 0.12),
          ),
          bottom: BorderSide(
            color: colorScheme.onSurface
                .withValues(alpha: 0.12),
          ),
        ),
      ),
      child: Column(
        children: [
          _buildMobileStat(
            context,
            value: '15+',
            label: 'MONTHS PRODUCTION EXPERIENCE',
          ),
          _buildMobileStat(
            context,
            value: 'FLUTTER',
            label: 'PRIMARY DEVELOPMENT STACK',
          ),
          _buildMobileStat(
            context,
            value: '2026',
            label: 'BACHELOR IN INFORMATION TECHNOLOGY',
          ),
          _buildMobileStat(
            context,
            value: 'NEPAL',
            label: 'BASED IN BHaktapur',
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileStat(
    BuildContext context, {
    required String value,
    required String label,
    bool isLast = false,
  }) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 17,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              value,
              style: GoogleFonts.oswald(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 8,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                height: 1.35,
                color: colorScheme.onSurface
                    .withValues(alpha: 0.42),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MOBILE STORY
  // ============================================================

  Widget _buildMobileStory(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    final paragraphs = controller.aboutMe
        .split('\n\n')
        .where((text) => text.trim().isNotEmpty)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A LITTLE MORE ABOUT ME',
          style: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: colorScheme.onSurface
                .withValues(alpha: 0.42),
          ),
        ),
        const SizedBox(height: 17),
        ...paragraphs.map(
          (paragraph) => Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: Text(
              paragraph,
              style: GoogleFonts.inter(
                fontSize: 14,
                height: 1.7,
                color: colorScheme.onSurface
                    .withValues(alpha: 0.65),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // MOBILE PRINCIPLES
  // ============================================================

  Widget _buildMobilePrinciples(BuildContext context) {
    final principles = [
      (
        number: '01',
        title: 'USER FIRST',
        description:
            'Clear interfaces and natural interactions.',
      ),
      (
        number: '02',
        title: 'SOLID ENGINEERING',
        description:
            'Maintainable code and dependable integrations.',
      ),
      (
        number: '03',
        title: 'DETAIL MATTERS',
        description:
            'Responsive behavior, performance and polish.',
      ),
    ];

    return Column(
      children: principles
          .map(
            (principle) => Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: _buildPrinciple(
                context,
                number: principle.number,
                title: principle.title,
                description: principle.description,
              ),
            ),
          )
          .toList(),
    );
  }
}