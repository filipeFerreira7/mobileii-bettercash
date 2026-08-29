import 'package:flutter/material.dart';
import 'tab_bar_view_model.dart';

/// Component (Widget puro) do Tab Bar.
/// Renderiza uma barra de abas a partir do ViewModel.
class TabBarComponent extends StatelessWidget {
  const TabBarComponent({super.key, required this.viewModel, this.onTabChanged});

  final TabBarViewModel viewModel;
  final ValueChanged<int>? onTabChanged;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(
              top: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: List.generate(viewModel.items.length, (index) {
              final item = viewModel.items[index];
              final isSelected = index == viewModel.currentIndex;

              return Expanded(
                child: InkWell(
                  onTap: () {
                    viewModel.selectTab(index);
                    onTabChanged?.call(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isSelected ? Icons.check_circle : Icons.circle_outlined,
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                          size: 24,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
