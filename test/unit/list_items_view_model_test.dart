import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/components/list_items/list_items_view_model.dart';

void main() {
  group('ListItemsViewModel', () {
    late ListItemsViewModel vm;
    var lastTappedIndex = -1;

    setUp(() {
      lastTappedIndex = -1;
      vm = ListItemsViewModel(
        items: const [
          ListItemData(title: 'Item 1'),
          ListItemData(title: 'Item 2'),
          ListItemData(title: 'Item 3'),
        ],
        onItemTap: (index) => lastTappedIndex = index,
      );
    });

    tearDown(() => vm.dispose());

    test('deve iniciar sem item selecionado', () {
      expect(vm.selectedIndex, isNull);
    });

    test('selectItem deve marcar o item', () {
      vm.selectItem(1);
      expect(vm.selectedIndex, 1);
    });

    test('selectItem deve chamar onItemTap', () {
      vm.selectItem(2);
      expect(lastTappedIndex, 2);
    });

    test('selectItem com index invalido nao deve mudar', () {
      vm.selectItem(1);
      vm.selectItem(-1);
      expect(vm.selectedIndex, 1);

      vm.selectItem(10);
      expect(vm.selectedIndex, 1);
    });

    test('selectItem deve notificar listeners', () {
      var notified = false;
      vm.addListener(() => notified = true);
      vm.selectItem(0);
      expect(notified, isTrue);
    });

    test('deve funcionar sem onItemTap', () {
      final vm2 = ListItemsViewModel(
        items: const [ListItemData(title: 'A')],
      );
      vm2.selectItem(0);
      expect(vm2.selectedIndex, 0);
      vm2.dispose();
    });
  });

  group('ListItemData', () {
    test('deve armazenar titulo obrigatorio', () {
      const item = ListItemData(title: 'Teste');
      expect(item.title, 'Teste');
      expect(item.subtitle, isNull);
      expect(item.trailing, isNull);
      expect(item.leading, isNull);
    });

    test('deve armazenar todos os campos opcionais', () {
      const item = ListItemData(
        title: 'Teste',
        subtitle: 'Sub',
        trailing: 'T',
        leading: 'L',
      );
      expect(item.subtitle, 'Sub');
      expect(item.trailing, 'T');
      expect(item.leading, 'L');
    });
  });
}
