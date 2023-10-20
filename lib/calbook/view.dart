import 'dart:io';

import 'package:flutter/material.dart';
import '../flutter_heatmap_calendar-1.0.5-self/lib/flutter_heatmap_calendar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import 'logic.dart';

class CalbookPage extends StatelessWidget {
  const CalbookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(CalbookLogic());
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).secondaryHeaderColor,
            Theme.of(context).colorScheme.background,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("日历本"),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(4.w),
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).cardColor,
                  ),
                  child:HeatMapCalendar(
                    defaultColor:Theme.of(context).cardColor,
                    textColor: Theme.of(context).textTheme.bodyLarge?.color,
                    borderRadius: 15.0,
                    flexible: true,
                    margin: EdgeInsets.all(1.w),
                    colorMode: ColorMode.color,
                    datasets: {
                      DateTime(2023, 9, 17): 1,
                      DateTime(2023, 9, 18): 2,
                      DateTime(2023, 9, 19): 3,
                      DateTime(2023, 9, 20): 4,
                      DateTime(2023, 9, 21): 5,
                      DateTime(2023, 9, 22): 6,
                      DateTime(2023, 9, 23): 7,
                      DateTime(2023, 9, 24): 8,
                      DateTime(2023, 9, 25): 9,
                      DateTime(2023, 9, 26): 10,
                    },
                    colorsets: const {
                      1: Color(0xffa200ff),
                      2: Color(0xff8431fa),
                      3: Color(0xff7746f7),
                      4: Color(0xff6762f5),
                      5: Color(0xff6FC3FC),
                      6: Color(0xff61c4de),
                      7: Color(0xff40c998),
                      8: Color(0xff9eb03a),
                      9: Color(0xfff39c12),
                      10: Color(0xffFF8B33),
                    },
                    showColorTip: false,
                    colorTipHelper: [Text("非常不愉快"),Text("非常愉快")],
                    onClick: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
                    },
                  ),
                ),
                SizedBox(height: 1.h,),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                     margin: EdgeInsets.fromLTRB(0, 1.h,0, 1.h),
                      padding: EdgeInsets.all(4.w),
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("2023年9月1日",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),),
                          Text("今天的天气非常不错，大家都十分的开心，希望明天的天气可以和今天一样继续非常不错！！"),
                          SizedBox(height: 1.h,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                                  width: 45.w,
                                  height: 45.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage("https://img2.baidu.com/it/u=1448498779,518156696&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1694970000&t=0f2b2f07c50bc01ce7270aaa7cddb98c"),
                                        fit: BoxFit.cover,
                                      )
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),Container(
                      margin: EdgeInsets.fromLTRB(0, 1.h,0, 1.h),
                      padding: EdgeInsets.all(4.w),
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("2023年9月1日",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),),
                          Text("今天的天气非常不错，大家都十分的开心，希望明天的天气可以和今天一样继续非常不错！！"),
                          SizedBox(height: 1.h,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                                  width: 45.w,
                                  height: 45.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage("https://img2.baidu.com/it/u=1448498779,518156696&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1694970000&t=0f2b2f07c50bc01ce7270aaa7cddb98c"),
                                        fit: BoxFit.cover,
                                      )
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),Container(
                      margin: EdgeInsets.fromLTRB(0, 1.h,0, 1.h),
                      padding: EdgeInsets.all(4.w),
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("2023年9月1日",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),),
                          Text("今天的天气非常不错，大家都十分的开心，希望明天的天气可以和今天一样继续非常不错！！"),
                          SizedBox(height: 1.h,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                                  width: 45.w,
                                  height: 45.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage("https://img2.baidu.com/it/u=1448498779,518156696&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1694970000&t=0f2b2f07c50bc01ce7270aaa7cddb98c"),
                                        fit: BoxFit.cover,
                                      )
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
