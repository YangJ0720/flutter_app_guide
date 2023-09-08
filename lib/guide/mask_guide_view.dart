import 'package:flutter/material.dart';
import 'package:flutter_app_guide/guide/mask_controller.dart';
import 'package:flutter_app_guide/guide/mould/mask_guide_mould.dart';

class MaskGuideView extends StatefulWidget {
  final List<GlobalKey> keys;
  final List<MaskGuideMould> moulds;
  final Function? doneCallBack;

  const MaskGuideView({
    Key? key,
    required this.keys,
    required this.moulds,
    this.doneCallBack,
  }) : super(key: key);

  @override
  _MaskGuideViewState createState() => _MaskGuideViewState();
}

class _MaskGuideViewState extends State<MaskGuideView> {
  final MaskController _controller = MaskController();
  int _currentStep = 0;

  @override
  void dispose() {
    _controller.closed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      builder: (_, snapshot) {
        var index = snapshot.requireData;
        var key = widget.keys[index];
        var mould = widget.moulds[index];
        var renderObject = key.currentContext?.findRenderObject();
        if (renderObject == null) return const SizedBox();
        RenderBox renderBox = renderObject as RenderBox;
        return Stack(
          children: [
            ColorFiltered(
              // 源图像，使用srcOut
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.srcOut,
              ),
              child: Stack(
                children: [
                  // 目标图像
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      backgroundBlendMode: BlendMode.dstOut,
                    ),
                  ),
                  mould.buildTargetView(renderBox: renderBox),
                ],
              ),
            ),
            // 这里同样通过key可以拿到位置信息，然后显示步骤描述即可
            mould.buildIndicateView(
              renderBox: renderBox,
              callback: () {
                if (_currentStep >= widget.keys.length - 1) {
                  widget.doneCallBack?.call();
                  return;
                }
                _currentStep++;
                _controller.nextStep(_currentStep);
              },
            ),
          ],
        );
      },
      stream: _controller.stream,
      initialData: 0,
    );
  }
}
