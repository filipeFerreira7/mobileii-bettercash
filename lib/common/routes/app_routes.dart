import 'package:flutter/material.dart';
import '../../screens/sample_screen.dart';
import '../../screens/sample_action_button_screen.dart';
import '../../screens/sample_loading_screen.dart';
import '../../screens/sample_tab_bar_screen.dart';
import '../../screens/sample_list_items_screen.dart';

/// Gerenciador de rotas central do app de exemplo do Design System.
/// Vive em "common" porque é um recurso compartilhado por todas as telas.
class AppRoutes {
  static const sample = '/';
  static const sampleActionButton = '/action-button';
  static const sampleLoading = '/loading';
  static const sampleTabBar = '/tab-bar';
  static const sampleListItems = '/list-items';

  static Map<String, WidgetBuilder> routes = {
    sample: (_) => const SampleScreen(),
    sampleActionButton: (_) => const SampleActionButtonScreen(),
    sampleLoading: (_) => const SampleLoadingScreen(),
    sampleTabBar: (_) => const SampleTabBarScreen(),
    sampleListItems: (_) => const SampleListItemsScreen(),
  };
}
