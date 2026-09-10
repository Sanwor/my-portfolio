import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/widgets/project_card.dart';
import 'package:my_portfolio/widgets/section_container.dart';
import 'package:my_portfolio/widgets/section_title.dart';
import '../../controllers/portfolio_controller.dart';
import '../../utils/breakpoints.dart';

class ProjectsSection extends GetView<PortfolioController> {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Projects',
          ),

          const SizedBox(height: 24),

          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;

              int columns;

              if (width >= Breakpoints.tablet) {
                columns = 3;
              } else if (width >= Breakpoints.mobile) {
                columns = 2;
              } else {
                columns = 1;
              }

              const spacing = 24.0;

              final cardWidth = columns == 1
                  ? width
                  : (width - (spacing * (columns - 1))) / columns;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: controller.projects.map(
                  (project) {
                    return SizedBox(
                      width: cardWidth,
                      child: ProjectCard(
                        project: project,
                      ),
                    );
                  },
                ).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}