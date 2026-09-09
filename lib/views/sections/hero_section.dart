import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/widgets/section_container.dart';
import 'package:my_portfolio/widgets/social_button.dart';
import '../../controllers/portfolio_controller.dart';
import '../../controllers/navigation_controller.dart';
import '../../utils/constants.dart';

class HeroSection extends GetView<PortfolioController> {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      minHeight: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, I am',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            controller.name,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: MediaQuery.of(context).size.width > 700 ? 72 : 48,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            controller.role,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            '📍 ${controller.location}',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.find<NavigationController>().scrollToSection(
                    3,
                  ); // Projects index
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xl,
                    vertical: AppSpacing.md,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'View Projects',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              OutlinedButton(
                onPressed: () {
                  Get.find<NavigationController>().scrollToSection(
                    6,
                  ); // Contact index
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xl,
                    vertical: AppSpacing.md,
                  ),
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Contact Me', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xxl),
          Row(
            children: [
              SocialButton(
                icon: Icons.email_outlined,
                url: 'mailto:${controller.email}',
                tooltip: 'Email',
              ),
              const SizedBox(width: AppSpacing.sm),
              SocialButton(
                icon: Icons.code,
                url: controller.github,
                tooltip: 'GitHub',
              ),
              const SizedBox(width: AppSpacing.sm),
              SocialButton(
                icon: Icons.business_center,
                url: controller.linkedin,
                tooltip: 'LinkedIn',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
