import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/components/action_button/action_button_view_model.dart';

void main() {
  group('ActionButtonViewModel', () {
    test('deve inicializar com valores padrao', () {
      final vm = ActionButtonViewModel(label: 'Teste');
      expect(vm.label, 'Teste');
      expect(vm.variant, ActionButtonVariant.primary);
      expect(vm.size, ActionButtonSize.medium);
      expect(vm.onTap, isNull);
      expect(vm.isLoading, isFalse);
      expect(vm.isEnabled, isFalse);
      vm.dispose();
    });

    test('isEnabled deve ser true quando onTap nao e nulo', () {
      final vm = ActionButtonViewModel(label: 'Teste', onTap: () {});
      expect(vm.isEnabled, isTrue);
      vm.dispose();
    });

    test('isEnabled deve ser false quando onTap e nulo', () {
      final vm = ActionButtonViewModel(label: 'Teste');
      expect(vm.isEnabled, isFalse);
      vm.dispose();
    });

    test('handleTap deve alterar isLoading e chamar onTap', () {
      var tapped = false;
      final vm = ActionButtonViewModel(label: 'Teste', onTap: () => tapped = true);

      vm.handleTap();
      expect(tapped, isTrue);
      expect(vm.isLoading, isFalse);
      vm.dispose();
    });

    test('handleTap nao deve chamar onTap quando desabilitado (sem onTap)', () {
      var tapped = false;
      final vm = ActionButtonViewModel(label: 'Teste', onTap: () => tapped = true);
      // Desabilita removendo o onTap - recria sem onTap
      final vm2 = ActionButtonViewModel(label: 'Teste');

      expect(vm2.isEnabled, isFalse);
      vm2.handleTap();
      expect(tapped, isFalse);
      vm.dispose();
      vm2.dispose();
    });

    group('dimensoes por tamanho', () {
      test('large deve ter height 52', () {
        final vm = ActionButtonViewModel(
          label: 'Teste',
          size: ActionButtonSize.large,
        );
        expect(vm.height, 52);
        expect(vm.horizontalPadding, 24);
        expect(vm.fontSize, 16);
        expect(vm.iconSize, 20);
        expect(vm.borderRadius, 14);
        vm.dispose();
      });

      test('medium deve ter height 44', () {
        final vm = ActionButtonViewModel(
          label: 'Teste',
          size: ActionButtonSize.medium,
        );
        expect(vm.height, 44);
        expect(vm.horizontalPadding, 20);
        expect(vm.fontSize, 14);
        expect(vm.iconSize, 18);
        expect(vm.borderRadius, 10);
        vm.dispose();
      });

      test('small deve ter height 36', () {
        final vm = ActionButtonViewModel(
          label: 'Teste',
          size: ActionButtonSize.small,
        );
        expect(vm.height, 36);
        expect(vm.horizontalPadding, 16);
        expect(vm.fontSize, 13);
        expect(vm.iconSize, 16);
        expect(vm.borderRadius, 8);
        vm.dispose();
      });

      test('extraSmall deve ter height 30', () {
        final vm = ActionButtonViewModel(
          label: 'Teste',
          size: ActionButtonSize.extraSmall,
        );
        expect(vm.height, 30);
        expect(vm.horizontalPadding, 12);
        expect(vm.fontSize, 12);
        expect(vm.iconSize, 14);
        expect(vm.borderRadius, 6);
        vm.dispose();
      });
    });

    test('deve notificar ao chamar handleTap', () {
      var notified = false;
      final vm = ActionButtonViewModel(label: 'Teste', onTap: () {});
      vm.addListener(() => notified = true);

      vm.handleTap();
      expect(notified, isTrue);
      vm.dispose();
    });
  });
}
