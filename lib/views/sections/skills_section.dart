import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/portfolio_controller.dart';
import '../../utils/constants.dart';
import '../../utils/fades.dart';
import '../../utils/breakpoints.dart';
import '../../widgets/skill_chip.dart';

class SkillsSection extends GetView<PortfolioController> {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width < Breakpoints.mobile) {
          return _buildMobile(context, width);
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
    final colorScheme = Theme.of(context).colorScheme;

    final isTablet = width < Breakpoints.tablet;

    final horizontalPadding = isTablet
        ? 32.0
        : 48.0;

    final headingSize = isTablet
        ? 54.0
        : 72.0;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                // INTRO
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
                // SKILL GROUPS
                // ------------------------------------------------

                FadeInUp(
                  from: 45,
                  delay: const Duration(
                    milliseconds: 180,
                  ),
                  child: _buildSkillGroups(
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
    final horizontalPadding = width < 380
        ? 20.0
        : 22.0;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context)
                .colorScheme
                .onSurface
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
            // INTRO
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
            // SKILLS
            // ------------------------------------------------

            FadeInUp(
              from: 35,
              delay: const Duration(
                milliseconds: 160,
              ),
              child: _buildMobileSkillGroups(
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
          '04 / SKILLS',
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
          'WHAT I WORK WITH',
          style: GoogleFonts.oswald(
            fontSize: headingSize,
            height: 0.98,
            fontWeight: FontWeight.w500,
            letterSpacing: -1.2,
            color: colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: 20),

        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 620,
          ),
          child: Text(
            'A practical set of technologies and tools I use to build '
            'responsive, reliable and user-focused applications.',
            style: GoogleFonts.inter(
              fontSize: isTablet ? 15 : 16,
              fontWeight: FontWeight.w400,
              height: 1.7,
              color: colorScheme.onSurface.withValues(
                alpha: 0.58,
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
          'WHAT I WORK WITH',
          style: GoogleFonts.oswald(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            height: 0.98,
            letterSpacing: -1.2,
            color: colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: 18),

        Text(
          'A practical set of technologies and tools I use to build '
          'responsive, reliable and user-focused applications.',
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
  // DESKTOP / TABLET SKILL GROUPS
  // ============================================================

  Widget _buildSkillGroups(
    BuildContext context, {
    required bool isTablet,
  }) {
    final groups = controller.skills;

    /*
     * Use two columns only when the available width can
     * comfortably accommodate them.
     *
     * On smaller tablet widths, each group gets its own row.
     */
    if (isTablet) {
      return Column(
        children: List.generate(
          groups.length,
          (index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == groups.length - 1
                    ? 0
                    : 30,
              ),
              child: _SkillGroup(
                category: groups[index].category,
                skills: groups[index].skills,
              ),
            );
          },
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(),
      itemCount: groups.length,
      gridDelegate:
          const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 560,
        crossAxisSpacing: 54,
        mainAxisSpacing: 48,
        mainAxisExtent: 170,
      ),
      itemBuilder: (context, index) {
        final group = groups[index];

        return _SkillGroup(
          category: group.category,
          skills: group.skills,
        );
      },
    );
  }

  // ============================================================
  // MOBILE SKILL GROUPS
  // ============================================================

  Widget _buildMobileSkillGroups(
    BuildContext context,
  ) {
    final groups = controller.skills;

    return Column(
      children: List.generate(
        groups.length,
        (index) {
          final group = groups[index];

          return Padding(
            padding: EdgeInsets.only(
              bottom: index == groups.length - 1
                  ? 0
                  : 34,
            ),
            child: _SkillGroup(
              category: group.category,
              skills: group.skills,
            ),
          );
        },
      ),
    );
  }
}

// ==================================================================
// SKILL GROUP
// ==================================================================

class _SkillGroup extends StatelessWidget {
  final String category;
  final List<String> skills;

  const _SkillGroup({
    required this.category,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 22,
        bottom: 22,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.onSurface.withValues(
              alpha: 0.12,
            ),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          // ------------------------------------------------------
          // CATEGORY HEADER
          // ------------------------------------------------------

          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  category.toUpperCase(),
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                    height: 1.3,
                    color: colorScheme.onSurface.withValues(
                      alpha: 0.52,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              Text(
                skills.length.toString().padLeft(2, '0'),
                style: GoogleFonts.oswald(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.primary.withValues(
                    alpha: 0.72,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ------------------------------------------------------
          // SKILLS
          // ------------------------------------------------------

          Wrap(
            spacing: 8,
            runSpacing: 9,
            children: skills
                .map(
                  (skill) => SkillChip(
                    label: skill,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
