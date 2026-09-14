import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/portfolio_controller.dart';
import '../../utils/breakpoints.dart';
import '../../utils/constants.dart';
import '../../utils/fades.dart';
import '../../widgets/experience_card.dart';

class ExperienceSection extends GetView<PortfolioController> {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < Breakpoints.mobile;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context)
                    .dividerColor
                    .withValues(alpha: 0.35),
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? AppSpacing.md : AppSpacing.lg,
            vertical: isMobile ? 72 : 110,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSpacing.maxContentWidth,
              ),
              child: isMobile
                  ? _buildMobileLayout(context)
                  : _buildDesktopLayout(context, constraints.maxWidth),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    double availableWidth,
  ) {
    final isTablet = availableWidth < Breakpoints.tablet;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionLabel(context),
        const SizedBox(height: 22),

        FadeInUp(
          duration: const Duration(milliseconds: 900),
          child: _buildHeading(
            context,
            fontSize: isTablet ? 52 : 68,
          ),
        ),

        const SizedBox(height: 24),

        FadeInUp(
          delay: const Duration(milliseconds: 100),
          child: SizedBox(
            width: isTablet ? 560 : 650,
            child: Text(
              'From my first Flutter internship to building '
              'production applications, each role has shaped '
              'how I approach product development.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: isTablet ? 17 : 18,
                    height: 1.7,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.68),
                  ),
            ),
          ),
        ),

        SizedBox(height: isTablet ? 64 : 84),

        _buildTimeline(
          context,
          isMobile: false,
          isTablet: isTablet,
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionLabel(context),
        const SizedBox(height: 18),

        FadeInUp(
          duration: const Duration(milliseconds: 900),
          child: _buildHeading(
            context,
            fontSize: 46,
            mobile: true,
          ),
        ),

        const SizedBox(height: 20),

        FadeInUp(
          delay: const Duration(milliseconds: 100),
          child: Text(
            'From my first Flutter internship to production '
            'development, each role has shaped how I build '
            'digital products.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  height: 1.65,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.68),
                ),
          ),
        ),

        const SizedBox(height: 52),

        _buildTimeline(
          context,
          isMobile: true,
          isTablet: false,
        ),
      ],
    );
  }

  Widget _buildSectionLabel(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: accent,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '02 / EXPERIENCE',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.2,
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.55),
          ),
        ),
      ],
    );
  }

  Widget _buildHeading(
    BuildContext context, {
    required double fontSize,
    bool mobile = false,
  }) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    final accent = Theme.of(context).colorScheme.primary;

    return RichText(
      text: TextSpan(
        style: GoogleFonts.oswald(
          fontSize: fontSize,
          height: 0.98,
          fontWeight: FontWeight.w500,
          letterSpacing: -1.2,
          color: textColor,
        ),
        children: [
          const TextSpan(
            text: 'PROFESSIONAL\n',
          ),
          TextSpan(
            text: mobile ? 'JOURNEY.' : 'JOURNEY SO FAR.',
            style: GoogleFonts.oswald(
              fontSize: fontSize,
              height: 0.98,
              fontWeight: FontWeight.w500,
              letterSpacing: -1.2,
              color: accent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(
    BuildContext context, {
    required bool isMobile,
    required bool isTablet,
  }) {
    final experiences = controller.experiences;

    return Stack(
      children: [
        Positioned(
          left: isMobile ? 12 : 15,
          top: 12,
          bottom: 12,
          child: Container(
            width: 1,
            color: Theme.of(context)
                .dividerColor
                .withValues(alpha: 0.55),
          ),
        ),

        Column(
          children: List.generate(
            experiences.length,
            (index) {
              final experience = experiences[index];

              return Padding(
                padding: EdgeInsets.only(
                  bottom: index == experiences.length - 1
                      ? 0
                      : isMobile
                          ? 44
                          : 56,
                ),
                child: FadeInRight(
                  delay: Duration(
                    milliseconds: 120 * index,
                  ),
                  duration: const Duration(milliseconds: 850),
                  from: 60,
                  child: _buildTimelineItem(
                    context,
                    experience: experience,
                    index: index,
                    isMobile: isMobile,
                    isTablet: isTablet,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required dynamic experience,
    required int index,
    required bool isMobile,
    required bool isTablet,
  }) {
    final accent = Theme.of(context).colorScheme.primary;
    final isCurrent = index == 0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isMobile ? 25 : 31,
          child: Padding(
            padding: const EdgeInsets.only(top: 9),
            child: Center(
              child: Container(
                width: isCurrent ? 13 : 10,
                height: isCurrent ? 13 : 10,
                decoration: BoxDecoration(
                  color: isCurrent
                      ? accent
                      : Theme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: accent,
                    width: isCurrent ? 3 : 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 18),

        Expanded(
          child: ExperienceCard(
            experience: experience,
            isCurrent: isCurrent,
          ),
        ),
      ],
    );
  }
}