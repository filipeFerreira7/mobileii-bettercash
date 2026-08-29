import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/components/tab_bar/tab_bar_view_model.dart';

void main() {
  group('TabBarViewModel', () {
    late TabBarViewModel vm;

    setUp(() {
      vm = TabBarViewModel(
        items: [
          const TabItem(label: 'Inicio'),
          const TabItem(label: 'Buscar'),
          const TabItem(label: 'Perfil'),
        ],
      );
    });

    tearDown(() => vm.dispose());

    test('deve iniciar com index 0', () {
      expect(vm.currentIndex, 0);
    });

    test('deve ter 3 items', () {
      expect(vm.items.length, 3);
    });

    test('selectTab deve mudar o index', () {
      vm.selectTab(1);
      expect(vm.currentIndex, 1);
    });

    test('selectTab com index invalido nao deve mudar', () {
      vm.selectTab(1);
      vm.selectTab(-1);
      expect(vm.currentIndex, 1);

      vm.selectTab(10);
      expect(vm.currentIndex, 1);
    });

    test('selectTab com mesmo index nao deve notificar', () {
      var notified = false;
      vm.addListener(() => notified = true);
      vm.selectTab(0); // ja esta em 0
      expect(notified, isFalse);
    });

    test('selectTab com index diferente deve notificar', () {
      var notified = false;
      vm.addListener(() => notified = true);
      vm.selectTab(2);
      expect(notified, isTrue);
    });

    test('deve aceitar initialIndex', () {
      final vm2 = TabBarViewModel(
        items: const [TabItem(label: 'A'), TabItem(label: 'B')],
        initialIndex: 1,
      );
      expect(vm2.currentIndex, 1);
      vm2.dispose();
    });
  });

  group('TabItem', () {
    test('deve armazenar label', () {
      const item = TabItem(label: 'Teste');
      expect(item.label, 'Teste');
      expect(item.icon, isNull);
      expect(item.selectedIcon, isNull);
    });
  });
}
