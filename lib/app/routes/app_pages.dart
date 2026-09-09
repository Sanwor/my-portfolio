import 'package:get/get.dart';
import 'app_routes.dart';
import '../bindings/portfolio_binding.dart';
import '../../views/portfolio_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const PortfolioPage(),
      binding: PortfolioBinding(),
    ),
  ];
}
