import 'package:flutter/material.dart';
import '../components/badge/factory.dart';
import '../components/badge/model.dart';
import '../common/theme/app_spacing.dart';

class SampleBadgeScreen extends StatelessWidget {
  const SampleBadgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badge Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Solid Badges', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                BadgeFactory.solid('Default'),
                BadgeFactory.solid('Success', color: BadgeColor.success),
                BadgeFactory.solid('Info', color: BadgeColor.info),
                BadgeFactory.solid('Warning', color: BadgeColor.warning),
                BadgeFactory.solid('Error', color: BadgeColor.error),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            const Text('Outline Badges', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                BadgeFactory.outline('Default'),
                BadgeFactory.outline('Success', color: BadgeColor.success),
                BadgeFactory.outline('Info', color: BadgeColor.info),
                BadgeFactory.outline('Warning', color: BadgeColor.warning),
                BadgeFactory.outline('Error', color: BadgeColor.error),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            const Text('Sizes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSpacing.md),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BadgeFactory.solid('Medium', size: BadgeSize.medium),
                const SizedBox(width: AppSpacing.md),
                BadgeFactory.solid('Small', size: BadgeSize.small),
                const SizedBox(width: AppSpacing.md),
                BadgeFactory.solid('Tiny', size: BadgeSize.tiny),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
