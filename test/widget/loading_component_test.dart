import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/components/loading/loading_component.dart';
import 'package:design_system_sample/components/loading/loading_view_model.dart';

Widget _buildTestApp(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: Center(child: child),
    ),
  );
}

void main() {
  group('LoadingComponent', () {
    testWidgets('deve renderizar CircularProgressIndicator', (tester) async {
      final vm = LoadingViewModel();
      await tester.pumpWidget(_buildTestApp(
        LoadingComponent(viewModel: vm),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      vm.dispose();
    });

    testWidgets('deve renderizar mensagem quando fornecida', (tester) async {
      final vm = LoadingViewModel(message: 'Carregando...');
      await tester.pumpWidget(_buildTestApp(
        LoadingComponent(viewModel: vm),
      ));

      expect(find.text('Carregando...'), findsOneWidget);
      vm.dispose();
    });

    testWidgets('nao deve renderizar mensagem quando nula', (tester) async {
      final vm = LoadingViewModel();
      await tester.pumpWidget(_buildTestApp(
        LoadingComponent(viewModel: vm),
      ));

      expect(find.byType(Text), findsNothing);
      vm.dispose();
    });

    testWidgets('deve ter tamanho correto para xxl', (tester) async {
      final vm = LoadingViewModel(size: LoadingSize.xxl);
      await tester.pumpWidget(_buildTestApp(
        LoadingComponent(viewModel: vm),
      ));

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.height, 64);
      expect(sizedBox.width, 64);
      vm.dispose();
    });

    testWidgets('deve ter tamanho correto para sm', (tester) async {
      final vm = LoadingViewModel(size: LoadingSize.sm);
      await tester.pumpWidget(_buildTestApp(
        LoadingComponent(viewModel: vm),
      ));

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.height, 20);
      expect(sizedBox.width, 20);
      vm.dispose();
    });
  });
}
