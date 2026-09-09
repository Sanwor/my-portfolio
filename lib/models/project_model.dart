class ProjectModel {
  final String title;
  final String subtitle;
  final List<String> features;
  final List<String> technologies;
  final String? githubUrl;
  final String? demoUrl;

  const ProjectModel({
    required this.title,
    required this.subtitle,
    required this.features,
    required this.technologies,
    this.githubUrl,
    this.demoUrl,
  });
}
