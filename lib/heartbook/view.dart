import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import '../services.dart';
import 'logic.dart';

class HeartbookPage extends StatelessWidget {

  const HeartbookPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HeartbookLogic());
    late var interpreter;
    var _classifier = Classifier();
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
          title: Text("心情本"),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(4.w),
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).cardColor,
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("心情温度曲线",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                      Text("记录你的心情趋势~",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w200),),
                     SizedBox(height: 1.h,),
                     Container(
                       padding: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                       width: 100.w,
                       height: 20.h,
                       child: LineChart(
                           logic.mainData(context)
                       ),
                     )
                    ],
                  )
                ),
                SizedBox(height: 1.h,),
                Container(
                    padding: EdgeInsets.all(4.w),
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).cardColor,
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("心情统计图",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                        Text("记录你的每月心情~",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w200),),
                        SizedBox(height: 1.h,),
                        Container(
                          padding: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
                          width: 100.w,
                          height: 20.h,
                          child: BarChart(
                              logic.mainBarData(context)
                          ),
                        )
                      ],
                    )
                ),
                SizedBox(height: 1.h,),
                Container(
                    padding: EdgeInsets.all(4.w),
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).cardColor,
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("心情相册",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                        Text("把旧照片当作时光机~",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w200),),
                        SizedBox(height: 1.h,),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            GridView(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 1.h,
                                crossAxisCount: 3, //横轴三个子widget
                                childAspectRatio: 1//宽高比为1时，子widget
                            ),
                              shrinkWrap: true,
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
                            Container(
                              width: 100.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                              ),
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                onPressed: (){},
                                child: Text("查看更多"),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                ),
                SizedBox(height: 2.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("所有回忆整理均在本地进行")
                    ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
