import 'package:flutter/material.dart';
import 'package:flutter_app_guide/guide/mould/mask_guide_mould.dart';

class MaskGuideMouldList extends MaskGuideMould {

  @override
  Widget buildTargetView({required RenderBox renderBox}) {
    var size = renderBox.size;
    var offset = localToGlobal(renderBox);
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        width: size.width,
        height: size.height,
      ),
      left: offset.dx,
      top: offset.dy,
    );
  }

  @override
  Widget buildIndicateView({required RenderBox renderBox, VoidCallback? callback}) {
    var size = renderBox.size;
    var offset = localToGlobal(renderBox);
    var horizontalPadding = 10;
    return Positioned(
      child: Material(
        child: Container(
          child: Column(
            children: [
              Text(
                '这是新手指引 -> $size',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () => callback?.call(),
                child: const Text(
                  '关闭',
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.zero,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.end,
          ),
          constraints: BoxConstraints(maxWidth: size.width - horizontalPadding * 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.green,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
        ),
        color: Colors.transparent,
      ),
      left: offset.dx + horizontalPadding,
      top: offset.dy + size.height,
    );
  }

}