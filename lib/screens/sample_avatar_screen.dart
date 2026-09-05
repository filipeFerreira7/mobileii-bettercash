import 'package:flutter/material.dart';
import '../components/avatar/factory.dart';
import '../components/avatar/model.dart';
import '../common/theme/app_spacing.dart';

class SampleAvatarScreen extends StatelessWidget {
  const SampleAvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Sizes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                AvatarFactory.initials(initials: 'L', size: AvatarSize.large),
                const SizedBox(width: AppSpacing.md),
                AvatarFactory.initials(initials: 'M', size: AvatarSize.medium),
                const SizedBox(width: AppSpacing.md),
                AvatarFactory.initials(initials: 'S', size: AvatarSize.small),
                const SizedBox(width: AppSpacing.md),
                AvatarFactory.initials(initials: 'T', size: AvatarSize.tiny),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            const Text('Types', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                AvatarFactory.image(
                  url: 'https://i.pravatar.cc/150?u=1',
                  size: AvatarSize.large,
                ),
                const SizedBox(width: AppSpacing.md),
                AvatarFactory.initials(initials: 'JD', size: AvatarSize.large),
                const SizedBox(width: AppSpacing.md),
                AvatarFactory.icon(icon: Icons.person, size: AvatarSize.large),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            const Text('Status & States', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                AvatarFactory.image(
                  url: 'https://i.pravatar.cc/150?u=2',
                  size: AvatarSize.large,
                  isOnline: true,
                ),
                const SizedBox(width: AppSpacing.md),
                AvatarFactory.image(
                  url: 'https://i.pravatar.cc/150?u=3',
                  size: AvatarSize.large,
                  isDisabled: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
