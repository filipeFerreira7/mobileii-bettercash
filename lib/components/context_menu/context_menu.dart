import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimensions.dart';
import '../../common/theme/app_spacing.dart';
import 'model.dart';

class AppContextMenu extends StatelessWidget {
  final ContextMenuViewModel viewModel;

  const AppContextMenu({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemViewModel>(
      offset: const Offset(0, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.menuRadius),
      ),
      elevation: AppDimensions.menuElevation,
      color: AppColors.white,
      padding: EdgeInsets.zero,
      onSelected: (item) {
        if (item.isEnabled) {
          viewModel.onSelected?.call(item);
          item.onTap?.call();
        }
      },
      itemBuilder: (context) {
        return viewModel.items.map((item) {
          return PopupMenuItem<MenuItemViewModel>(
            value: item,
            enabled: item.isEnabled,
            padding: EdgeInsets.zero,
            height: AppDimensions.menuItemHeight,
            child: _ContextMenuItem(viewModel: item),
          );
        }).toList();
      },
      child: viewModel.trigger,
    );
  }
}

class _ContextMenuItem extends StatefulWidget {
  final MenuItemViewModel viewModel;

  const _ContextMenuItem({
    required this.viewModel,
  });

  @override
  State<_ContextMenuItem> createState() => _ContextMenuItemState();
}

class _ContextMenuItemState extends State<_ContextMenuItem> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isDisabled = !widget.viewModel.isEnabled;
    final isDestructive = widget.viewModel.isDestructive;

    Color contentColor = isDestructive ? AppColors.error : AppColors.onSurface;
    if (isDisabled) contentColor = AppColors.disabledText;

    Color bgColor = Colors.transparent;
    if (_isPressed) {
      bgColor = AppColors.primaryLightest;
    } else if (_isHovered) {
      bgColor = isDestructive ? AppColors.errorLight : AppColors.grey100;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: isDisabled ? null : () => Navigator.of(context).pop(widget.viewModel),
        onHighlightChanged: (highlight) => setState(() => _isPressed = highlight),
        child: Container(
          height: AppDimensions.menuItemHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(
            color: bgColor,
          ),
          child: Row(
            children: [
              if (widget.viewModel.leadingIcon != null) ...[
                Icon(
                  widget.viewModel.leadingIcon,
                  size: 20,
                  color: contentColor,
                ),
                const SizedBox(width: AppSpacing.sm),
              ],
              Expanded(
                child: Text(
                  widget.viewModel.label,
                  style: TextStyle(
                    color: contentColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (widget.viewModel.trailingIcon != null) ...[
                const SizedBox(width: AppSpacing.sm),
                Icon(
                  widget.viewModel.trailingIcon,
                  size: 20,
                  color: contentColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
