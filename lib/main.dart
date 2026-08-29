import 'package:flutter/material.dart';
import 'common/routes/app_routes.dart';
import 'common/theme/app_theme.dart';

void main() {
  runApp(const DesignSystemSampleApp());
}

class DesignSystemSampleApp extends StatelessWidget {
  const DesignSystemSampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BetterCash -- Sample',
      theme: AppTheme.light(),
      initialRoute: AppRoutes.sample,
      routes: AppRoutes.routes,
    );
  }
}
