import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/components/list_items/list.dart';
import 'package:design_system_sample/components/list_items/model.dart';

void main() {
  group('AppList Widget Tests', () {
    testWidgets('deve renderizar todos os itens', (WidgetTester tester) async {
      final items = [
        const ListItemViewModel(label: 'Item 1'),
        const ListItemViewModel(label: 'Item 2'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppList(items: items),
          ),
        ),
      );

      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });

    testWidgets('deve chamar onItemSelected ao clicar', (WidgetTester tester) async {
      int? selectedIndex;
      final items = [
        const ListItemViewModel(label: 'Item 1'),
        const ListItemViewModel(label: 'Item 2'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppList(
              items: items,
              onItemSelected: (index) => selectedIndex = index,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Item 2'));
      await tester.pumpAndSettle();

      expect(selectedIndex, 1);
    });

    testWidgets('nao deve selecionar item desabilitado', (WidgetTester tester) async {
      int? selectedIndex;
      final items = [
        const ListItemViewModel(label: 'Item 1', isEnabled: false),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppList(
              items: items,
              onItemSelected: (index) => selectedIndex = index,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Item 1'));
      await tester.pumpAndSettle();

      expect(selectedIndex, isNull);
    });
  });
}
