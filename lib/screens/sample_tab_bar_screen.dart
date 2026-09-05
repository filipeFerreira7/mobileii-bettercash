import 'package:flutter/material.dart';
import '../components/tab_bar/tab.dart';
import '../components/tab_bar/tab_bar.dart';
import '../components/tab_bar/tab_bar_view_model.dart';
import '../components/tab_bar/tab_factory.dart';
import '../components/tab_bar/tab_view_model.dart';
import '../common/theme/app_colors.dart';
import '../common/theme/app_spacing.dart';

class SampleTabBarScreen extends StatefulWidget {
  const SampleTabBarScreen({super.key});

  @override
  State<SampleTabBarScreen> createState() => _SampleTabBarScreenState();
}

class _SampleTabBarScreenState extends State<SampleTabBarScreen> {
  int _interactiveIndex = 0;

  final List<TabViewModel> _interactiveTabs = [
    const TabViewModel(label: 'Home', leftIcon: Icons.home_outlined),
    const TabViewModel(label: 'Produtos', rightIcon: Icons.shopping_bag_outlined),
    const TabViewModel(label: 'Favoritos', leftIcon: Icons.favorite_border, rightIcon: Icons.favorite),
    const TabViewModel(label: 'Perfil'),
    const TabViewModel(label: 'Bloqueado', leftIcon: Icons.lock_outline, isEnabled: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Design System - Tab Bar'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: AppColors.onSurface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Tab Bar Figma Example'),
            const SizedBox(height: AppSpacing.md),
            
            // Individual States (Documentation)
            _buildStateRow('Default', TabFactory.defaultTab(
              label: 'Label',
              leftIcon: Icons.star_border,
              rightIcon: Icons.star_border,
            )),
            _buildStateRow('Hover', AppTab(
              viewModel: const TabViewModel(
                label: 'Label',
                leftIcon: Icons.star_border,
                rightIcon: Icons.star_border,
                state: TabState.hover,
              ),
            )),
            _buildStateRow('Focus', AppTab(
              viewModel: const TabViewModel(
                label: 'Label',
                leftIcon: Icons.star_border,
                rightIcon: Icons.star_border,
                state: TabState.focus,
              ),
            )),
            _buildStateRow('Selected', TabFactory.selected(
              label: 'Label',
              leftIcon: Icons.star_border,
              rightIcon: Icons.star_border,
            )),
            _buildStateRow('Disabled', TabFactory.disabled(
              label: 'Label',
              leftIcon: Icons.star_border,
              rightIcon: Icons.star_border,
            )),

            const SizedBox(height: AppSpacing.xl),
            
            // Examples Section
            _buildSectionTitle('Examplos'),
            const Text(
              'Different content combinations.',
              style: TextStyle(color: Colors.grey),
            ),
            const Divider(height: AppSpacing.xl),

            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: [
                TabFactory.selected(label: 'Label', leftIcon: Icons.star_border),
                TabFactory.defaultTab(label: 'Label', rightIcon: Icons.star_border),
                TabFactory.defaultTab(label: 'Label', leftIcon: Icons.star_border, rightIcon: Icons.star_border),
                TabFactory.defaultTab(label: 'Label'),
              ],
            ),

            const SizedBox(height: AppSpacing.xl * 2),
            const Divider(),
            const SizedBox(height: AppSpacing.xl),

            // Interactive TabBar Section
            _buildSectionTitle('Tab Bar Interativa'),
            const SizedBox(height: AppSpacing.md),
            
            AppTabBar(
              viewModel: TabBarViewModel(
                tabs: _interactiveTabs,
                selectedIndex: _interactiveIndex,
                onTabChanged: (index) {
                  setState(() => _interactiveIndex = index);
                },
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
              ),
              child: IndexedStack(
                index: _interactiveIndex,
                children: [
                  _buildContent('Home', 'Bem-vindo à página inicial.', Icons.home_outlined),
                  _buildContent('Produtos', 'Confira nossa lista de produtos.', Icons.shopping_bag_outlined),
                  _buildContent('Favoritos', 'Seus itens salvos aparecem aqui.', Icons.favorite_border),
                  _buildContent('Perfil', 'Gerencie suas informações pessoais.', Icons.person_outline),
                  _buildContent('Bloqueado', 'Você não deveria ver isso.', Icons.lock_outline),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(String title, String description, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 28),
            const SizedBox(width: AppSpacing.sm),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          description,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.onSurface,
      ),
    );
  }

  Widget _buildStateRow(String label, Widget tab) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, color: AppColors.onSurface),
            ),
          ),
          tab,
        ],
      ),
    );
  }
}
