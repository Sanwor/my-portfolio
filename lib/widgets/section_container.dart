import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../utils/layout_helper.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final double? minHeight;

  const SectionContainer({
    super.key,
    required this.child,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: minHeight ??
            MediaQuery.of(context).size.height * 0.8,
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile
            ? AppSpacing.lg
            : AppSpacing.sectionDesktop,
        horizontal: isMobile
            ? AppSpacing.md
            : AppSpacing.lg,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: SizedBox(
            // THIS IS THE IMPORTANT FIX
            width: double.infinity,
            child: child,
          ),
        ),
      ),
    );
  }
}