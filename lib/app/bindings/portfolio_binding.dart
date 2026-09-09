import 'package:get/get.dart';
import '../../controllers/navigation_controller.dart';
import '../../controllers/portfolio_controller.dart';
import '../../controllers/theme_controller.dart';

class PortfolioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PortfolioController>(() => PortfolioController());
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
