import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newheartnote/edit/edit_note/view.dart';
import 'package:newheartnote/edit/editpage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../edit/viewpage.dart';
import 'logic.dart';

class NotebookPage extends StatelessWidget {
  const NotebookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(NotebookLogic());

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
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("日记本"),
          actions: [
            IconButton(onPressed: (){
              Get.to( EditNotePage());
            }, icon: const Icon(Iconsax.add_circle))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 1.h, 0, 1.h),
                padding: EdgeInsets.all(4.w),
                width: 100.w,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("2023年9月1日",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),),
                      const Text("今天的天气非常不错，大家都十分的开心，希望明天的天气可以和今天一样继续非常不错！！"),
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
                                  image: const DecorationImage(
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
                  onTap: (){
                    Get.to(()=>const viewPage());
                  },
                ),
              ), Container(
                margin: EdgeInsets.fromLTRB(0, 1.h, 0, 1.h),
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
                    const Text("今天的天气非常不错，大家都十分的开心，希望明天的天气可以和今天一样继续非常不错！！"),
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
                                image: const DecorationImage(
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
              ), Container(
                margin: EdgeInsets.fromLTRB(0, 1.h, 0, 1.h),
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
                    const Text("今天的天气非常不错，大家都十分的开心，希望明天的天气可以和今天一样继续非常不错！！"),
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
                                image: const DecorationImage(
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
        )
      ),
    );
  }
}
