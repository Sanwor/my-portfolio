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

  late final ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();

    scrollController = ScrollController();
    scrollController.addListener(_updateActiveSection);
  }

  void scrollToSection(int index) {
    if (index >= 0 &&
        index < itemKeys.length &&
        itemKeys[index].currentContext != null) {
      Scrollable.ensureVisible(
        itemKeys[index].currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      activeIndex.value = index;
    }
  }

  void _updateActiveSection() {
    if (!scrollController.hasClients) return;

    // When the user reaches the very bottom,
    // make Contact the active navigation item.
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 5) {
      if (activeIndex.value != itemKeys.length - 1) {
        activeIndex.value = itemKeys.length - 1;
      }
      return;
    }

    int newActiveIndex = 0;

    // Find the last section that has reached the top
    // of the scrollable viewport.
    for (int i = 0; i < itemKeys.length; i++) {
      final context = itemKeys[i].currentContext;

      if (context == null) continue;

      final renderObject = context.findRenderObject();

      if (renderObject is! RenderBox) continue;

      final position = renderObject.localToGlobal(Offset.zero);

      // The body starts below the 78px navigation bar.
      // A small threshold makes the active state feel natural
      // while scrolling.
      if (position.dy <= 100) {
        newActiveIndex = i;
      }
    }

    if (activeIndex.value != newActiveIndex) {
      activeIndex.value = newActiveIndex;
    }
  }

  void updateActiveIndex(int index) {
    activeIndex.value = index;
  }

  @override
  void onClose() {
    scrollController.removeListener(_updateActiveSection);
    scrollController.dispose();
    super.onClose();
  }
}
