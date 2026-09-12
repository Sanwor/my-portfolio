import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    final borderColor = widget.isCurrent
        ? colorScheme.primary.withValues(alpha: 0.45)
        : theme.dividerColor.withValues(alpha: 0.35);

    final backgroundColor = _isHovered
        ? colorScheme.surface.withValues(alpha: 0.96)
        : colorScheme.surface;

    final cardContent = Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),

          const SizedBox(height: 22),

          Container(
            height: 1,
            width: double.infinity,
            color: theme.dividerColor.withValues(alpha: 0.28),
          ),

          const SizedBox(height: 20),

          // IMPORTANT:
          // Only use Expanded when the card has a finite height.
          if (widget.fixedHeight != null)
            Expanded(
              child: _buildResponsibilities(context),
            )
          else
            _buildResponsibilities(context),
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

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.experience.position.toUpperCase(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.oswald(
                  fontSize: 25,
                  height: 1.05,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                  color: colorScheme.onSurface,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                widget.experience.company,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 20),

        Flexible(
          child: Text(
            widget.experience.duration.toUpperCase(),
            textAlign: TextAlign.right,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
              color: colorScheme.onSurface.withValues(alpha: 0.52),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResponsibilities(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.experience.responsibilities.map(
        (responsibility) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 7,
                    right: 11,
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
                      fontSize: 14,
                      height: 1.55,
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