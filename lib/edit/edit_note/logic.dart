import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart' as fluq;
import 'package:iconsax/iconsax.dart';
import 'package:newheartnote/command.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
class EditNoteLogic extends GetxController {
  //编辑器定义
  final fluq.QuillController Qcontroller = fluq.QuillController.basic();
  late final Directory? downloadsDir,temporaryDir,docDir;
  //录音定义
  var showStartRecord = true.obs,hasRecord = false.obs; //显示开始录音按钮 true为显示开始按钮 未录音状态
  var recordState = 0.obs; //0:未录制  1:正在录制  2:暂停
  List pauseResumeIcon = [Iconsax.pause, Iconsax.pause, Iconsax.play].obs;
  late Timer recordTimer;
  var reccordTime = 0.obs,
      endTime = 0.obs;
  bool timerIsActive = false;
  TextEditingController _textEditingController = TextEditingController();
  var record = AudioRecorder();

  //整体初始化
  void onInit()  {
    super.onInit();
    getPath();
  }
  Future<void> getPath() async {
    downloadsDir = await getDownloadsDirectory();
    temporaryDir = await getTemporaryDirectory();
    docDir = await getDownloadsDirectory();
  }
  void ShowTimePicker(context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
  }

  void startTimer() {

    if (timerIsActive == false) {
      timerIsActive = true;
      const oneSec = Duration(seconds: 1);
      recordTimer = Timer.periodic(
        oneSec,
            (Timer timer) {
          reccordTime.value++;
          update();
        },
      );
    }
  }

  void pauseTimer() {
    if (timerIsActive) {
      recordTimer.cancel();
      timerIsActive = false;
    }
  }

  void resumeTimer() {
    startTimer();
  }

  void stopTimer() {
    if (timerIsActive) {
      recordTimer.cancel();
      timerIsActive = false;
    }
    endTime.value = reccordTime.value;
    reccordTime.value = 0;
  }

  void startRecord() async {
    record = AudioRecorder();
    await record.hasPermission();
    var tmpfile = File(temporaryDir!.path+"/1.m4a");
    tmpfile.delete(recursive: false);
    if (await record.hasPermission()) {
      await record.start(
          RecordConfig(),
          path: temporaryDir!.path+"/1.m4a"
      );
      recordState.value = 1;
      showStartRecord.value = false;
      startTimer();
      update();
      print("开始");
      //}
    }
  }

    void resumeRecord() async {
      if (recordState == 2) {
        await record.resume();
        recordState.value = 1;
        resumeTimer();
        update();
      }
    }

    void pauseRecord() async {
      if (recordState == 1) {
        await record.pause();
        recordState.value = 2;
        pauseTimer();
        update();
      } else {
        resumeRecord();
        update();
      }
    }


    void stopRecord() async {
      await record.stop();
      recordState.value = 0;
      showStartRecord.value = true;
      await record.dispose();
      stopTimer();
      update();
      askToSave();
    }
    void askToSave(){
      Get.defaultDialog(
          title: "要保存这段录音吗",
          content:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: "录音备注",
                ),
              ),
            ],
          ),
          textConfirm: "保存",
          onConfirm: (){
            print(_textEditingController.text);
            saveRecord();
            hasRecord.value = true;
            update();
            Get.back();
          },
        textCancel: "不保存",
        onCancel: ()=>Get.back(),
      );
    }
    void saveRecord() async {
    Directory saveRecordpath =Directory(docDir!.path+"/record");
    if(await saveRecordpath.exists()==false){
      await saveRecordpath.create();
    }
    String saveName = getRandomString(6);
    File saveFile = File(saveRecordpath.path+"/"+saveName+".m4a");
    File tempFile = File(temporaryDir!.path+"/1.m4a");
    tempFile.copy(saveFile.path);
    print("OK");
    }
  }

