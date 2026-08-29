import 'package:flutter/material.dart';
import '../components/tab_bar/tab_bar_factory.dart';

/// Tela de showcase do Tab Bar — mostra o componente em ação.
class SampleTabBarScreen extends StatefulWidget {
  const SampleTabBarScreen({super.key});

  @override
  State<SampleTabBarScreen> createState() => _SampleTabBarScreenState();
}

class _SampleTabBarScreenState extends State<SampleTabBarScreen> {
  int _selectedIndex = 0;
  static const _tabs = ['Início', 'Buscar', 'Notificações', 'Perfil'];
  static const _tabContents = [
    'Página Início',
    'Página Buscar',
    'Página Notificações',
    'Página Perfil',
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
            const Text('Tab Bar'),
          ],
        ),
      ),
      body: Center(
        child: Text(
          _tabContents[_selectedIndex],
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomNavigationBar: TabBarFactory.create(
        labels: _tabs,
        onTabChanged: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
