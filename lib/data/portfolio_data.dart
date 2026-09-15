import '../models/experience_model.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';

class PortfolioData {
  // Career start date: April 1, 2025
  static final DateTime careerStartDate = DateTime(2025, 4, 1);

  /// Calculates total experience in months from April 2025 to today
  static int get totalExperienceMonths {
    final now = DateTime.now();
    final months = (now.year - careerStartDate.year) * 12 + (now.month - careerStartDate.month);
    return months < 0 ? 0 : months;
  }

  /// Returns total experience string formatted with '+' (e.g., "16+ months", "1+ years")
  static String get formattedExperience {
    return '$totalExperienceMonths+ months';
  }

  // Personal Info
  static const String name = 'Sanwor Prasad Rajbhandari';
  static const String role = 'Flutter Developer';
  static const String location = 'Bhaktapur, Nepal';
  static const String email = 'sanwor.pd@gmail.com';
  static const String github = 'https://github.com/Sanwor';
  static const String linkedin = 'https://linkedin.com/in/sanwor';

  /// Updated to getter to interpolate dynamic experience
  static String get aboutMe =>
      'I’m a Flutter developer focused on turning ideas into reliable, '
      'responsive and thoughtfully crafted mobile experiences. My work '
      'sits at the intersection of product thinking and practical '
      'engineering—building interfaces that feel simple while the '
      'underlying architecture remains maintainable.\n\n'
      'With $formattedExperience of production experience, I’ve worked with '
      'REST APIs, GetX, Firebase, geolocation and responsive UI, '
      'including applications used in real-world environments. '
      'I enjoy solving the details that make an application feel '
      'fast, stable and intentional—from API-driven screens and '
      'state management to performance and responsive behavior.';

  // Experience
  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      position: 'Flutter Developer',
      company: 'Miracle Interface',
      duration: 'Apr 2026 – Present',
      responsibilities: [
        'Developed production features for Shupuri using Flutter, GetX and REST APIs.',
        'Improved API-heavy screens to reduce loading time and strengthen overall responsiveness.',
        'Implemented Firebase Cloud Messaging end-to-end for reliable push notifications.',
        'Resolved stability, null-safety and responsive UI issues ahead of production releases.',
      ],
    ),
    ExperienceModel(
      position: 'Flutter Trainee',
      company: 'Miracle Interface',
      duration: 'Sep 2025 – Mar 2026',
      responsibilities: [
        'Built and maintained Flutter application features within production development workflows.',
        'Worked with GetX state management and REST APIs to build dynamic application screens.',
        'Strengthened responsive UI, debugging and application development practices.',
      ],
    ),
    ExperienceModel(
      position: 'Flutter Intern',
      company: 'Miracle Interface',
      duration: 'Apr 2025 – Jul 2025',
      responsibilities: [
        'Built reusable Flutter UI components while developing strong Dart and Flutter fundamentals.',
        'Applied responsive design principles across application screens and layouts.',
        'Participated in agile development, debugging and feature implementation workflows.',
      ],
    ),
  ];

  // Projects
  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'しゅぷり 守成クラブ',
      subtitle: 'Geographic-aware retail management application(Japan)',
      features: [
        'Engineered a geographic-aware mobile application to map and manage retail store locations across Japan.',
        'Implemented location-based services to filter and display nearby stores, optimizing the user experience for seamless navigation and accessibility.',
      ],
      technologies: ['Flutter', 'Geolocation', 'REST APIs'],
      playstoreUrl: 'https://play.google.com/store/apps/details?id=com.shuseiclub.shupuri',
      appstoreUrl: 'https://apps.apple.com/jp/app/%E3%81%97%E3%82%85%E3%81%B7%E3%82%8A/id6761531854',
      imageAsset: 'assets/images/shupuri.png',
      isProfessional: true,
    ),
    ProjectModel(
      title: 'CampusConnect',
      subtitle: 'College Management App',
      features: [
        'Built a comprehensive campus management application centralizing student information and administrative interactions.',
        'Integrated an AI-powered chatbot utilizing a RAG (Retrieval-Augmented Generation) architecture to instantly resolve complex student queries based on institutional data.',
        'Architected real-time push notifications to ensure timely delivery of campus updates.',
      ],
      technologies: ['Flutter', 'RAG AI', 'Push Notifications'],
      githubUrl: 'https://github.com/Sanwor/Campus-Connect',
      imageAsset: 'assets/images/campus_connect.png',
    ),
    ProjectModel(
      title: 'Lodge App',
      subtitle: 'Hotel Booking & Customer Management',
      features: [
        'Developed an end-to-end hotel booking platform featuring a complete reservation flow.',
        'Focused heavily on robust state management and responsive UI to ensure smooth navigation across varying screen sizes.',
      ],
      technologies: ['Flutter', 'State Management'],
      githubUrl: 'https://github.com/Sanwor/lodge-app',
      imageAsset: '',
    ),
  ];

  // Skills
  static const List<SkillModel> skills = [
    SkillModel(
      category: 'Languages',
      skills: ['Dart'],
    ),
    SkillModel(
      category: 'Mobile Development',
      skills: ['Flutter', 'GetX', 'Responsive UI Design'],
    ),
    SkillModel(
      category: 'Backend & Integrations',
      skills: ['REST APIs', 'Firebase Auth', 'Firebase Cloud Messaging', 'JSON Parsing', 'Geolocation'],
    ),
    SkillModel(
      category: 'Tools & Practices',
      skills: ['Git', 'GitHub', 'Debugging', 'Performance Profiling'],
    ),
  ];

  // Education
  static const String degree = 'Bachelor in Information Technology';
  static const String institution = 'Bhaktapur Multiple Campus, Bhaktapur, Nepal';
  static const String graduationYear = '2026';
}