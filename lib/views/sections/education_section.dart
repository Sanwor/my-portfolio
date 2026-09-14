import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/portfolio_controller.dart';
import '../../utils/breakpoints.dart';
import '../../utils/constants.dart';
import '../../utils/fades.dart';

class EducationSection extends GetView<PortfolioController> {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width < Breakpoints.mobile) {
          return _buildMobile(
            context,
            width,
          );
        }

        return _buildDesktop(
          context,
          width,
        );
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
    final colorScheme =
        Theme.of(context).colorScheme;

    final isTablet = width < Breakpoints.tablet;

    final horizontalPadding =
        isTablet ? 32.0 : 48.0;

    final headingSize =
        isTablet ? 54.0 : 72.0;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:
            Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: colorScheme.onSurface.withValues(
              alpha: 0.35,
            ),
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
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                // ------------------------------------------------
                // SECTION LABEL
                // ------------------------------------------------

                FadeInRight(
                  from: 24,
                  child: _buildSectionLabel(
                    context,
                  ),
                ),

                const SizedBox(height: 26),

                // ------------------------------------------------
                // HEADING + INTRO
                // ------------------------------------------------

                FadeInUp(
                  from: 35,
                  delay: const Duration(
                    milliseconds: 100,
                  ),
                  child: _buildIntro(
                    context,
                    headingSize: headingSize,
                    isTablet: isTablet,
                  ),
                ),

                SizedBox(
                  height: isTablet ? 58 : 78,
                ),

                // ------------------------------------------------
                // EDUCATION RECORD
                // ------------------------------------------------

                FadeInUp(
                  from: 45,
                  delay: const Duration(
                    milliseconds: 180,
                  ),
                  child: _buildEducationRecord(
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
    final colorScheme =
        Theme.of(context).colorScheme;

    final horizontalPadding =
        width < 380 ? 20.0 : 22.0;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:
            Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: colorScheme.onSurface.withValues(
              alpha: 0.35,
            ),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 72,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // ------------------------------------------------
            // SECTION LABEL
            // ------------------------------------------------

            FadeInRight(
              from: 20,
              child: _buildSectionLabel(
                context,
              ),
            ),

            const SizedBox(height: 24),

            // ------------------------------------------------
            // HEADING
            // ------------------------------------------------

            FadeInUp(
              from: 30,
              delay: const Duration(
                milliseconds: 80,
              ),
              child: _buildMobileIntro(
                context,
              ),
            ),

            const SizedBox(height: 44),

            // ------------------------------------------------
            // EDUCATION
            // ------------------------------------------------

            FadeInUp(
              from: 35,
              delay: const Duration(
                milliseconds: 160,
              ),
              child: _buildMobileEducation(
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SECTION LABEL
  // ============================================================

  Widget _buildSectionLabel(
    BuildContext context,
  ) {
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
          '03 / EDUCATION',
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

  Widget _buildIntro(
    BuildContext context, {
    required double headingSize,
    required bool isTablet,
  }) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          'WHERE I',
          style: GoogleFonts.oswald(
            fontSize: headingSize,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1.5,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          'BUILT MY',
          style: GoogleFonts.oswald(
            fontSize: headingSize,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1.5,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          'FOUNDATION.',
          style: GoogleFonts.oswald(
            fontSize: headingSize,
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
            maxWidth: isTablet ? 600 : 700,
          ),
          child: Text(
            'An academic foundation in information technology '
            'that shaped the way I approach software, problem '
            'solving and product development.',
            style: GoogleFonts.inter(
              fontSize: isTablet ? 16 : 18,
              height: 1.55,
              fontWeight: FontWeight.w400,
              color: colorScheme.onSurface.withValues(
                alpha: 0.56,
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
    BuildContext context,
  ) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          'WHERE I',
          style: GoogleFonts.oswald(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          'BUILT MY',
          style: GoogleFonts.oswald(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          'FOUNDATION.',
          style: GoogleFonts.oswald(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            height: 0.9,
            letterSpacing: -1,
            color: colorScheme.primary,
          ),
        ),

        const SizedBox(height: 18),

        Text(
          'An academic foundation in information technology '
          'that shaped the way I approach software, problem '
          'solving and product development.',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.7,
            color: colorScheme.onSurface.withValues(
              alpha: 0.60,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DESKTOP / TABLET EDUCATION RECORD
  // ============================================================

  Widget _buildEducationRecord(
    BuildContext context, {
    required bool isTablet,
  }) {
    final colorScheme =
        Theme.of(context).colorScheme;

    if (isTablet) {
      return _buildTabletEducation(
        context,
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.onSurface.withValues(
              alpha: 0.14,
            ),
          ),
          bottom: BorderSide(
            color: colorScheme.onSurface.withValues(
              alpha: 0.14,
            ),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          // ------------------------------------------------------
          // YEAR
          // ------------------------------------------------------

          SizedBox(
            width: 110,
            child: _buildYear(
              context,
            ),
          ),

          // ------------------------------------------------------
          // VERTICAL DIVIDER
          // ------------------------------------------------------

          Container(
            width: 1,
            height: 120,
            margin: const EdgeInsets.only(
              right: 40,
            ),
            color: colorScheme.onSurface.withValues(
              alpha: 0.12,
            ),
          ),

          // ------------------------------------------------------
          // EDUCATION INFORMATION
          // ------------------------------------------------------

          Expanded(
            child: _buildEducationInformation(
              context,
              compact: false,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TABLET EDUCATION
  // ============================================================

  Widget _buildTabletEducation(
    BuildContext context,
  ) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 28,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.onSurface.withValues(
              alpha: 0.14,
            ),
          ),
          bottom: BorderSide(
            color: colorScheme.onSurface.withValues(
              alpha: 0.14,
            ),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: _buildYear(
              context,
            ),
          ),

          Container(
            width: 1,
            height: 130,
            margin: const EdgeInsets.only(
              right: 28,
            ),
            color: colorScheme.onSurface.withValues(
              alpha: 0.12,
            ),
          ),

          Expanded(
            child: _buildEducationInformation(
              context,
              compact: true,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // YEAR
  // ============================================================

  Widget _buildYear(
    BuildContext context,
  ) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          controller.graduationYear,
          style: GoogleFonts.oswald(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            height: 1,
            letterSpacing: -0.5,
            color: colorScheme.primary,
          ),
        ),

        const SizedBox(height: 7),

        Text(
          'GRADUATED',
          style: GoogleFonts.inter(
            fontSize: 8,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
            color: colorScheme.onSurface.withValues(
              alpha: 0.42,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // EDUCATION INFORMATION
  // ============================================================

  Widget _buildEducationInformation(
    BuildContext context, {
    required bool compact,
  }) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        // ------------------------------------------------------
        // DEGREE
        // ------------------------------------------------------

        Text(
          controller.degree,
          style: GoogleFonts.oswald(
            fontSize: compact ? 30 : 34,
            fontWeight: FontWeight.w500,
            height: 1.05,
            letterSpacing: -0.4,
            color: colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: 12),

        // ------------------------------------------------------
        // INSTITUTION
        // ------------------------------------------------------

        Text(
          controller.institution,
          style: GoogleFonts.inter(
            fontSize: compact ? 14 : 15,
            fontWeight: FontWeight.w500,
            height: 1.5,
            color: colorScheme.onSurface.withValues(
              alpha: 0.72,
            ),
          ),
        ),

        const SizedBox(height: 18),

        // ------------------------------------------------------
        // STATUS
        // ------------------------------------------------------

        Row(
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

            const SizedBox(width: 9),

            Text(
              'BACHELOR\'S DEGREE · COMPLETED',
              style: GoogleFonts.inter(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.15,
                color: colorScheme.onSurface.withValues(
                  alpha: 0.44,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // MOBILE EDUCATION
  // ============================================================

  Widget _buildMobileEducation(
    BuildContext context,
  ) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 28,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.onSurface.withValues(
              alpha: 0.14,
            ),
          ),
          bottom: BorderSide(
            color: colorScheme.onSurface.withValues(
              alpha: 0.14,
            ),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          // ----------------------------------------------------
          // YEAR
          // ----------------------------------------------------

          Row(
            crossAxisAlignment:
                CrossAxisAlignment.end,
            children: [
              Text(
                controller.graduationYear,
                style: GoogleFonts.oswald(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  height: 1,
                  color: colorScheme.primary,
                ),
              ),

              const SizedBox(width: 12),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 4,
                ),
                child: Text(
                  'GRADUATED',
                  style: GoogleFonts.inter(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.4,
                    color: colorScheme.onSurface
                        .withValues(alpha: 0.42),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // ----------------------------------------------------
          // DEGREE
          // ----------------------------------------------------

          Text(
            controller.degree,
            style: GoogleFonts.oswald(
              fontSize: 29,
              fontWeight: FontWeight.w500,
              height: 1.08,
              letterSpacing: -0.3,
              color: colorScheme.onSurface,
            ),
          ),

          const SizedBox(height: 12),

          // ----------------------------------------------------
          // INSTITUTION
          // ----------------------------------------------------

          Text(
            controller.institution,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              height: 1.55,
              color: colorScheme.onSurface.withValues(
                alpha: 0.72,
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ----------------------------------------------------
          // STATUS
          // ----------------------------------------------------

          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 4,
                ),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 9),

              Expanded(
                child: Text(
                  'BACHELOR\'S DEGREE · COMPLETED',
                  style: GoogleFonts.inter(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.05,
                    height: 1.4,
                    color: colorScheme.onSurface
                        .withValues(alpha: 0.44),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
