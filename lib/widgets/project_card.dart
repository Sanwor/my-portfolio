import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/project_model.dart';
import '../../utils/constants.dart';
import '../../utils/layout_helper.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return MouseRegion(
      onEnter: (_) {
        if (!isMobile) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) {
        if (!isMobile) {
          setState(() => _isHovered = false);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        padding: EdgeInsets.all(
          isMobile ? AppSpacing.md : AppSpacing.lg,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.5)
                : Theme.of(context)
                    .dividerColor
                    .withValues(alpha: 0.1),
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------------------------------------
            // Project title
            // ------------------------------------------------
            Text(
              widget.project.title,
              softWrap: true,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: AppSpacing.xs),

            // ------------------------------------------------
            // Project subtitle
            // ------------------------------------------------
            Text(
              widget.project.subtitle,
              softWrap: true,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),

            const SizedBox(height: AppSpacing.md),

            // ------------------------------------------------
            // Features
            // ------------------------------------------------
            ...widget.project.features.map(
              (feature) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppSpacing.xs,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '• ',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          feature,
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: AppSpacing.md),

            // ------------------------------------------------
            // Technologies
            // ------------------------------------------------
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.xs,
              children: widget.project.technologies.map(
                (tech) {
                  return Chip(
                    label: Text(
                      tech,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    materialTapTargetSize:
                        MaterialTapTargetSize.shrinkWrap,
                  );
                },
              ).toList(),
            ),

            // ------------------------------------------------
            // Project links
            // ------------------------------------------------
            if (widget.project.githubUrl != null ||
                widget.project.demoUrl != null) ...[
              const SizedBox(height: AppSpacing.md),

              Wrap(
                spacing: AppSpacing.sm,
                children: [
                  if (widget.project.githubUrl != null)
                    IconButton(
                      icon: const Icon(Icons.code),
                      onPressed: () {
                        _launchUrl(
                          widget.project.githubUrl!,
                        );
                      },
                      tooltip: 'View Source',
                    ),

                  if (widget.project.demoUrl != null)
                    IconButton(
                      icon: const Icon(Icons.open_in_new),
                      onPressed: () {
                        _launchUrl(
                          widget.project.demoUrl!,
                        );
                      },
                      tooltip: 'View Live',
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}