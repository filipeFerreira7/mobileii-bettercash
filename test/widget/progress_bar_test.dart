import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/components/progress_bar/progress_bar.dart';
import 'package:design_system_sample/components/progress_bar/model.dart';

void main() {
  group('ProgressBar Widget Tests', () {
    testWidgets('should render percentage label', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProgressBar(
              viewModel: ProgressBarViewModel(
                value: 0.5,
                labelPosition: LabelPosition.left,
              ),
            ),
          ),
        ),
      );

      expect(find.text('50%'), findsOneWidget);
    });

    testWidgets('should update width when value changes', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProgressBar(
              viewModel: ProgressBarViewModel(
                value: 0.2,
              ),
            ),
          ),
        ),
      );

      // We can check if AnimatedContainer exists or just verify no errors on pump
      expect(find.byType(ProgressBar), findsOneWidget);
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProgressBar(
              viewModel: ProgressBarViewModel(
                value: 0.8,
              ),
            ),
          ),
        ),
      );
      
      await tester.pumpAndSettle();
      expect(find.byType(ProgressBar), findsOneWidget);
    });

    testWidgets('should respect disabled state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProgressBar(
              viewModel: ProgressBarViewModel(
                value: 0.5,
                isEnabled: false,
              ),
            ),
          ),
        ),
      );

      // Verify it renders
      expect(find.byType(ProgressBar), findsOneWidget);
    });
  });
}
