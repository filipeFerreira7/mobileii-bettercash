import 'package:flutter/material.dart';
import '../components/action_button/action_button_factory.dart';
import '../components/action_button/action_button_view_model.dart';
import '../common/theme/app_theme.dart';

/// Tela de showcase do Action Button — mostra variantes e tamanhos
/// conforme referência do Design System (assets/Button.jpg).
class SampleActionButtonScreen extends StatelessWidget {
  const SampleActionButtonScreen({super.key});

  void _showFeedback(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

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
            const Text('Action Button'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Section(
              title: 'Variantes',
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  ActionButtonFactory.create(
                    label: 'Primary',
                    variant: ActionButtonVariant.primary,
                    onTap: () => _showFeedback(context, 'Primary clicado!'),
                  ),
                  ActionButtonFactory.create(
                    label: 'Secondary',
                    variant: ActionButtonVariant.secondary,
                    onTap: () => _showFeedback(context, 'Secondary clicado!'),
                  ),
                  ActionButtonFactory.create(
                    label: 'Outline',
                    variant: ActionButtonVariant.outline,
                    onTap: () => _showFeedback(context, 'Outline clicado!'),
                  ),
                  ActionButtonFactory.create(
                    label: 'Text',
                    variant: ActionButtonVariant.text,
                    onTap: () => _showFeedback(context, 'Text clicado!'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            _Section(
              title: 'Desabilitado',
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  ActionButtonFactory.create(
                    label: 'Primary',
                    variant: ActionButtonVariant.primary,
                  ),
                  ActionButtonFactory.create(
                    label: 'Secondary',
                    variant: ActionButtonVariant.secondary,
                  ),
                  ActionButtonFactory.create(
                    label: 'Outline',
                    variant: ActionButtonVariant.outline,
                  ),
                  ActionButtonFactory.create(
                    label: 'Text',
                    variant: ActionButtonVariant.text,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            _Section(
              title: 'Tamanhos',
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ActionButtonFactory.create(
                    label: 'Large',
                    size: ActionButtonSize.large,
                    onTap: () => _showFeedback(context, 'Large clicado!'),
                  ),
                  ActionButtonFactory.create(
                    label: 'Medium',
                    size: ActionButtonSize.medium,
                    onTap: () => _showFeedback(context, 'Medium clicado!'),
                  ),
                  ActionButtonFactory.create(
                    label: 'Small',
                    size: ActionButtonSize.small,
                    onTap: () => _showFeedback(context, 'Small clicado!'),
                  ),
                  ActionButtonFactory.create(
                    label: 'XS',
                    size: ActionButtonSize.extraSmall,
                    onTap: () => _showFeedback(context, 'XS clicado!'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            _Section(
              title: 'Com Ícones',
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  ActionButtonFactory.create(
                    label: 'Voltar',
                    variant: ActionButtonVariant.primary,
                    leadingIcon: Icons.arrow_back,
                    onTap: () => _showFeedback(context, 'Voltar clicado!'),
                  ),
                  ActionButtonFactory.create(
                    label: 'Próximo',
                    variant: ActionButtonVariant.secondary,
                    trailingIcon: Icons.arrow_forward,
                    onTap: () => _showFeedback(context, 'Próximo clicado!'),
                  ),
                  ActionButtonFactory.create(
                    label: 'Enviar',
                    variant: ActionButtonVariant.outline,
                    leadingIcon: Icons.send,
                    onTap: () => _showFeedback(context, 'Enviar clicado!'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        child,
      ],
    );
  }
}
