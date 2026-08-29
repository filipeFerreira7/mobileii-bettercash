import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/components/action_button/action_button_component.dart';
import 'package:design_system_sample/components/action_button/action_button_view_model.dart';

Widget _buildTestApp(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: Center(child: child),
    ),
  );
}

void main() {
  group('ActionButtonComponent', () {
    testWidgets('deve renderizar o texto do label', (tester) async {
      final vm = ActionButtonViewModel(label: 'Clique Aqui');
      await tester.pumpWidget(_buildTestApp(
        ActionButtonComponent(viewModel: vm),
      ));

      expect(find.text('Clique Aqui'), findsOneWidget);
      vm.dispose();
    });

    testWidgets('deve renderizar com leadingIcon quando fornecido', (tester) async {
      final vm = ActionButtonViewModel(
        label: 'Voltar',
        leadingIcon: Icons.arrow_back,
      );
      await tester.pumpWidget(_buildTestApp(
        ActionButtonComponent(viewModel: vm),
      ));

      expect(find.text('Voltar'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      vm.dispose();
    });

    testWidgets('deve renderizar com trailingIcon quando fornecido', (tester) async {
      final vm = ActionButtonViewModel(
        label: 'Proximo',
        trailingIcon: Icons.arrow_forward,
      );
      await tester.pumpWidget(_buildTestApp(
        ActionButtonComponent(viewModel: vm),
      ));

      expect(find.text('Proximo'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      vm.dispose();
    });

    testWidgets('deve ser clicavel quando tem onTap', (tester) async {
      var tapped = false;
      final vm = ActionButtonViewModel(
        label: 'Clique',
        onTap: () => tapped = true,
      );

      await tester.pumpWidget(_buildTestApp(
        ActionButtonComponent(viewModel: vm),
      ));

      await tester.tap(find.text('Clique'));
      await tester.pump();

      expect(tapped, isTrue);
      vm.dispose();
    });

    testWidgets('nao deve executar onTap quando desabilitado', (tester) async {
      var tapped = false;
      final vm = ActionButtonViewModel(label: 'Disabled');
      // Sem onTap = desabilitado

      await tester.pumpWidget(_buildTestApp(
        ActionButtonComponent(viewModel: vm),
      ));

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(tapped, isFalse);
      vm.dispose();
    });
  });
}
