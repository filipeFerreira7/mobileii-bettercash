import 'package:flutter/material.dart';
import 'tab_bar_component.dart';
import 'tab_bar_view_model.dart';

/// Factory do Tab Bar.
/// Ponto único de criação do componente.
class TabBarFactory {
  static Widget create({
    required List<String> labels,
    int initialIndex = 0,
    ValueChanged<int>? onTabChanged,
  }) {
    final items = labels.map((l) => TabItem(label: l)).toList();
    final viewModel = TabBarViewModel(items: items, initialIndex: initialIndex);
    return TabBarComponent(viewModel: viewModel, onTabChanged: onTabChanged);
  }
}
