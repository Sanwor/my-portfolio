import '../models/experience_model.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';

class PortfolioData {
  // Personal Info
  static const String name = 'Sanwor Prasad Rajbhandari';
  static const String role = 'Junior Flutter Developer';
  static const String location = 'Bhaktapur, Nepal';
  static const String email = 'sanwor.pd@gmail.com';
  static const String github = 'https://github.com/Sanwor';
  static const String linkedin = 'https://linkedin.com/in/sanwor'; 

  static const String aboutMe = 
      'I build clean, responsive, and reliable mobile applications with Flutter, '
      'focusing on thoughtful user experiences and maintainable architecture. '
      'With over 15 months of production experience, I specialize in REST API integration, '
      'state management with GetX, and building geographic-aware applications.';

  // Experience
  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      position: 'Junior Flutter Developer',
      company: 'Miracle Interface',
      duration: 'Apr 2026 – Present',
      responsibilities: [
        'Engineered and deployed secure authentication flows and dynamic data screens for Shupuri (a consumer app live on Google Play), utilizing GetX state management and integrating robust REST APIs.',
        'Refactored API-heavy screens to reduce load times, significantly improving rendering performance and overall responsiveness for end-users.',
        'Architected and implemented Firebase Cloud Messaging (FCM) end-to-end, enabling reliable push notifications for real-time application updates.',
        'Proactively diagnosed and resolved critical null-safety crashes and responsive UI overflow bugs ahead of production releases, drastically improving app stability metrics.',
        'Partnered closely with UX/UI designers, backend engineers, and QA to define technical requirements, scope sprints, and consistently ship feature updates on schedule.',
      ],
    ),
    ExperienceModel(
      position: 'Flutter Trainee',
      company: 'Miracle Interface',
      duration: 'Sep 2025 – Mar 2026',
      responsibilities: [
        'Assisted in the development and maintenance of Flutter applications.',
        'Learned and applied GetX state management and REST API integrations.',
      ],
    ),
    ExperienceModel(
      position: 'Flutter Intern',
      company: 'Miracle Interface',
      duration: 'Apr 2025 – July 2025',
      responsibilities: [
        'Gained hands-on experience with Flutter and Dart fundamentals.',
        'Built UI components and participated in agile development workflows.',
      ],
    ),
  ];

  // Projects
  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'Store Locator & Management App (Japan)',
      subtitle: 'Geographic-aware retail management application',
      features: [
        'Engineered a geographic-aware mobile application to map and manage retail store locations across Japan.',
        'Implemented location-based services to filter and display nearby stores, optimizing the user experience for seamless navigation and accessibility.',
      ],
      technologies: ['Flutter', 'Geolocation', 'REST APIs'],
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
