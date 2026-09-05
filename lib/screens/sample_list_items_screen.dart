import 'package:flutter/material.dart';
import '../components/list_items/factory.dart';
import '../components/list_items/list.dart';
import '../components/list_items/model.dart';
import '../common/theme/app_colors.dart';
import '../common/theme/app_spacing.dart';

class SampleListItemsScreen extends StatefulWidget {
  const SampleListItemsScreen({super.key});

  @override
  State<SampleListItemsScreen> createState() => _SampleListItemsScreenState();
}

class _SampleListItemsScreenState extends State<SampleListItemsScreen> {
  int? _interactiveSelectedIndex;
  bool _toggleValue = true;
  bool _checkboxValue = false;
  int _radioGroupValue = 1;
  int _stepperValue = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Design System - List Items'),
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
            ListItemsFactory.standard(label: 'Default State', leading: const Icon(Icons.star_border)),
            ListItemsFactory.standard(
              label: 'Hover State',
              leading: const Icon(Icons.star_border),
              state: ListItemState.hover,
            ),
            ListItemsFactory.standard(
              label: 'Focus State',
              leading: const Icon(Icons.star_border),
              state: ListItemState.focus,
            ),
            ListItemsFactory.standard(
              label: 'Selected State',
              leading: const Icon(Icons.star_border),
              state: ListItemState.selected,
            ),
            ListItemsFactory.standard(
              label: 'Disabled State',
              leading: const Icon(Icons.star_border),
              isEnabled: false,
            ),

            const SizedBox(height: AppSpacing.xl),
            _buildSectionTitle('Examples'),
            const Text(
              'Customizing content within a component.',
              style: TextStyle(color: Colors.grey),
            ),
            const Divider(height: AppSpacing.xl),

            ListItemsFactory.withAvatar(label: 'Avatar + Title + Chevron', initial: 'A', trailing: const Icon(Icons.chevron_right)),
            ListItemsFactory.withDetails(
              label: 'Star + Title + Details',
              leading: const Icon(Icons.star_border),
              details: 'Details',
              onTap: () {},
            ),
            ListItemsFactory.withStepper(
              label: 'Title + Stepper',
              value: _stepperValue,
              onIncrement: () => setState(() => _stepperValue++),
              onDecrement: () => setState(() => _stepperValue--),
            ),
            ListItemsFactory.withToggle(
              label: 'Title + Toggle',
              value: _toggleValue,
              onChanged: (val) => setState(() => _toggleValue = val),
            ),
            ListItemsFactory.withCheckbox(
              label: 'Title + Checkbox',
              value: _checkboxValue,
              onChanged: (val) => setState(() => _checkboxValue = val ?? false),
            ),
            ListItemsFactory.withRadio<int>(
              label: 'Radio Item 1',
              value: 1,
              groupValue: _radioGroupValue,
              onChanged: (val) => setState(() => _radioGroupValue = val!),
            ),
            ListItemsFactory.withRadio<int>(
              label: 'Radio Item 2',
              value: 2,
              groupValue: _radioGroupValue,
              onChanged: (val) => setState(() => _radioGroupValue = val!),
            ),
            ListItemsFactory.standard(
              label: 'Title + Badge',
              trailing: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: const Text('5', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ),

            const SizedBox(height: AppSpacing.xl),
            _buildSectionTitle('Interactive List'),
            const SizedBox(height: AppSpacing.md),
            AppList(
              selectedIndex: _interactiveSelectedIndex,
              onItemSelected: (index) => setState(() => _interactiveSelectedIndex = index),
              items: [
                const ListItemViewModel(label: 'Item Interativo 1', details: 'Clique para selecionar'),
                const ListItemViewModel(label: 'Item Interativo 2', details: 'Clique para selecionar'),
                const ListItemViewModel(label: 'Item Interativo 3', details: 'Clique para selecionar'),
                const ListItemViewModel(label: 'Item Desabilitado', details: 'Não pode ser clicado', isEnabled: false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Text(
        title,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }
}
