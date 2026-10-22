import 'package:flutter/material.dart';
import '../app/theme/app_fonts.dart';

import '../models/experience_model.dart';
import '../utils/constants.dart';

class ExperienceCard extends StatefulWidget {
  final ExperienceModel experience;
  final bool isCurrent;
  final double? fixedHeight;

  const ExperienceCard({
    super.key,
    required this.experience,
    this.isCurrent = false,
    this.fixedHeight,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isMobile = MediaQuery.of(context).size.width < 600;

    final borderColor = widget.isCurrent
        ? colorScheme.primary.withValues(alpha: 0.45)
        : theme.dividerColor.withValues(alpha: 0.35);

    final backgroundColor = _isHovered
        ? colorScheme.surface.withValues(alpha: 0.96)
        : colorScheme.surface;

    final cardContent = Padding(
      padding: EdgeInsets.all(isMobile ? 16.0 : AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, isMobile: isMobile),

          SizedBox(height: isMobile ? 14 : 20),

          Container(
            height: 1,
            width: double.infinity,
            color: theme.dividerColor.withValues(alpha: 0.28),
          ),

          SizedBox(height: isMobile ? 14 : 20),

          if (widget.fixedHeight != null)
            Expanded(
              child: _buildResponsibilities(context, isMobile: isMobile),
            )
          else
            _buildResponsibilities(context, isMobile: isMobile),
        ],
      ),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) {
        if (widget.fixedHeight != null) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) {
        if (widget.fixedHeight != null) {
          setState(() => _isHovered = false);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        width: double.infinity,
        height: widget.fixedHeight,
        transform: Matrix4.translationValues(
          0,
          _isHovered ? -3 : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: borderColor,
            width: widget.isCurrent ? 1.2 : 1,
          ),
        ),
        child: cardContent,
      ),
    );
  }

  Widget _buildHeader(BuildContext context, {required bool isMobile}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Date Chip Widget
    final dateChip = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Text(
        widget.experience.duration.toUpperCase(),
        style: AppFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
          color: colorScheme.primary,
        ),
      ),
    );

    // 1. MOBILE LAYOUT: Stacked vertically
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.experience.position.toUpperCase(),
            style: AppFonts.oswald(
              fontSize: 20,
              height: 1.1,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.experience.company,
            style: AppFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 10),
          dateChip,
        ],
      );
    }

    // 2. DESKTOP & TABLET LAYOUT: Position and Date side-by-side with minimal spacing
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                widget.experience.position.toUpperCase(),
                style: AppFonts.oswald(
                  fontSize: 24,
                  height: 1.1,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(width: 16),
            dateChip,
          ],
        ),
        const SizedBox(height: 6),
        Text(
          widget.experience.company,
          style: AppFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildResponsibilities(BuildContext context, {required bool isMobile}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.experience.responsibilities.map(
        (responsibility) {
          return Padding(
            padding: EdgeInsets.only(bottom: isMobile ? 8 : 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 7,
                    right: 9,
                  ),
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(
                      alpha: 0.75,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    responsibility,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: isMobile ? 13 : 14,
                      height: 1.5,
                      color: colorScheme.onSurface.withValues(
                        alpha: 0.72,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}