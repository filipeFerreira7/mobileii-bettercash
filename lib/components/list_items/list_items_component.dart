import 'package:flutter/material.dart';
import 'list_items_view_model.dart';

/// Component (Widget puro) do List Items.
/// Renderiza uma lista de itens a partir do ViewModel.
class ListItemsComponent extends StatelessWidget {
  const ListItemsComponent({super.key, required this.viewModel});

  final ListItemsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return ListView.separated(
          itemCount: viewModel.items.length,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final item = viewModel.items[index];
            final isSelected = index == viewModel.selectedIndex;

            return ListTile(
              leading: item.leading != null
                  ? CircleAvatar(child: Text(item.leading!))
                  : null,
              title: Text(
                item.title,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
              subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
              trailing: item.trailing != null
                  ? Text(
                      item.trailing!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    )
                  : const Icon(Icons.chevron_right),
              selected: isSelected,
              selectedTileColor: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.15),
              onTap: () => viewModel.selectItem(index),
            );
          },
        );
      },
    );
  }
}
