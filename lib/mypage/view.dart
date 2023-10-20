import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newheartnote/Widgets/normal.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'logic.dart';

class MypagePage extends StatelessWidget {
  const MypagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MypageLogic());

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
          title: Text("我的"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(4.w, 1.h , 4.w, 0),
          child: Column(
            children: [
              noteCard(
                Column(
              children: [
                Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("心记陪你记录了",style: TextStyle(fontSize: 16.sp),),
              Text("3",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
              Text("天",style: TextStyle(fontSize: 16.sp),),
            ],
          ),
                Row(
                  children: [
                    Text("留下了",style: TextStyle(fontSize: 16.sp),),
                    Text("5",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                    Text("篇日记",style: TextStyle(fontSize: 16.sp),)
                  ],
                )
              ],
          ),
                context,
              ),
              SizedBox(height: 1.h,),
              noteCard(Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("心记"),
                      Icon(Iconsax.add,color: Colors.amber,),
                    ],
                  ),
                  Text("所有功能 即刻享有",style: TextStyle(fontSize: 18.sp),),
                  Text("密码保护 更多图像 无限标签 录音日记...",style: TextStyle(fontSize: 14.sp),),
                  Row(
                    children: [
                      TextButton(child: Text("购买Pro版本"),onPressed: (){},),
                      Text("上新优惠 %30OFF",style: TextStyle(color: Colors.amber),),
                    ],
                  )
                ],
              ), context),
              SizedBox(height: 1.h,),
              noteCard(ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    leading: Icon(Iconsax.password_check),
                    title: Text("密码保护"),
                    trailing: Icon(Iconsax.arrow_right_3),
                  ),
                  ListTile(
                    leading: Icon(Iconsax.box),
                    title: Text("导出日记"),
                    trailing: Icon(Iconsax.arrow_right_3),
                  ),
                  ListTile(
                    leading: Icon(Iconsax.paintbucket),
                    title: Text("设置主题"),
                    trailing: Icon(Iconsax.arrow_right_3),
                  ),
                  ListTile(
                    leading: Icon(Iconsax.message_question),
                    title: Text("使用帮助"),
                    trailing: Icon(Iconsax.arrow_right_3),
                  ),
                  ListTile(
                    leading: Icon(Iconsax.message),
                    title: Text("联系开发者"),
                    trailing: Icon(Iconsax.arrow_right_3),
                  ),
                ],
              ), context),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){}, child: Text("用户协议")),
                  TextButton(onPressed: (){}, child: Text("隐私政策")),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
