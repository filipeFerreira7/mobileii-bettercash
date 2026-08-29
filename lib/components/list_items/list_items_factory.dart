import 'package:flutter/material.dart';
import 'list_items_component.dart';
import 'list_items_view_model.dart';

/// Factory do List Items.
/// Ponto único de criação do componente.
class ListItemsFactory {
  static Widget create({
    required List<ListItemData> items,
    void Function(int index)? onItemTap,
  }) {
    final viewModel = ListItemsViewModel(items: items, onItemTap: onItemTap);
    return ListItemsComponent(viewModel: viewModel);
  }
}
