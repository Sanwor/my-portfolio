import 'package:flutter/material.dart';
import '../../utils/constants.dart';

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
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: minHeight ?? MediaQuery.of(context).size.height * 0.8,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sectionDesktop,
        horizontal: AppSpacing.lg,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: child,
        ),
      ),
    );
  }
}
