import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/portfolio_controller.dart';
import '../../utils/breakpoints.dart';
import '../../utils/constants.dart';
import '../../utils/fades.dart';
import '../../widgets/project_card.dart';

class ProjectsSection extends GetView<PortfolioController> {
  const ProjectsSection({
    super.key,
  });

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
                color: Theme.of(context).dividerColor.withValues(alpha: 0.35),
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
                  : _buildDesktopLayout(
                      context,
                      constraints.maxWidth,
                    ),
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
              'A selection of products I have built, '
              'shipped, and explored—covering real-world '
              'applications, academic work, and personal projects.',
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
        SizedBox(
          height: isTablet ? 64 : 84,
        ),
        _buildProjectsGrid(
          context,
          availableWidth,
          isMobile: false,
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
  ) {
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
            'A selection of products I have built, '
            'shipped, and explored across professional, '
            'academic, and personal work.',
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
        _buildProjectsGrid(
          context,
          MediaQuery.of(context).size.width,
          isMobile: true,
        ),
      ],
    );
  }

  Widget _buildSectionLabel(
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    final accent = theme.colorScheme.primary;

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
          '03 / PROJECTS',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.2,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
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
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final accent = theme.colorScheme.primary;

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
            text: 'SELECTED\n',
          ),
          TextSpan(
            text: mobile ? 'WORK.' : 'WORK.',
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

  Widget _buildProjectsGrid(
    BuildContext context,
    double width, {
    required bool isMobile,
  }) {
    if (isMobile) {
      return Column(
        children: List.generate(
          controller.projects.length,
          (index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == controller.projects.length - 1 ? 0 : 28,
              ),
              child: ProjectCard(
                project: controller.projects[index],
              ),
            );
          },
        ),
      );
    }

    final isTablet = width < Breakpoints.tablet;
    final columns = isTablet ? 2 : 3;
    const spacing = 24.0;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        // REPLACED mainAxisExtent WITH childAspectRatio
        // 1.0 forces perfectly symmetric squarish cards.
        childAspectRatio: 1.0, 
      ),
      itemBuilder: (context, index) {
        return ProjectCard(
          project: controller.projects[index],
        );
      },
    );
  }
}