import 'dart:async';

class MaskController {
  StreamController<int> controller = StreamController();

  Stream<int> get stream => controller.stream;

  void nextStep(int step) => controller.sink.add(step);

  /// 关闭stream流
  void closed() => controller.close();
}
