import 'package:flutter/material.dart';
import '../components/chip/factory.dart';
import '../components/badge/model.dart';
import '../common/theme/app_spacing.dart';

class SampleChipScreen extends StatelessWidget {
  const SampleChipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chip Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Solid Chips', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                ChipFactory.solid('Flutter'),
                ChipFactory.solid('Android', color: BadgeColor.success, leadingIcon: Icons.android),
                ChipFactory.solid('iOS', color: BadgeColor.info, leadingIcon: Icons.apple),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            const Text('Deletable Chips', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                ChipFactory.outline(
                  'Removable',
                  onDeleted: () {},
                ),
                ChipFactory.outline(
                  'Tag',
                  color: BadgeColor.warning,
                  onDeleted: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
