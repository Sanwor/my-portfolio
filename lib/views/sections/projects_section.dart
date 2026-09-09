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
          const SectionTitle(title: 'Projects'),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth >= Breakpoints.tablet) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth >= Breakpoints.mobile) {
                crossAxisCount = 2;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.75, // Adjust slightly to prevent overflow
                ),
                itemCount: controller.projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: controller.projects[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
