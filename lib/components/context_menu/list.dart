import 'package:flutter/material.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_colors.dart';
import 'model.dart';
import 'factory.dart';

/// A component that renders a list of menu items inside a styled container.
/// This can be used for persistent menus or as the body of a dropdown.
class ContextMenuList extends StatelessWidget {
  final List<MenuItemViewModel> items;
  final ValueChanged<MenuItemViewModel>? onSelected;

  const ContextMenuList({
    super.key,
    required this.items,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.menuRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items.map((item) {
          return InkWell(
            onTap: item.isEnabled ? () => onSelected?.call(item) : null,
            child: ContextMenuFactory.item(
              label: item.label,
              leadingIcon: item.leadingIcon,
              trailingIcon: item.trailingIcon,
              isDestructive: item.isDestructive,
              isEnabled: item.isEnabled,
            ).onTap != null ? null : null, // This is just a conceptual placeholder
          );
        }).toList(),
      ),
    );
  }
}
