import '../../common/viewmodel/base_view_model.dart';

class TabItem {
  const TabItem({required this.label, this.icon, this.selectedIcon});

  final String label;
  final String? icon;
  final String? selectedIcon;
}

/// ViewModel do componente Tab Bar.
/// Gerencia qual aba está selecionada e notifica a UI sobre mudanças.
class TabBarViewModel extends BaseViewModel {
  TabBarViewModel({
    required this.items,
    int initialIndex = 0,
  }) : _currentIndex = initialIndex;

  final List<TabItem> items;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void selectTab(int index) {
    if (index < 0 || index >= items.length) return;
    if (index == _currentIndex) return;
    _currentIndex = index;
    notify();
  }
}
