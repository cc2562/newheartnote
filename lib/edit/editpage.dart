import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' as fluq;
import 'package:iconsax/iconsax.dart';
import 'package:newheartnote/Widgets/normal.dart';
import 'package:record/record.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class editPage extends StatefulWidget {
  const editPage({super.key});

  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  fluq.QuillController _controller = fluq.QuillController.basic();
  int recordState = 0;
  bool showStartRecord=true;
  final record = AudioRecorder();
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
          child: Container(
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
                        icon: Icon(
                          Iconsax.arrow_left,
                          color: Colors.white,
                        ),
                      )),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                          },
                          child: Text(
                            "2023.3.10",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        flex: 5,
                      ),
                      Expanded(
                          child: IconButton(
                        onPressed: () {},
                        icon: Icon(
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
                                child: fluq.QuillEditor(
                                  placeholder: "记录今天吧~",
                                  controller: _controller,
                                  readOnly: false,
                                  focusNode: FocusNode(),
                                  scrollController: ScrollController(),
                                  scrollable: true,
                                  padding: EdgeInsets.zero,
                                  autoFocus: true,
                                  expands: false,
                                  customStyles: fluq.DefaultStyles(
                                    paragraph: fluq.DefaultTextBlockStyle(
                                        const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          height: 1.15,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        const fluq.VerticalSpacing(16, 0),
                                        const fluq.VerticalSpacing(0, 0),
                                        null),
                                    h1: fluq.DefaultTextBlockStyle(
                                        const TextStyle(
                                          fontSize: 36,
                                          color: Colors.black,
                                          height: 1.15,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        const fluq.VerticalSpacing(16, 0),
                                        const fluq.VerticalSpacing(0, 0),
                                        null),
                                    h2: fluq.DefaultTextBlockStyle(
                                        const TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          height: 1.15,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        const fluq.VerticalSpacing(16, 0),
                                        const fluq.VerticalSpacing(0, 0),
                                        null),
                                    h3: fluq.DefaultTextBlockStyle(
                                        const TextStyle(
                                          fontSize: 26,
                                          color: Colors.black,
                                          height: 1.15,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        const fluq.VerticalSpacing(16, 0),
                                        const fluq.VerticalSpacing(0, 0),
                                        null),
                                    sizeSmall: const TextStyle(fontSize: 9),
                                    subscript: const TextStyle(
                                      fontFamily: 'SF-UI-Display',
                                      fontFeatures: [FontFeature.subscripts()],
                                    ),
                                    superscript: const TextStyle(
                                      fontFamily: 'SF-UI-Display',
                                      fontFeatures: [
                                        FontFeature.superscripts()
                                      ],
                                    ),
                                  ),

                                  // true for view only mode
                                ),
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
                                    onPressed: () {}, icon: Icon(Icons.image)),
                                IconButton(
                                    onPressed: () {
                                      recordTime();
                                    }, icon: Icon(Icons.tag)),
                                IconButton(
                                    onPressed: () {
                                      SystemChannels.textInput
                                          .invokeMethod('TextInput.hide');
                                      record.hasPermission();
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return recordPage();
                                          });
                                    },
                                    icon: Icon(Icons.fiber_smart_record)),
                                fluq.QuillToolbar.basic(
                                  toolbarIconSize: 6.w,
                                  controller: _controller,
                                  showFontFamily: false,
                                  showFontSize: false,
                                  showAlignmentButtons: false,
                                  showLink: true,
                                  showSearchButton: false,
                                  showBackgroundColorButton: false,
                                  showCodeBlock: true,
                                  showCenterAlignment: false,
                                  showLeftAlignment: false,
                                  showRightAlignment: false,
                                  showSmallButton: false,
                                  showJustifyAlignment: false,
                                  showStrikeThrough: false,
                                  showColorButton: false,
                                  showSubscript: false,
                                  showSuperscript: false,
                                  showIndent: true,
                                  showInlineCode: false,
                                  showHeaderStyle: true,
                                  showListCheck: false,
                                  showClearFormat: false,
                                ),
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
                  child: IconButton(
                  onPressed: () async {
                    if (recordState == 0) {
                      //开始录制
                      setState(() {
                        recordState = 1;
                        showStartRecord=false;
                      });
                      await record.start(
                          const RecordConfig(encoder: AudioEncoder.wav),
                          path: 'aFullPath/myFile.m4a');
                    }
                  },
                  icon: Icon(
                    Iconsax.microphone_2,
                    color: Theme.of(context).primaryColor,
                    size: 10.w,
                  ),
                ),
                  visible: showStartRecord,
                ),
                Visibility(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          if (recordState == 1) {
                            //暂停
                            setState(() {
                              recordState = 2;
                            });
                            await record.pause();
                          }else if(recordState==2){
                            setState(() {
                              recordState=1;
                            });
                            await record.resume();
                          }
                        },
                        icon: Icon(
                          pauseResumeIcon[recordState],
                          color: Theme.of(context).primaryColor,
                          size: 10.w,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          if(await record.isPaused()){
                            await record.resume();
                            record.stop();
                          }else{
                            record.stop();
                          }
                          recordState=0;
                        },
                        icon: Icon(
                          Iconsax.tick_square,
                          color: Theme.of(context).primaryColor,
                          size: 10.w,
                        ),
                      )
                    ],
                  ),
                  visible:!showStartRecord,
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
          Text("单篇日记仅支持添加一篇录音")
        ],
      ),
    );
  }
  String recordTime(){
    int count = 0;
    const period = const Duration(seconds: 1);
    print('currentTime='+DateTime.now().toString());
    Timer.periodic(period, (timer) {
      //到时回调
      print('afterTimer='+DateTime.now().toString());
      count++;
      if (count >= 5) {
        //取消定时器，避免无限回调
        timer.cancel();
      }
    });
    return "1";
  }
}
