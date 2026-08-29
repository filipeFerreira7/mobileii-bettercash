import 'package:flutter/foundation.dart';

/// Base class para todos os ViewModels do Design System.
/// Centraliza o padrão de notificação de mudança de estado, evitando
/// que cada componente reimplemente o próprio ChangeNotifier "cru".
abstract class BaseViewModel extends ChangeNotifier {
  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  /// notifyListeners "seguro" — evita erro de notificar depois do dispose.
  void notify() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }
}
