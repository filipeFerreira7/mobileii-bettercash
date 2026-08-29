import 'package:flutter/material.dart';
import '../components/list_items/list_items_factory.dart';
import '../components/list_items/list_items_view_model.dart';

/// Tela de showcase do List Items — mostra uma lista de exemplo.
class SampleListItemsScreen extends StatelessWidget {
  const SampleListItemsScreen({super.key});

  static const _items = [
    ListItemData(title: 'Action Button', subtitle: 'Botões de ação com variantes', leading: 'AB'),
    ListItemData(title: 'Tab Bar', subtitle: 'Barra de navegação inferior', leading: 'TB'),
    ListItemData(title: 'List Items', subtitle: 'Itens de lista customizáveis', leading: 'LI'),
    ListItemData(title: 'Loading', subtitle: 'Indicador de carregamento', leading: 'LD'),
    ListItemData(title: 'Typography', subtitle: 'Estilos de texto', leading: 'Ty'),
    ListItemData(title: 'Spacing', subtitle: 'Espaçamentos do Design System', leading: 'Sp'),
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
            const Text('List Items'),
          ],
        ),
      ),
      body: ListItemsFactory.create(
        items: _items,
        onItemTap: (index) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selecionado: ${_items[index].title}')),
          );
        },
      ),
    );
  }
}
