import 'package:flutter/material.dart';
import '../components/progress_bar/factory.dart';
import '../components/progress_bar/model.dart';
import '../components/progress_bar/progress_bar.dart';
import '../common/theme/app_colors.dart';
import '../common/theme/app_spacing.dart';

class SampleProgressBarScreen extends StatefulWidget {
  const SampleProgressBarScreen({super.key});

  @override
  State<SampleProgressBarScreen> createState() => _SampleProgressBarScreenState();
}

class _SampleProgressBarScreenState extends State<SampleProgressBarScreen> {
  double _interactiveValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Design System - Progress Bar'),
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
            _buildStateRow('Default', ProgressBarFactory.linear(value: 0.4)),
            _buildStateRow('Hover', ProgressBar(
              viewModel: const ProgressBarViewModel(value: 0.6, state: ProgressBarState.hover),
            )),
            _buildStateRow('Focus', ProgressBar(
              viewModel: const ProgressBarViewModel(value: 0.3, state: ProgressBarState.focus),
            )),
            _buildStateRow('Active', ProgressBar(
              viewModel: const ProgressBarViewModel(value: 0.8, state: ProgressBarState.active),
            )),
            _buildStateRow('Disabled', ProgressBarFactory.disabled(value: 0.5)),

            const SizedBox(height: AppSpacing.xl),
            _buildSectionTitle('Label Positions'),
            const SizedBox(height: AppSpacing.md),
            const Text('Left Label'),
            const SizedBox(height: AppSpacing.sm),
            _buildProgressList(LabelPosition.left),
            
            const SizedBox(height: AppSpacing.lg),
            const Text('Right Label'),
            const SizedBox(height: AppSpacing.sm),
            _buildProgressList(LabelPosition.right),

            const SizedBox(height: AppSpacing.xl),
            _buildSectionTitle('Interactive Example'),
            const SizedBox(height: AppSpacing.md),
            ProgressBarFactory.linear(
              value: _interactiveValue,
              labelPosition: LabelPosition.right,
              state: ProgressBarState.active,
            ),
            const SizedBox(height: AppSpacing.lg),
            Slider(
              value: _interactiveValue,
              onChanged: (val) => setState(() => _interactiveValue = val),
              activeColor: AppColors.primary,
            ),
            Center(
              child: Text(
                'Current Progress: ${(_interactiveValue * 100).toInt()}%',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressList(LabelPosition position) {
    return Column(
      children: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0].map((val) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
          child: ProgressBarFactory.linear(value: val, labelPosition: position),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildStateRow(String label, Widget widget) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: AppSpacing.xs),
          widget,
        ],
      ),
    );
  }
}
