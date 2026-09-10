import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/navigation_controller.dart';
import '../../controllers/theme_controller.dart';
import '../../utils/constants.dart';

class PortfolioNavbar extends GetView<NavigationController> {
  const PortfolioNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final List<String> navItems = ['Home', 'About', 'Experience', 'Projects', 'Skills', 'Education', 'Contact'];

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.95),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'SR',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
          ),
          Row(
            children: [
              ...List.generate(navItems.length, (index) {
                return Obx(() {
                  final isActive = controller.activeIndex.value == index;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                    child: TextButton(
                      onPressed: () => controller.scrollToSection(index),
                      style: TextButton.styleFrom(
                        foregroundColor: isActive
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      child: Text(
                        navItems[index],
                        style: TextStyle(
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                });
              }),
              const SizedBox(width: AppSpacing.md),
              Obx(() => IconButton(
                    icon: Icon(
                      themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                    ),
                    onPressed: themeController.toggleTheme,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
