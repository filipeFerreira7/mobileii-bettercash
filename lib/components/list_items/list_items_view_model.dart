import '../../common/viewmodel/base_view_model.dart';

class ListItemData {
  const ListItemData({
    required this.title,
    this.subtitle,
    this.trailing,
    this.leading,
  });

  final String title;
  final String? subtitle;
  final String? trailing;
  final String? leading;
}

/// ViewModel do componente List Items.
/// Gerencia a lista de itens e o estado de seleção.
class ListItemsViewModel extends BaseViewModel {
  ListItemsViewModel({required this.items, this.onItemTap});

  final List<ListItemData> items;
  final void Function(int index)? onItemTap;

  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

  void selectItem(int index) {
    if (index < 0 || index >= items.length) return;
    _selectedIndex = index;
    notify();
    onItemTap?.call(index);
  }
}
