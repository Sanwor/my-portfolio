// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_portfolio/main.dart';

import 'package:visibility_detector/visibility_detector.dart';

void main() {
  testWidgets('PortfolioApp smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();
    expect(find.byType(PortfolioApp), findsOneWidget);
  });
}
