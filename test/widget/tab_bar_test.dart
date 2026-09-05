import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/components/tab_bar/tab_bar.dart';
import 'package:design_system_sample/components/tab_bar/tab_bar_view_model.dart';
import 'package:design_system_sample/components/tab_bar/tab_view_model.dart';

void main() {
  group('AppTabBar Widget Tests', () {
    testWidgets('should render all tabs', (WidgetTester tester) async {
      final tabs = [
        const TabViewModel(label: 'Tab 1'),
        const TabViewModel(label: 'Tab 2'),
        const TabViewModel(label: 'Tab 3'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppTabBar(
              viewModel: TabBarViewModel(tabs: tabs),
            ),
          ),
        ),
      );

      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('Tab 2'), findsOneWidget);
      expect(find.text('Tab 3'), findsOneWidget);
    });

    testWidgets('should call onTabChanged when a tab is clicked', (WidgetTester tester) async {
      int selectedIndex = 0;
      final tabs = [
        const TabViewModel(label: 'Tab 1'),
        const TabViewModel(label: 'Tab 2'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return AppTabBar(
                  viewModel: TabBarViewModel(
                    tabs: tabs,
                    selectedIndex: selectedIndex,
                    onTabChanged: (index) {
                      setState(() => selectedIndex = index);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tab 2'));
      await tester.pumpAndSettle();

      expect(selectedIndex, 1);
    });

    testWidgets('should not call onTabChanged when a disabled tab is clicked', (WidgetTester tester) async {
      int selectedIndex = 0;
      final tabs = [
        const TabViewModel(label: 'Tab 1'),
        const TabViewModel(label: 'Tab 2', isEnabled: false),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppTabBar(
              viewModel: TabBarViewModel(
                tabs: tabs,
                selectedIndex: selectedIndex,
                onTabChanged: (index) {
                  selectedIndex = index;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tab 2'));
      await tester.pumpAndSettle();

      expect(selectedIndex, 0);
    });
  });
}
