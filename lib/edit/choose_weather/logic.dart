import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather_icons/weather_icons.dart';

class ChooseWeatherLogic extends GetxController {
  var first = false.obs;
  var nowWeatherIcon = 1.obs;

  void change(int index){
    nowWeatherIcon.value = index+1;

    update();
  }


  List <IconData> weatherIconList = [
    WeatherIcons.day_sunny,
    WeatherIcons.cloud,
    WeatherIcons.cloudy,
    WeatherIcons.rain,
    WeatherIcons.rain_wind,
    WeatherIcons.snow
  ];
  List<String> weatherTextList = [
    "晴天",
    "多云",
    "阴天",
    "小雨",
    "大雨",
    "雪天"
  ];
  Widget showWeatherIcon(){
    switch(nowWeatherIcon.value){
      case 1:
        return Icon(weatherIconList[0],key: Key("day_sunny"),size: 25.w,color: Colors.white,);
      case 2:
        return Icon(weatherIconList[1],key: Key("cloud"),size: 25.w,color: Colors.white,);
        case 3:
          return Icon(weatherIconList[2],key: Key("cloudy"),size: 25.w,color: Colors.white,);
          case 4:
            return Icon(weatherIconList[3],key: Key("rain"),size: 25.w,color: Colors.white,);
            case 5:
              return  Icon(weatherIconList[4],key: Key("rain_wind"),size: 25.w,color: Colors.white,);
              case 6:
                return  Icon(weatherIconList[5],key: Key("snow"),size: 25.w,color: Colors.white,);
    }
    return Container();
  }
  Widget showWeatherText(){
    switch(nowWeatherIcon.value){
      case 1:
        return Text(weatherTextList[0],key: Key("day_sunny"),style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),);
      case 2:
        return Text(weatherTextList[1],key: Key("cloud"),style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),);
      case 3:
        return Text(weatherTextList[2],key: Key("cloudy"),style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),);
      case 4:
        return Text(weatherTextList[3],key: Key("rain"),style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),);
      case 5:
        return Text(weatherTextList[4],key: Key("rain_wind"),style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),);
      case 6:
        return Text(weatherTextList[5],key: Key("snow"),style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.bold),);
    }
    return Container();
  }
}

class MySlideTransition extends AnimatedWidget {
  const MySlideTransition({
    Key? key,
    required Animation<Offset> position,
    this.transformHitTests = true,
    required this.child,
  }) : super(key: key, listenable: position);

  final bool transformHitTests;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<Offset>;
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}