import 'package:flutter/material.dart';
import '../components/context_menu/factory.dart';
import '../common/theme/app_colors.dart';
import '../common/theme/app_spacing.dart';

class SampleContextMenuScreen extends StatelessWidget {
  const SampleContextMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Design System - Context Menu'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: AppColors.onSurface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('States'),
            const SizedBox(height: AppSpacing.md),
            const Text('Trigger the menus below to see the states.'),
            const SizedBox(height: AppSpacing.xl),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildExampleCol(
                  'Leading Icons',
                  ContextMenuFactory.simple(
                    trigger: _buildTrigger(),
                    items: [
                      ContextMenuFactory.item(label: 'Text', leadingIcon: Icons.star_border),
                      ContextMenuFactory.item(label: 'Text', leadingIcon: Icons.star_border),
                      ContextMenuFactory.item(label: 'Text', leadingIcon: Icons.star_border),
                      ContextMenuFactory.destructive(label: 'Text', leadingIcon: Icons.delete_outline),
                    ],
                  ),
                ),
                _buildExampleCol(
                  'Trailing Icons',
                  ContextMenuFactory.simple(
                    trigger: _buildTrigger(),
                    items: [
                      ContextMenuFactory.item(label: 'Text', trailingIcon: Icons.star_border),
                      ContextMenuFactory.item(label: 'Text', trailingIcon: Icons.star_border),
                      ContextMenuFactory.item(label: 'Text', trailingIcon: Icons.star_border),
                      ContextMenuFactory.item(label: 'Text', trailingIcon: Icons.delete_outline, isDestructive: true),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.xl * 2),
            _buildSectionTitle('Examples'),
            const Text('Customizing content within a component.'),
            const SizedBox(height: AppSpacing.md),

            _buildExampleCol(
              'Mixed & Disabled',
              ContextMenuFactory.simple(
                trigger: _buildTrigger(),
                items: [
                  ContextMenuFactory.item(label: 'Enabled Item', leadingIcon: Icons.check_circle_outline),
                  ContextMenuFactory.item(label: 'Disabled Item', leadingIcon: Icons.block, isEnabled: false),
                  ContextMenuFactory.item(label: 'Trailing Star', trailingIcon: Icons.star),
                  ContextMenuFactory.destructive(label: 'Remove Item'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrigger() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.more_horiz, color: Colors.white),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildExampleCol(String label, Widget menu) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: AppSpacing.md),
        menu,
      ],
    );
  }
}
