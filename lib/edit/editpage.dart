import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' as fluq;
import 'package:iconsax/iconsax.dart';
import 'package:newheartnote/Widgets/normal.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class editPage extends StatefulWidget {
  const editPage({super.key});

  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  final fluq.QuillController Qcontroller = fluq.QuillController.basic();
  int recordState = 0;
  bool showStartRecord=true;
  List pauseResumeIcon=[Iconsax.pause,Iconsax.pause,Iconsax.play];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                                child: fluq.QuillEditor.basic(configurations: fluq.QuillEditorConfigurations(controller: Qcontroller)),
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
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Theme.of(context).cardColor,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: const Icon(Icons.image)),
                                IconButton(
                                    onPressed: () {
                                      print("11211");
                                      recordTime();
                                    }, icon: const Icon(Icons.tag)),
                                IconButton(
                                    onPressed: () {
                                      SystemChannels.textInput
                                          .invokeMethod('TextInput.hide');
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return recordPage();
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
                                          controller: Qcontroller,
                                        ),
                                        fluq.QuillToolbarHistoryButton(
                                          isUndo: false,
                                          controller: Qcontroller,
                                        ),
                                        fluq.QuillToolbarToggleCheckListButton(
                                          controller: Qcontroller,
                                        ),
                                        fluq.QuillToolbarToggleStyleButton(
                                          controller: Qcontroller,
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

  Widget recordPage() {
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
                  visible: showStartRecord,
                  child: IconButton(
                  onPressed: () async {
                    //开始录音事件
                  },
                  icon: Icon(
                    Iconsax.microphone_2,
                    color: Theme.of(context).primaryColor,
                    size: 10.w,
                  ),
                ),
                ),
                Visibility(
                  visible:!showStartRecord,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          //暂停录音事件
                        },
                        icon: Icon(
                          pauseResumeIcon[recordState],
                          color: Theme.of(context).primaryColor,
                          size: 10.w,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          //结束录音
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
                  "00:00",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp),
                )
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          const Text("单篇日记仅支持添加一篇录音")
        ],
      ),
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
