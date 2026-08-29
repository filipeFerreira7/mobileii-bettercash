import 'package:flutter/material.dart';
import '../components/loading/loading_factory.dart';
import '../components/loading/loading_view_model.dart';
import '../common/theme/app_theme.dart';

/// Tela de showcase do Loading — mostra os 5 tamanhos conforme Figma (Loader-1.png).
class SampleLoadingScreen extends StatelessWidget {
  const SampleLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/buttons/logo.png',
              height: 28,
              width: 28,
              errorBuilder: (_, _, _) => const Icon(Icons.account_balance_wallet, size: 28),
            ),
            const SizedBox(width: 8),
            const Text('Loading'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Referência Figma', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/loader/Loader-1.png',
                width: double.infinity,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('Variantes de Tamanho', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.navy,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _LoaderItem(size: LoadingSize.xxl, label: 'XXL'),
                  _LoaderItem(size: LoadingSize.xl, label: 'XL'),
                  _LoaderItem(size: LoadingSize.lg, label: 'LG'),
                  _LoaderItem(size: LoadingSize.md, label: 'MD'),
                  _LoaderItem(size: LoadingSize.sm, label: 'SM'),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('Com Mensagem', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            LoadingFactory.create(size: LoadingSize.lg, message: 'Carregando dados...'),
            const SizedBox(height: AppSpacing.lg),
            Text('Uso em Contexto', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
              ),
              child: Column(
                children: [
                  LoadingFactory.create(size: LoadingSize.md),
                  const SizedBox(height: AppSpacing.md),
                  const Text('Buscando informações...', style: TextStyle(color: AppColors.onSurface)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoaderItem extends StatelessWidget {
  const _LoaderItem({required this.size, required this.label});

  final LoadingSize size;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LoadingFactory.create(size: size),
        const SizedBox(height: AppSpacing.sm),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
