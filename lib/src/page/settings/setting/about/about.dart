import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_controller.dart';

class About extends StatelessWidget {

  TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontSize: 16
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutController>(
        init: AboutController(),
        builder: (controller) {
          return Scaffold(
              body: SafeArea(child: Padding(
              padding: EdgeInsets.all(16.0),
          child:Text("SleepEase是一款专注于帮助人们入睡的应用，通过播放大自然的声音，如海浪声、深林鸟鸣声、雨声等，为用户打造出一个轻松舒适的睡眠环境。无论您是因为工作压力大、焦虑情绪等原因导致失眠，还是长期睡眠不足，SleepEase都能够帮助您调节睡眠，让您在音乐的陪伴下渐渐入睡。同时，SleepEase拥有多种音效可供选择，你可以根据自己的喜好自由切换，定时开启，让您能够充分休息，并迎接健康的新一天。快来下载并使用SleepEase，让它成为您入睡前必不可少的助手吧！",
              style: textStyle,),)));
        }
    );
  }
}