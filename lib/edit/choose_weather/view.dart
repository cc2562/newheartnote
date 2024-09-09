import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../Widgets/normal.dart';
import 'logic.dart';

class ChooseWeatherPage extends StatelessWidget {
  ChooseWeatherPage({Key? key}) : super(key: key);

  final logic = Get.put(ChooseWeatherLogic());

  @override

  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      color:Theme.of(context).cardColor,
      padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 0),
      child: Column(
        children: [
          bottomSheetTitle("记录天气",context),
          SizedBox(height: 2.h,),
          GetBuilder<ChooseWeatherLogic>(builder: (logic){
            return Container(
              padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
              width: 100.w,
              height: 25.h,
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 700),
                    reverseDuration: Duration(milliseconds: 700),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      var tween=Tween<Offset>(begin: Offset(6, 1), end: Offset(0, 0));
                      return MySlideTransition(
                        child: child,
                        position: tween.animate(animation),
                      );
                    },
                    child: logic.showWeatherIcon(),
                  ),
                  SizedBox(height: 3.h,),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 700),
                    reverseDuration: Duration(milliseconds: 700),
                    child: logic.showWeatherText(),
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: 2.h,),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
          ),
          itemCount: 6,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: ()=> logic.change(index),
                child: Flex(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    Expanded(child: Icon(logic.weatherIconList[index],key: Key("day_sunny"),color: Colors.white,)),
                    Expanded(child: Text(logic.weatherTextList[index]),),
                  ],
                ),
              ),
            );
          },
        )
        ],
      ),
    );
  }
}
