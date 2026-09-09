import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navigation_controller.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/mobile_drawer.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'sections/education_section.dart';
import 'sections/contact_section.dart';

class PortfolioPage extends GetView<NavigationController> {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ResponsiveLayout(
        desktop: SizedBox.shrink(),
        tablet: MobileNavigationDrawer(),
        mobile: MobileNavigationDrawer(),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ResponsiveLayout(
          desktop: const PortfolioNavbar(),
          tablet: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            elevation: 0,
            title: Text(
              'SR',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
            ),
          ),
          mobile: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            elevation: 0,
            title: Text(
              'SR',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSection(0, const HeroSection()),
            _buildSection(1, const AboutSection()),
            _buildSection(2, const ExperienceSection()),
            _buildSection(3, const ProjectsSection()),
            _buildSection(4, const SkillsSection()),
            _buildSection(5, const EducationSection()),
            _buildSection(6, const ContactSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(int index, Widget child) {
    return Container(
      key: controller.itemKeys[index],
      child: child,
    );
  }
}
