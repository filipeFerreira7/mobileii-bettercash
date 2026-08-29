import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_sample/common/viewmodel/base_view_model.dart';

class _TestViewModel extends BaseViewModel {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notify();
  }
}

void main() {
  group('BaseViewModel', () {
    test('deve iniciar com isDisposed false', () {
      final vm = _TestViewModel();
      expect(vm.isDisposed, isFalse);
      vm.dispose();
    });

    test('deve marcar isDisposed como true apos dispose', () {
      final vm = _TestViewModel();
      vm.dispose();
      expect(vm.isDisposed, isTrue);
    });

    test('notify nao deve lancar erro apos dispose', () {
      final vm = _TestViewModel();
      vm.dispose();
      expect(() => vm.notify(), returnsNormally);
    });

    test('deve notificar listeners ao chamar notify', () {
      final vm = _TestViewModel();
      var notified = false;
      vm.addListener(() => notified = true);
      vm.increment();
      expect(notified, isTrue);
      vm.dispose();
    });

    test('nao deve notificar listeners apos dispose', () {
      final vm = _TestViewModel();
      var notified = false;
      vm.addListener(() => notified = true);
      vm.dispose();
      vm.increment();
      expect(notified, isFalse);
    });
  });
}
