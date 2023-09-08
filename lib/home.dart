import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_guide/guide/mask_guide.dart';
import 'package:flutter_app_guide/guide/mould/mask_guide_mould_list.dart';
import 'package:flutter_app_guide/guide/mould/mask_guide_mould_star.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey _keyOne = GlobalKey();
  final GlobalKey _keyTwo = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      var guide = MaskGuide();
      guide.showMaskGuide(
        context,
        [_keyOne, _keyTwo],
        [MaskGuideMouldList(), MaskGuideMouldStar(context: context)],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(DateTime.now().toIso8601String())),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return ListTile(
            key: index == 1 ? _keyOne : null,
            title: Text(index.toString()),
            leading: Icon(Icons.star, key: index == 2 ? _keyTwo : null),
          );
        },
        itemCount: 100,
      ),
    );
  }
}
