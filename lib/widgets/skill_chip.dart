import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Container(
      constraints: const BoxConstraints(
        minHeight: 36,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(
          alpha: 0.045,
        ),
        border: Border.all(
          color: colorScheme.onSurface.withValues(
            alpha: 0.12,
          ),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        softWrap: true,
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0.05,
          color: colorScheme.onSurface.withValues(
            alpha: 0.72,
          ),
        ),
      ),
    );
  }
}
