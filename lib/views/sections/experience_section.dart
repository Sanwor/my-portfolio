import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/utils/layout_helper.dart';
import 'package:my_portfolio/widgets/experience_card.dart';
import 'package:my_portfolio/widgets/section_container.dart';
import 'package:my_portfolio/widgets/section_title.dart';
import '../../controllers/portfolio_controller.dart';

class ExperienceSection extends GetView<PortfolioController> {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Experience',
          ),

          SizedBox(
            height: isMobile ? 16 : 24,
          ),

          ...controller.experiences.map(
            (experience) => Padding(
              padding: EdgeInsets.only(
                bottom: isMobile ? 16 : 24,
              ),
              child: ExperienceCard(
                experience: experience,
              ),
            ),
          ),
        ],
      ),
    );
  }
}