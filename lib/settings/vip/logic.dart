import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VipLogic extends GetxController {
  int _clickCount = 0;
  void tapName() {
    _clickCount++;

    // 检查是否达到了三次点击
    if (_clickCount == 3) {
      print('Triple click detected!');
      Get.defaultDialog(
        title: "愿我们都能更加勇敢🏳️‍🌈",
        content:  Text("不向焦虑与抑郁投降，这个世界终会有我们存在的地方\n如果你能记住我的名字，如果你们都能记住我的名字，也许我或者“我们”，终有一天能自由地生存着。"),
       
      );
      _clickCount = 0; // 重置计数器
      // 在这里可以添加更多的逻辑，比如导航到其他页面等
    }
  }
}
