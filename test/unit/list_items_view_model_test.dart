import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/components/list_items/model.dart';

void main() {
  group('ListItemViewModel', () {
    test('deve criar com valores obrigatorios', () {
      const vm = ListItemViewModel(label: 'Teste');
      expect(vm.label, 'Teste');
      expect(vm.state, ListItemState.defaultState);
      expect(vm.isEnabled, isTrue);
    });

    test('copyWith deve atualizar campos', () {
      const vm = ListItemViewModel(label: 'Original');
      final updated = vm.copyWith(label: 'Novo', state: ListItemState.selected);
      
      expect(updated.label, 'Novo');
      expect(updated.state, ListItemState.selected);
    });
  });
}
