import 'package:get/get.dart';
import '../data/portfolio_data.dart';
import '../models/experience_model.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';

class PortfolioController extends GetxController {
  String get name => PortfolioData.name;
  String get role => PortfolioData.role;
  String get location => PortfolioData.location;
  String get email => PortfolioData.email;
  String get github => PortfolioData.github;
  String get linkedin => PortfolioData.linkedin;
  String get aboutMe => PortfolioData.aboutMe;

  List<ExperienceModel> get experiences => PortfolioData.experiences;
  List<ProjectModel> get projects => PortfolioData.projects;
  List<SkillModel> get skills => PortfolioData.skills;
  
  String get degree => PortfolioData.degree;
  String get institution => PortfolioData.institution;
  String get graduationYear => PortfolioData.graduationYear;
}
