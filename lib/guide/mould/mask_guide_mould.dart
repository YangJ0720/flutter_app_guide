import 'package:flutter/material.dart';

abstract class MaskGuideMould {

  final BuildContext context;

  MaskGuideMould({required this.context});

  /// 指引目标组件
  Widget buildTargetView({required RenderBox renderBox});

  /// 操作提示组件
  Widget buildIndicateView({required RenderBox renderBox, VoidCallback callback});

  /// 指引目标组件坐标
  Offset localToGlobal(RenderBox renderBox) {
    return renderBox.localToGlobal(Offset.zero);
  }
}