import 'package:flutter/material.dart';
import '../../screens/sample_screen.dart';
import '../../screens/sample_action_button_screen.dart';
import '../../screens/sample_loading_screen.dart';
import '../../screens/sample_tab_bar_screen.dart';
import '../../screens/sample_list_items_screen.dart';
import '../../screens/sample_progress_bar_screen.dart';
import '../../screens/sample_avatar_screen.dart';
import '../../screens/sample_badge_screen.dart';
import '../../screens/sample_chip_screen.dart';
import '../../screens/sample_card_screen.dart';
import '../../screens/sample_snackbar_screen.dart';
import '../../screens/sample_context_menu_screen.dart';

/// Gerenciador de rotas central do app de exemplo do Design System.
class AppRoutes {
  static const sample = '/';
  static const sampleActionButton = '/action-button';
  static const sampleLoading = '/loading';
  static const sampleTabBar = '/tab-bar';
  static const sampleListItems = '/list-items';
  static const sampleProgressBar = '/progress-bar';
  static const sampleAvatar = '/avatar';
  static const sampleBadge = '/badge';
  static const sampleChip = '/chip';
  static const sampleCard = '/card';
  static const sampleSnackBar = '/snackbar';
  static const sampleContextMenu = '/context-menu';

  static Map<String, WidgetBuilder> routes = {
    sample: (_) => const SampleScreen(),
    sampleActionButton: (_) => const SampleActionButtonScreen(),
    sampleLoading: (_) => const SampleLoadingScreen(),
    sampleTabBar: (_) => const SampleTabBarScreen(),
    sampleListItems: (_) => const SampleListItemsScreen(),
    sampleProgressBar: (_) => const SampleProgressBarScreen(),
    sampleAvatar: (_) => const SampleAvatarScreen(),
    sampleBadge: (_) => const SampleBadgeScreen(),
    sampleChip: (_) => const SampleChipScreen(),
    sampleCard: (_) => const SampleCardScreen(),
    sampleSnackBar: (_) => const SampleSnackBarScreen(),
    sampleContextMenu: (_) => const SampleContextMenuScreen(),
  };
}
