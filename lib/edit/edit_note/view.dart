import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_quill/flutter_quill.dart' as fluq;
import '../../Widgets/normal.dart';
import 'logic.dart';

class EditNotePage extends StatelessWidget {
  EditNotePage({Key? key}) : super(key: key);

  final logic = Get.put(EditNoteLogic());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: SafeArea(
          child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Stack(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Iconsax.arrow_left,
                              color: Colors.white,
                            ),
                          )),
                      Expanded(
                        flex: 5,
                        child: TextButton(
                          onPressed: () {
                            logic.ShowTimePicker(context);
                          },
                          child: const Text(
                            "2023.3.10",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 6.h, 0, 0),
                          padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 5.h),
                          width: 100.w,
                          // height: size.height-20.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).cardColor),
                          child: ListView(
                            children: [
                              Container(
                                child: fluq.QuillEditor.basic(configurations: fluq.QuillEditorConfigurations(
                                  controller: logic.Qcontroller,
                                  placeholder: "记录今天吧~",
                                  autoFocus: true,
                                )),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.emoji_normal,
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "选择心情",
                                        style: TextStyle(
                                            color: Colors.grey.shade500),
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.sun,
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "选择天气",
                                        style: TextStyle(
                                            color: Colors.grey.shade500),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  //底部工具栏
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Theme.of(context).cardColor,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                //选择图片
                                IconButton(
                                    onPressed: () {}, icon: const Icon(Icons.image)),
                                //标签
                                IconButton(
                                    onPressed: () {
                                      //标签事件
                                    }, icon: const Icon(Icons.tag)),
                                IconButton(
                                    onPressed: () {
                                      SystemChannels.textInput
                                          .invokeMethod('TextInput.hide');
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return recordPage(context);
                                          });
                                    },
                                    icon: const Icon(Icons.fiber_smart_record)),
                                fluq.QuillToolbar(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: [
                                          fluq.QuillToolbarHistoryButton(
                                            isUndo: true,
                                            controller: logic.Qcontroller,
                                          ),
                                          fluq.QuillToolbarHistoryButton(
                                            isUndo: false,
                                            controller: logic.Qcontroller,
                                          ),
                                          fluq.QuillToolbarToggleCheckListButton(
                                            controller: logic.Qcontroller,
                                          ),
                                          fluq.QuillToolbarToggleStyleButton(
                                            controller: logic.Qcontroller,
                                            attribute: fluq.Attribute.blockQuote,
                                          ),
                                        ]
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ))
                ],
              )),
        ));
  }




  Widget recordPage(context) {
    return GetBuilder<EditNoteLogic>(builder: (logic){
      return Container(
        margin: EdgeInsets.fromLTRB(3.w, 2.h, 3.w, 1.h),
        child: Column(
          children: [
            bottomSheetTitle("录音", context),
            SizedBox(
              height: 3.h,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
              width: 100.w,
              height: 10.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).secondaryHeaderColor,
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  //开始录音
                  Visibility(
                    visible: logic.showStartRecord.value,
                    child: IconButton(
                      onPressed: () async {
                        //开始录音事件
                        logic.startRecord();
                      },
                      icon: Icon(
                        Iconsax.microphone_2,
                        color: Theme.of(context).primaryColor,
                        size: 10.w,
                      ),
                    ),
                  ),
                  Visibility(
                    visible:!logic.showStartRecord.value,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            //暂停录音事件
                            logic.pauseRecord();
                          },
                          icon: Icon(
                            logic.pauseResumeIcon[logic.recordState.value],
                            color: Theme.of(context).primaryColor,
                            size: 10.w,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            //结束录音
                            logic.stopRecord();
                          },
                          icon: Icon(
                            Iconsax.tick_square,
                            color: Theme.of(context).primaryColor,
                            size: 10.w,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    (logic.showStartRecord.value)? logic.endTime.value.toString():logic.reccordTime.value.toString(),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(1.w, 0, 1.w, 0),
              width: 100.w,
              height: 10.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).secondaryHeaderColor,
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          //暂停录音事件

                        },
                        icon: Icon(
                          logic.pauseResumeIcon[logic.recordState.value],
                          color: Theme.of(context).primaryColor,
                          size: 10.w,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "今天的美好录音",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp),
                        ),
                        Text(
                          "20 S",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp),
                        )
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () async {
                      //结束录音

                    },
                    icon: Icon(
                      Iconsax.play_remove,
                      color: Theme.of(context).primaryColor,
                      size: 10.w,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 3.h,
            ),
            const Text("单篇日记仅支持添加一篇录音")
          ],
        ),
      );
    }

    );
  }
  String recordTime(){
    int count = 0;
    const period = Duration(seconds: 1);
    print('currentTime=${DateTime.now()}');
    Timer.periodic(period, (timer) {
      //到时回调
      print('afterTimer=${DateTime.now()}');
      count++;
      if (count >= 5) {
        //取消定时器，避免无限回调
        timer.cancel();
      }
    });
    return "1";
  }

}
