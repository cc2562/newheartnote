import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Widgets/normal.dart';
import 'logic.dart';

class VipPage extends StatelessWidget {
  VipPage({Key? key}) : super(key: key);

  final logic = Get.put(VipLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).secondaryHeaderColor,
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(3.w, 2.h,3.w,0),
          child:ListView(
            children: [
              bottomSheetTitle("心记+", context),
              SizedBox(height: 3.h,),
              noteCard(Text("心记+将为你解锁 个性主题 密码保护 录音日记 无限标签功能以及后续的更多新功能~"), context),
              SizedBox(height: 1.h,),
              noteCard(Text("心记是CC米饭第一个正式发布的APP，非常非常感谢你的喜欢以及使用。\n会员购买为自助模式，你只需要支付任意金额，然后点击激活会员按钮就可以使用心记+功能了。"), context),
              SizedBox(height: 1.h,),
              noteCard(Text("如果你还是学生，没有独立的经济能力，不需要支付任何费用，可以点击激活按钮，直接使用心记+功能。\n再次感谢你使用 心记"), context),
              SizedBox(height: 1.h,),
              ElevatedButton(onPressed: (){}, child: Text("激活会员")),
              SizedBox(height:2.w),
              Row(
                children: [
                  Text("点击激活会员代表你已同意"),TextButton(onPressed: (){}, child: const Text("心记会员服务协议")),
                ],
              ),
              SizedBox(height: 8.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text("MADE BY CC米饭",style: TextStyle(color: Colors.grey,fontSize: 14.sp),),
                    onTap: ()=>logic.tapName(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
