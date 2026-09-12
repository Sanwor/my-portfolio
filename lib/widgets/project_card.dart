import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/project_model.dart';

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
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_blank');
    }
  }

  void _showProjectDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _ProjectDetailDialog(
        project: widget.project,
        onLaunch: _launchUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final hasBoundedHeight = constraints.maxHeight.isFinite;
        
        final isSmallMobile = width < 360;
        final isMobile = width < 700;
        final isTablet = width >= 700 && width < 1180;

        final cardPadding = isSmallMobile ? 16.0 : (isMobile ? 18.0 : (isTablet ? 20.0 : 22.0));

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            if (!isMobile && mounted) setState(() => _isHovered = true);
          },
          onExit: (_) {
            if (!isMobile && mounted) setState(() => _isHovered = false);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            transform: Matrix4.translationValues(0, _isHovered ? -3 : 0, 0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _isHovered
                    ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.45)
                    : Theme.of(context).dividerColor.withValues(alpha: 0.35),
                width: widget.project.isProfessional ? 1.2 : 1.0,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => _showProjectDetails(context),
                child: Padding(
                  padding: EdgeInsets.all(cardPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Prevents expanding unnecessarily on mobile list
                    children: [
                      // ROW 1: Small squared image + Title
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: isMobile ? 60 : 70,
                            height: isMobile ? 60 : 70,
                            child: _ProjectImage(
                              project: widget.project,
                              aspectRatio: 1.0, // Squared Image
                              isHovered: _isHovered,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              widget.project.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: (isSmallMobile || isTablet) ? 18 : 20,
                                fontWeight: FontWeight.w700,
                                height: 1.15,
                                letterSpacing: -0.25,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: isMobile ? 16 : 20),
                      
                      // ROW 2: Subtitle & Tag
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.project.subtitle,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: (isSmallMobile || isTablet) ? 12.5 : 13.5,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                                height: 1.45,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          _ProjectTypeLabel(
                            isProfessional: widget.project.isProfessional, 
                            compact: isSmallMobile || isTablet
                          ),
                        ],
                      ),
                      
                      // Responsive Spacer (Pushes links to bottom in grid layout, acts as fixed gap in mobile list)
                      if (hasBoundedHeight) const Spacer() else SizedBox(height: isMobile ? 18 : 24),
                      
                      // BOTTOM ROW: Action Links (Replaced "View Details" text)
                      _ProjectActions(
                        project: widget.project, 
                        compact: true, 
                        onLaunch: _launchUrl
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Dialog to show full project details without overflowing
class _ProjectDetailDialog extends StatelessWidget {
  final ProjectModel project;
  final Future<void> Function(String) onLaunch;

  const _ProjectDetailDialog({
    required this.project,
    required this.onLaunch,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      insetPadding: EdgeInsets.all(isMobile ? 16 : 40),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 750, maxHeight: 800),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header row with close button
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 12, top: 12, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ProjectTypeLabel(isProfessional: project.isProfessional, compact: false),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ],
              ),
            ),
            // Scrollable Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.subtitle,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Show large image in dialog
                    _ProjectImage(
                      project: project,
                      aspectRatio: 2.0, 
                      isHovered: false,
                    ),
                    const SizedBox(height: 24),
                    
                    Text(
                      "Key Features",
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    _ProjectFeatures(project: project, compact: false),
                    const SizedBox(height: 24),
                    
                    Text(
                      "Technologies",
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    _ProjectTechnologies(technologies: project.technologies, compact: false),
                    const SizedBox(height: 32),
                    
                    _ProjectActions(project: project, compact: false, onLaunch: onLaunch),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectImage extends StatelessWidget {
  final ProjectModel project;
  final double aspectRatio;
  final bool isHovered;

  const _ProjectImage({required this.project, required this.aspectRatio, required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          scale: isHovered ? 1.03 : 1.0,
          child: project.imageAsset != null
              ? Image.asset(
                  project.imageAsset!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _ImageFallback(project: project),
                )
              : _ImageFallback(project: project),
        ),
      ),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  final ProjectModel project;
  const _ImageFallback({required this.project});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: colorScheme.primary.withValues(alpha: 0.06),
      alignment: Alignment.center,
      child: Icon(
        project.isProfessional ? Icons.phone_android_rounded : Icons.code_rounded,
        size: 32, // reduced icon size slightly for the small square
        color: colorScheme.primary.withValues(alpha: 0.65),
      ),
    );
  }
}

class _ProjectFeatures extends StatelessWidget {
  final ProjectModel project;
  final bool compact;

  const _ProjectFeatures({required this.project, required this.compact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: project.features.map((feature) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 11),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 7),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.75),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  feature,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: compact ? 12 : 13.5,
                    height: 1.55,
                    color: colorScheme.onSurface.withValues(alpha: 0.72),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _ProjectTechnologies extends StatelessWidget {
  final List<String> technologies;
  final bool compact;

  const _ProjectTechnologies({required this.technologies, required this.compact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Wrap(
      spacing: 7,
      runSpacing: 7,
      children: technologies.map((technology) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: compact ? 9 : 10, vertical: compact ? 5 : 6),
          decoration: BoxDecoration(
            color: colorScheme.onSurface.withValues(alpha: 0.035),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: colorScheme.onSurface.withValues(alpha: 0.10)),
          ),
          child: Text(
            technology,
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: compact ? 10 : 10.5,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface.withValues(alpha: 0.68),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ProjectTypeLabel extends StatelessWidget {
  final bool isProfessional;
  final bool compact;

  const _ProjectTypeLabel({required this.isProfessional, required this.compact});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: compact ? 7 : 8, vertical: compact ? 4 : 5),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: colorScheme.primary.withValues(alpha: isProfessional ? 0.22 : 0.12)),
      ),
      child: Text(
        isProfessional ? 'PROFESSIONAL' : 'PERSONAL',
        style: TextStyle(
          fontSize: compact ? 8 : 9,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.65,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}

class _ProjectActions extends StatelessWidget {
  final ProjectModel project;
  final bool compact;
  final Future<void> Function(String url) onLaunch;

  const _ProjectActions({required this.project, required this.compact, required this.onLaunch});

  @override
  Widget build(BuildContext context) {
    final actions = <Widget>[];

    if (project.githubUrl != null) actions.add(_ProjectActionButton(icon: Icons.code_rounded, label: 'GitHub', compact: compact, onPressed: () => onLaunch(project.githubUrl!)));
    if (project.appstoreUrl != null) actions.add(_ProjectActionButton(icon: Icons.apple, label: 'App Store', compact: compact, onPressed: () => onLaunch(project.appstoreUrl!)));
    if (project.playstoreUrl != null) actions.add(_ProjectActionButton(icon: Icons.android_rounded, label: 'Google Play', compact: compact, onPressed: () => onLaunch(project.playstoreUrl!)));
    if (project.demoUrl != null) actions.add(_ProjectActionButton(icon: Icons.arrow_outward_rounded, label: 'Live', compact: compact, onPressed: () => onLaunch(project.demoUrl!)));

    if (actions.isEmpty) return const SizedBox.shrink();
    return Wrap(spacing: 8, runSpacing: 8, children: actions);
  }
}

class _ProjectActionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool compact;
  final VoidCallback onPressed;

  const _ProjectActionButton({required this.icon, required this.label, required this.compact, required this.onPressed});

  @override
  State<_ProjectActionButton> createState() => _ProjectActionButtonState();
}

class _ProjectActionButtonState extends State<_ProjectActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) { if (!widget.compact && mounted) setState(() => _isHovered = true); },
      onExit: (_) { if (!widget.compact && mounted) setState(() => _isHovered = false); },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: _isHovered ? colorScheme.onSurface : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: _isHovered ? colorScheme.onSurface : colorScheme.onSurface.withValues(alpha: 0.16)),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.compact ? 10 : 11, vertical: widget.compact ? 8 : 9),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.icon,
                    size: widget.compact ? 14 : 15,
                    color: _isHovered ? colorScheme.surface : colorScheme.onSurface.withValues(alpha: 0.78),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.label,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: widget.compact ? 11 : 12,
                      fontWeight: FontWeight.w700,
                      color: _isHovered ? colorScheme.surface : colorScheme.onSurface.withValues(alpha: 0.82),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}