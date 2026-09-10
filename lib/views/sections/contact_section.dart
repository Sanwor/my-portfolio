import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/widgets/section_container.dart';
import 'package:my_portfolio/widgets/section_title.dart';
import 'package:my_portfolio/widgets/social_button.dart';
import '../../controllers/portfolio_controller.dart';
import '../../utils/constants.dart';

class ContactSection extends GetView<PortfolioController> {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(title: 'Get In Touch'),
          Text(
            'Interested in working together or have a question?',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(
                icon: Icons.email_outlined,
                url: 'mailto:${controller.email}',
                tooltip: 'Email',
              ),
              const SizedBox(width: AppSpacing.md),
              SocialButton(
                icon: Icons.code,
                url: controller.github,
                tooltip: 'GitHub',
              ),
              const SizedBox(width: AppSpacing.md),
              SocialButton(
                icon: Icons.business_center,
                url: controller.linkedin,
                tooltip: 'LinkedIn',
              ),
              const SizedBox(width: AppSpacing.md),
              // SocialButton(
              //   icon: ,
              //   url: controller.linkedin,
              //   tooltip: 'LinkedIn',
              // ),
            ],
          ),
          const SizedBox(height: AppSpacing.xxl),
          const Divider(),
          const SizedBox(height: AppSpacing.lg),
          Text(
            '© 2026 Sanwor Prasad Rajbhandari\nBuilt with Flutter',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).textTheme.bodyMedium?.color?.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
