import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart' as fluq;
import 'package:iconsax/iconsax.dart';
//import 'package:record/record.dart';
class EditNoteLogic extends GetxController {
  //编辑器定义
  final fluq.QuillController Qcontroller = fluq.QuillController.basic();
  //录音定义
  var showStartRecord = true.obs;//显示开始录音按钮 true为显示开始按钮 未录音状态
  var recordState = 0.obs;//0:未录制  1:正在录制  2:暂停
  List pauseResumeIcon=[Iconsax.pause,Iconsax.pause,Iconsax.play].obs;
  late Timer recordTimer;
  var reccordTime = 0.obs,endTime=0.obs;
  bool timerIsActive = false;
 // final record = AudioRecorder();

  void ShowTimePicker(context){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
  }

  void startTimer() {
    if(timerIsActive==false) {
      timerIsActive=true;
      const oneSec = Duration(seconds: 1);
      recordTimer = Timer.periodic(
        oneSec,
            (Timer timer) {
          reccordTime.value++;
          update();
          print(reccordTime.value);
        },
      );
    }
  }
  void pauseTimer(){
    if(timerIsActive){
      recordTimer.cancel();
      timerIsActive=false;
    }
  }
  void resumeTimer(){
    startTimer();
  }
  void stopTimer() {
    if(timerIsActive){
      recordTimer.cancel();
      timerIsActive=false;
    }
    endTime.value=reccordTime.value;
    reccordTime.value=0;
  }

  void startRecord() async{
    //if(await record.hasPermission()){
      //await record.start(
      //    RecordConfig(),
      //    path: 'aFullPath/myFile.m4a'
      //);
      recordState.value=1;
      showStartRecord.value=false;
      startTimer();
      update();
      print("开始");
    //}
  }

  void pauseRecord() async{
    if(recordState==1){
      //await record.pause();
      recordState.value=2;
      pauseTimer();
      update();
    }else{
      resumeRecord();
      update();
    }
  }
  void resumeRecord() async{
    if(recordState==2){
      //await record.resume();
      recordState.value=1;
      resumeTimer();
      update();
    }
  }
  void stopRecord() async{
    //await record.stop();
    recordState.value=0;
    showStartRecord.value=true;
    stopTimer();
    update();
  }

}
