import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/utils/layout_helper.dart';
import 'package:my_portfolio/widgets/section_container.dart';
import 'package:my_portfolio/widgets/section_title.dart';
import '../../controllers/portfolio_controller.dart';

class AboutSection extends GetView<PortfolioController> {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'About Me',
          ),

          SizedBox(
            height: isMobile ? 16 : 24,
          ),

          Text(
            controller.aboutMe,
            softWrap: true,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: isMobile
                  ? 17
                  : isTablet
                      ? 19
                      : 21,
              height: 1.6,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}