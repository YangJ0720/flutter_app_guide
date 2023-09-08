import 'package:flutter/material.dart';
import 'package:flutter_app_guide/guide/mask_guide_view.dart';
import 'package:flutter_app_guide/guide/mould/mask_guide_mould.dart';

class MaskGuide {

  OverlayEntry? overlayEntry;

  /// 展示蒙层的方法
  /// [Params] 上下文对象、需要展示的控件的keys
  void showMaskGuide(BuildContext context, List<GlobalKey> keys, List<MaskGuideMould> moulds) {
    var overlay = OverlayEntry(
      builder: (context) {
        return MaskGuideView(
          keys: keys,
          moulds: moulds,
          doneCallBack: () => dismissMaskGuide(),
        );
      },
    );
    Overlay.of(context)?.insert(overlay);
    //
    overlayEntry = overlay;
  }

  /// 关闭蒙层的方法
  void dismissMaskGuide() {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}