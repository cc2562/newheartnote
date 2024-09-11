import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../generated/assets.dart';

class ChooseFeelingLogic extends GetxController {
  //心情越好 Value越高 5个阶段  很好 好 一般 不好 很不好
  //0-20 很不好 0
  //21-40 不好 1
  //41-60 一般 2
  //61 - 80 好 3
  //81-100 很好 4
  var nowFeelingValue =50.0.obs;
  var nowFeelingLevel =2.obs;
  List<AssetImage> feelingImg = [
    AssetImage(Assets.feelingVeryBad),
    AssetImage(Assets.feelingBad),
    AssetImage(Assets.feelingNormal),
    AssetImage(Assets.feelingHappy),
    AssetImage(Assets.feelingVaryHappy)
  ];
  List <String> feelingText = [
    "很不好",
    "不好",
    "一般",
    "好",
    "很好"
  ];
  List feelingImgWidget=[
    Image(image:AssetImage(Assets.feelingVeryBad),fit: BoxFit.contain,width: 100.w,height: 20.h,key: Key("verybad"),),
    Image(image:AssetImage(Assets.feelingBad),fit: BoxFit.contain,width: 100.w,height: 20.h,key: Key("bad"),),
    Image(image:AssetImage(Assets.feelingNormal),fit: BoxFit.contain,width: 100.w,height: 20.h,key: Key("normal"),),
    Image(image:AssetImage(Assets.feelingHappy),fit: BoxFit.contain,width: 100.w,height: 20.h,key: Key("happy"),),
    Image(image:AssetImage(Assets.feelingVaryHappy),fit: BoxFit.contain,width: 100.w,height: 20.h,key: Key("varyhappy"),),
  ];
  Widget showFeelingImg(){
    switch(nowFeelingLevel.value){
      case 0:
        return feelingImgWidget[0];
      case 1:
        return feelingImgWidget[1];
      case 2:
        return feelingImgWidget[2];
      case 3:
        return feelingImgWidget[3];
      case 4:
        return feelingImgWidget[4];

    }
    return Container();
  }
  void changeFeelingValue(double value){
    nowFeelingValue.value=value;
    print(value.toString());
    //心情越好 Value越高 5个阶段  很好 好 一般 不好 很不好
    //0-20 很不好 0
    //21-40 不好 1
    //41-60 一般 2
    //61 - 80 好 3
    //81-100 很好 4
    if(nowFeelingValue>=0&&nowFeelingValue<=20){
      nowFeelingLevel.value=0;
    }else if(nowFeelingValue>20&&nowFeelingValue<=40){
      nowFeelingLevel.value=1;
    }else if(nowFeelingValue>40&&nowFeelingValue<=60) {
      nowFeelingLevel.value = 2;
    }else if(nowFeelingValue>60&&nowFeelingValue<=80){
      nowFeelingLevel.value=3;
    }else if(nowFeelingValue>80&&nowFeelingValue<=100){
      nowFeelingLevel.value=4;
    }

    update();
  }
}
