import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/components/loading/loading_view_model.dart';

void main() {
  group('LoadingViewModel', () {
    test('deve inicializar com valores padrao', () {
      final vm = LoadingViewModel();
      expect(vm.size, LoadingSize.md);
      expect(vm.color, isNull);
      expect(vm.message, isNull);
      vm.dispose();
    });

    test('deve aceitar mensagem personalizada', () {
      final vm = LoadingViewModel(message: 'Carregando...');
      expect(vm.message, 'Carregando...');
      vm.dispose();
    });

    group('diameter por tamanho', () {
      test('xxl deve ter 64', () {
        final vm = LoadingViewModel(size: LoadingSize.xxl);
        expect(vm.diameter, 64);
        vm.dispose();
      });

      test('xl deve ter 48', () {
        final vm = LoadingViewModel(size: LoadingSize.xl);
        expect(vm.diameter, 48);
        vm.dispose();
      });

      test('lg deve ter 36', () {
        final vm = LoadingViewModel(size: LoadingSize.lg);
        expect(vm.diameter, 36);
        vm.dispose();
      });

      test('md deve ter 28', () {
        final vm = LoadingViewModel(size: LoadingSize.md);
        expect(vm.diameter, 28);
        vm.dispose();
      });

      test('sm deve ter 20', () {
        final vm = LoadingViewModel(size: LoadingSize.sm);
        expect(vm.diameter, 20);
        vm.dispose();
      });
    });

    group('strokeWidth por tamanho', () {
      test('xxl deve ter 5', () {
        final vm = LoadingViewModel(size: LoadingSize.xxl);
        expect(vm.strokeWidth, 5);
        vm.dispose();
      });

      test('xl deve ter 4', () {
        final vm = LoadingViewModel(size: LoadingSize.xl);
        expect(vm.strokeWidth, 4);
        vm.dispose();
      });

      test('lg deve ter 3.5', () {
        final vm = LoadingViewModel(size: LoadingSize.lg);
        expect(vm.strokeWidth, 3.5);
        vm.dispose();
      });

      test('md deve ter 3', () {
        final vm = LoadingViewModel(size: LoadingSize.md);
        expect(vm.strokeWidth, 3);
        vm.dispose();
      });

      test('sm deve ter 2.5', () {
        final vm = LoadingViewModel(size: LoadingSize.sm);
        expect(vm.strokeWidth, 2.5);
        vm.dispose();
      });
    });
  });
}
