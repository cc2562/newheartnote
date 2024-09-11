import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Widgets/normal.dart';
import '../../command.dart';
import '../choose_weather/logic.dart';
import 'logic.dart';

class ChooseFeelingPage extends StatelessWidget {
  ChooseFeelingPage({Key? key}) : super(key: key);

  final logic = Get.put(ChooseFeelingLogic());

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60.h,
      color:Theme.of(context).cardColor,
      padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bottomSheetTitle("记录心情",context),
          SizedBox(height: 2.h,),
          GetBuilder<ChooseFeelingLogic>(builder: (logic){
            return Container(
              padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
              width: 100.w,
              height: 25.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 700),
                    reverseDuration: Duration(milliseconds: 700),

                    child: logic.showFeelingImg(),
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: 2.h,),
          Text("为心情打分",style: TextStyle(fontSize: 18.sp,color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
          SizedBox(height: 2.h,),
          GetBuilder<ChooseFeelingLogic>(builder: (logic){
            return SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 10.w,
                  thumbColor: Colors.white,
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 0,
                  ),
                  thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 4.w
                  ),
                  trackShape: CustomTrackShape(

                  ),
                  activeTrackColor: Theme.of(context).secondaryHeaderColor,
                  inactiveTrackColor:Theme.of(context).secondaryHeaderColor,
                ),
                child: Slider(
                  label: logic.nowFeelingValue.value.toStringAsFixed(0),
                  value: logic.nowFeelingValue.value,
                  max: 100,
                  min: 0,
                  divisions: 100,
                  onChanged: (v)=>logic.changeFeelingValue(v),
                ),
            );
          }),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("很不好"),Text("很好")
            ],
          )
        ],
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required Offset thumbCenter,
        Offset? secondaryOffset,
        bool isDiscrete = false,
        bool isEnabled = false,
        double additionalActiveTrackHeight = 2,
      }){

    super.paint(context, offset,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        enableAnimation: enableAnimation,
        textDirection: textDirection,
        thumbCenter: thumbCenter,
        isDiscrete: isDiscrete,
        isEnabled: isEnabled,
        additionalActiveTrackHeight: 0);
  }

}
