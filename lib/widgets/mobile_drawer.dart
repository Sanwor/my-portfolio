import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/navigation_controller.dart';
import '../../controllers/theme_controller.dart';
import '../../utils/constants.dart';

class MobileNavigationDrawer extends GetView<NavigationController> {
  const MobileNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final List<String> navItems = ['Home', 'About', 'Experience', 'Projects', 'Skills', 'Education', 'Contact'];

    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.xxl),
            Text(
              'Sanwor Rajbhandari',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.md),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: navItems.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    final isActive = controller.activeIndex.value == index;
                    return ListTile(
                      title: Text(
                        navItems[index],
                        style: TextStyle(
                          color: isActive
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).textTheme.bodyLarge?.color,
                          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      onTap: () {
                        Get.back(); // close drawer
                        controller.scrollToSection(index);
                      },
                    );
                  });
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: Obx(() => Icon(
                    themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                  )),
              title: const Text('Toggle Theme'),
              onTap: () {
                themeController.toggleTheme();
              },
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}
