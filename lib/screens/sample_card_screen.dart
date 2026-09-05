import 'package:flutter/material.dart';
import '../components/card/factory.dart';
import '../components/card/model.dart';
import '../common/theme/app_spacing.dart';

class SampleCardScreen extends StatelessWidget {
  const SampleCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            CardFactory.vertical(
              imageUrl: 'https://picsum.photos/id/1/600/400',
              title: 'Vertical Card',
              description: 'This is a vertical card with an image at the top and actions at the bottom.',
              actions: [
                CardAction(label: 'Cancel', onTap: () {}, isPrimary: false),
                CardAction(label: 'Accept', onTap: () {}),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            CardFactory.horizontal(
              imageUrl: 'https://picsum.photos/id/2/200/200',
              title: 'Horizontal Card',
              description: 'This layout places the image on the left and content on the right.',
              actions: [
                CardAction(label: 'View', onTap: () {}),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            CardFactory.vertical(
              title: 'No Image Card',
              description: 'Cards can also be used without images to display pure content and actions.',
              actions: [
                CardAction(label: 'Dismiss', onTap: () {}, isPrimary: false),
                CardAction(label: 'Learn More', onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
