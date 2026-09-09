import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final itemKeys = [
    GlobalKey(), // Home
    GlobalKey(), // About
    GlobalKey(), // Experience
    GlobalKey(), // Projects
    GlobalKey(), // Skills
    GlobalKey(), // Education
    GlobalKey(), // Contact
  ];

  final RxInt activeIndex = 0.obs;

  void scrollToSection(int index) {
    if (index >= 0 && index < itemKeys.length && itemKeys[index].currentContext != null) {
      Scrollable.ensureVisible(
        itemKeys[index].currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      activeIndex.value = index;
    }
  }

  void updateActiveIndex(int index) {
    activeIndex.value = index;
  }
}
