import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget noteCard(Widget inwidget,context){
  return Container(
    //margin: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
    padding: EdgeInsets.all(4.w),
    width: 100.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).cardColor,
    ),
    child: inwidget,
  );
}

Widget bottomSheetTitle(String title,context){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(title,style: TextStyle(fontSize: 22.sp,color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
      SizedBox(width: 1.w,),
      Container(width: 3.w,height: 3.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Theme.of(context).secondaryHeaderColor),)
    ],
  );
}