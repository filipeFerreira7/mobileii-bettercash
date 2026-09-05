import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/components/context_menu/context_menu.dart';
import 'package:design_system_sample/components/context_menu/model.dart';

void main() {
  testWidgets('AppContextMenu should show items when clicked', (WidgetTester tester) async {
    bool itemTapped = false;

    final viewModel = ContextMenuViewModel(
      trigger: const Icon(Icons.more_vert),
      items: [
        MenuItemViewModel(
          label: 'Test Item',
          onTap: () => itemTapped = true,
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppContextMenu(viewModel: viewModel),
        ),
      ),
    );

    // Initial state: menu is closed
    expect(find.text('Test Item'), findsNothing);

    // Tap trigger
    await tester.tap(find.byType(Icon));
    await tester.pumpAndSettle();

    // Menu should be open
    expect(find.text('Test Item'), findsOneWidget);

    // Tap item
    await tester.tap(find.text('Test Item'));
    await tester.pumpAndSettle();

    // Tap should be recorded and menu closed
    expect(itemTapped, isTrue);
    expect(find.text('Test Item'), findsNothing);
  });
}
