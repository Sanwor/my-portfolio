import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utils/layout_helper.dart';
import 'package:my_portfolio/widgets/section_container.dart';
import 'package:my_portfolio/widgets/social_button.dart';
import '../../controllers/portfolio_controller.dart';
import '../../controllers/navigation_controller.dart';
import '../../utils/constants.dart';

class HeroSection extends GetView<PortfolioController> {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    // 3:4 portrait image sizes.
    final imageWidth = Responsive.isDesktop(context)
        ? 300.0
        : isTablet
            ? 200.0
            : 180.0;

    final nameFontSize = Responsive.isDesktop(context)
        ? 62.0
        : isTablet
            ? 48.0
            : 38.0;

    return SectionContainer(
      minHeight: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile
              ? 20
              : isTablet
                  ? 32
                  : 0,
          vertical: isMobile ? 40 : 0,
        ),
        child: isMobile
            ? _buildMobileLayout(
                context,
                imageWidth,
                nameFontSize,
              )
            : _buildDesktopTabletLayout(
                context,
                imageWidth,
                nameFontSize,
              ),
      ),
    );
  }

  // ============================================================
  // DESKTOP / TABLET
  // ============================================================

  Widget _buildDesktopTabletLayout(
    BuildContext context,
    double imageWidth,
    double nameFontSize,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProfileImage(
          width: imageWidth,
        ),

        const SizedBox(
          width: AppSpacing.xl,
        ),

        Expanded(
          child: _buildContent(
            context,
            nameFontSize,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // MOBILE
  // ============================================================

  Widget _buildMobileLayout(
    BuildContext context,
    double imageWidth,
    double nameFontSize,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isSmallMobile = screenWidth < 380;

    final imageSize = isSmallMobile ? 150.0 : 160.0;

    final greetingSize = isSmallMobile ? 24.0 : 26.0;

    final nameSize = isSmallMobile ? 34.0 : 36.0;

    final roleSize = isSmallMobile ? 24.0 : 27.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Profile Image
        _buildProfileImage(
          width: imageSize,
        ),

        const SizedBox(height: 28),

        // Greeting
        Text(
          'Hello, I am',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: greetingSize,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: 6),

        // Name
        Text(
          'Sanwor Prasad Rajbhandari',
          textAlign: TextAlign.center,
          style: GoogleFonts.oswald(
            fontSize: nameSize,
            fontWeight: FontWeight.bold,
            height: 1.05,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: 10),

        // Role
        Text(
          'Flutter Developer',
          textAlign: TextAlign.center,
          softWrap: false,
          style: GoogleFonts.poppins(
            fontSize: roleSize,
            fontWeight: FontWeight.w600,
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.6),
          ),
        ),

        const SizedBox(height: 12),

        // Location
        Text(
          'Kathmandu, Nepal',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.55),
          ),
        ),

        const SizedBox(height: 24),

        // Your existing action buttons
        _buildActionButtons(
          context,
          centerAlign: true,
        ),

        const SizedBox(height: 20),

        // Your existing social buttons
        _buildSocialButtons(
          context,
          centerAlign: true,
        ),
      ],
    );
  }

  // ============================================================
  // PROFILE IMAGE
  // ============================================================

  Widget _buildProfileImage({
    required double width,
  }) {
    final height = width * 4 / 3;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: width,
        height: height,
        child: Image.asset(
          "assets/images/profile_picture.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ============================================================
  // CONTENT
  // ============================================================

  Widget _buildContent(
    BuildContext context,
    double nameFontSize, {
    bool centerAlign = false,
  }) {
    final textAlign = centerAlign
        ? TextAlign.center
        : TextAlign.start;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: centerAlign
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, I am',
          textAlign: textAlign,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .primary,
              ),
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        // --------------------------------------------------------
        // NAME
        // --------------------------------------------------------

        Text(
          controller.name,
          textAlign: textAlign,
          softWrap: true,
          style: GoogleFonts.oswald(
            fontWeight: FontWeight.w900,
            color: Theme.of(context)
                .colorScheme
                .onSurface,
            fontSize: nameFontSize,
          ),
        ),

        const SizedBox(
          height: AppSpacing.sm,
        ),

        // --------------------------------------------------------
        // ROLE
        // --------------------------------------------------------

        Text(
          controller.role,
          textAlign: textAlign,
          softWrap: true,
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.color,
              ),
        ),

        const SizedBox(
          height: AppSpacing.lg,
        ),

        // --------------------------------------------------------
        // LOCATION
        // --------------------------------------------------------

        Text(
          '📍 ${controller.location}',
          textAlign: textAlign,
          softWrap: true,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(
                fontWeight: FontWeight.normal,
              ),
        ),

        const SizedBox(
          height: AppSpacing.xl,
        ),

        // --------------------------------------------------------
        // ACTION BUTTONS
        // --------------------------------------------------------

        _buildActionButtons(
          context,
          centerAlign: centerAlign,
        ),

        const SizedBox(
          height: AppSpacing.xxl,
        ),

        // --------------------------------------------------------
        // SOCIAL BUTTONS
        // --------------------------------------------------------

        _buildSocialButtons(
          context,
          centerAlign: centerAlign,
        ),
      ],
    );
  }

  // ============================================================
  // ACTION BUTTONS
  // ============================================================

  Widget _buildActionButtons(
    BuildContext context, {
    bool centerAlign = false,
  }) {
    final viewProjectsButton = ElevatedButton(
      onPressed: () {
        Get.find<NavigationController>()
            .scrollToSection(3);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        backgroundColor: Theme.of(context)
            .colorScheme
            .primary,
        foregroundColor: Theme.of(context)
            .colorScheme
            .surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'View Projects',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );

    final contactButton = OutlinedButton(
      onPressed: () {
        Get.find<NavigationController>()
            .scrollToSection(6);
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        foregroundColor: Theme.of(context)
            .colorScheme
            .primary,
        side: BorderSide(
          color: Theme.of(context)
              .colorScheme
              .primary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'Contact Me',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );

    // Mobile
    if (centerAlign) {
      return Column(
        children: [
          viewProjectsButton,

          const SizedBox(
            height: AppSpacing.md,
          ),

          contactButton,
        ],
      );
    }

    // Tablet / Desktop
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        viewProjectsButton,

        const SizedBox(
          width: AppSpacing.lg,
        ),

        contactButton,
      ],
    );
  }

  // ============================================================
  // SOCIAL BUTTONS
  // ============================================================

  Widget _buildSocialButtons(
    BuildContext context, {
    bool centerAlign = false,
  }) {
    final socialButtons = [
      SocialButton(
        icon: Icons.email_outlined,
        url: 'mailto:${controller.email}',
        tooltip: 'Email',
      ),
      SocialButton(
        icon: Icons.code,
        url: controller.github,
        tooltip: 'GitHub',
      ),
      SocialButton(
        icon: Icons.business_center,
        url: controller.linkedin,
        tooltip: 'LinkedIn',
      ),
    ];

    return Row(
      mainAxisAlignment: centerAlign
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        socialButtons[0],

        const SizedBox(
          width: AppSpacing.sm,
        ),

        socialButtons[1],

        const SizedBox(
          width: AppSpacing.sm,
        ),

        socialButtons[2],
      ],
    );
  }
}