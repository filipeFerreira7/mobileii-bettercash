import 'package:flutter/material.dart';
import '../components/snackbar/factory.dart';
import '../components/badge/model.dart';
import '../components/card/model.dart';
import '../common/theme/app_spacing.dart';

class SampleSnackBarScreen extends StatelessWidget {
  const SampleSnackBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar / Alert Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            SnackBarFactory.info(
              title: 'Information',
              description: 'This is a standard informational message for the user.',
              actions: [
                CardAction(label: 'Details', onTap: () {}),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            SnackBarFactory.success(
              title: 'Success!',
              description: 'Your changes have been saved successfully.',
              style: BadgeStyle.outline,
            ),
            const SizedBox(height: AppSpacing.md),
            SnackBarFactory.warning(
              title: 'Warning',
              description: 'You are approaching your storage limit. Please clean up.',
              actions: [
                CardAction(label: 'Upgrade', onTap: () {}),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            SnackBarFactory.error(
              title: 'Error',
              description: 'Failed to connect to the server. Please try again later.',
              actions: [
                CardAction(label: 'Retry', onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
