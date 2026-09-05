import 'package:flutter/material.dart';
import '../common/routes/app_routes.dart';
import '../common/theme/app_theme.dart';

class _ComponentItem {
  const _ComponentItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.route,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String? route;

  bool get isLocked => route == null;
}

/// Sample Screen: lista de componentes do Design System.
class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  static const _components = [
    _ComponentItem(
      title: 'Action Button',
      subtitle: 'Botões com 4 variantes e 4 tamanhos',
      icon: Icons.smart_button,
      route: AppRoutes.sampleActionButton,
    ),
    _ComponentItem(
      title: 'Loading',
      subtitle: 'Indicadores de carregamento',
      icon: Icons.autorenew,
      route: AppRoutes.sampleLoading,
    ),
    _ComponentItem(
      title: 'Tab Bar',
      subtitle: 'Barra de navegação inferior',
      icon: Icons.tab,
      route: AppRoutes.sampleTabBar,
    ),
    _ComponentItem(
      title: 'List Items',
      subtitle: 'Itens de lista customizáveis',
      icon: Icons.list_alt,
      route: AppRoutes.sampleListItems,
    ),
    _ComponentItem(
      title: 'Progress Bar',
      subtitle: 'Barra de progresso linear',
      icon: Icons.linear_scale,
      route: AppRoutes.sampleProgressBar,
    ),
    _ComponentItem(
      title: 'Avatar',
      subtitle: 'Exibição de imagem/perfil',
      icon: Icons.account_circle,
      route: AppRoutes.sampleAvatar,
    ),
    _ComponentItem(
      title: 'Badge',
      subtitle: 'Indicadores e notificações',
      icon: Icons.notifications,
      route: AppRoutes.sampleBadge,
    ),
    _ComponentItem(
      title: 'Chip / Tag',
      subtitle: 'Etiquetas e filtros',
      icon: Icons.label,
      route: AppRoutes.sampleChip,
    ),
    _ComponentItem(
      title: 'Card',
      subtitle: 'Containers com conteúdo',
      icon: Icons.dashboard,
      route: AppRoutes.sampleCard,
    ),
    _ComponentItem(
      title: 'Snackbar',
      subtitle: 'Mensagens temporárias',
      icon: Icons.info_outline,
      route: AppRoutes.sampleSnackBar,
    ),
    _ComponentItem(
      title: 'Context Menu',
      subtitle: 'Menu suspenso de ações',
      icon: Icons.more_vert,
      route: AppRoutes.sampleContextMenu,
    ),
  ];

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
            const Text('BetterCash -- Sample'),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
            decoration: const BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Design System',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_components.where((c) => !c.isLocked).length} componentes disponiveis  ·  ${_components.where((c) => c.isLocked).length} em breve',
                  style: TextStyle(
                    color: AppColors.white.withValues(alpha: 0.6),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: _components.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = _components[index];
                return _ComponentCard(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ComponentCard extends StatelessWidget {
  const _ComponentCard({required this.item});

  final _ComponentItem item;

  @override
  Widget build(BuildContext context) {
    final locked = item.isLocked;

    return Material(
      color: locked ? AppColors.surface : AppColors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: locked
            ? null
            : () => Navigator.pushNamed(context, item.route!),
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: locked
                  ? AppColors.disabled.withValues(alpha: 0.3)
                  : AppColors.primary.withValues(alpha: 0.15),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: locked
                      ? AppColors.disabledContainer.withValues(alpha: 0.5)
                      : AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  item.icon,
                  size: 22,
                  color: locked ? AppColors.disabledText : AppColors.primary,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: locked ? AppColors.disabledText : AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: locked
                            ? AppColors.disabled.withValues(alpha: 0.7)
                            : AppColors.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
              if (locked)
                const Icon(Icons.lock, size: 18, color: AppColors.disabled)
              else
                const Icon(Icons.chevron_right, size: 20, color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
