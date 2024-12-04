import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
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
  late final Directory? downloadsDir, temporaryDir, docDir;
  //录音定义
  var showStartRecord = true.obs,
      hasRecord = false.obs; //显示开始录音按钮 true为显示开始按钮 未录音状态
  var recordState = 0.obs; //0:未录制  1:正在录制  2:暂停
  List pauseResumeIcon = [Iconsax.pause, Iconsax.pause, Iconsax.play].obs;
  late Timer recordTimer;
  var reccordTime = 0.obs, endTime = 0.obs;
  bool timerIsActive = false;
  TextEditingController _textEditingController = TextEditingController();
  var record = AudioRecorder();
  //全局定义
  late String savePath;
  String hintName ="";

  //整体初始化
  void onInit() {
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
    var tmpfile = File(temporaryDir!.path + "/1.m4a");
    tmpfile.delete(recursive: false);
    if (await record.hasPermission()) {
      await record.start(RecordConfig(), path: temporaryDir!.path + "/1.m4a");
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

  void askToSave() {
    Get.defaultDialog(
      title: "要保存这段录音吗",
      content: Column(
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
      onConfirm: () {
        print(_textEditingController.text);
        hintName = _textEditingController.text.isEmpty?"未命名的录音":_textEditingController.text;
        saveRecord();
        hasRecord.value = true;
        update();
        Get.back();
      },
      textCancel: "不保存",
      onCancel: () => Get.back(),
    );
  }

  void saveRecord() async {
    Directory saveRecordpath = Directory(docDir!.path + "/record");
    if (await saveRecordpath.exists() == false) {
      await saveRecordpath.create();
    }
    String saveName = getRandomString(6);
    File saveFile = File(saveRecordpath.path + "/" + saveName + ".m4a");
    File tempFile = File(temporaryDir!.path + "/1.m4a");
    tempFile.copy(saveFile.path);
    savePath = saveFile.path;
    print("OK");
  }

  final player = AudioPlayer();
  List playingIcon = [Iconsax.play, Iconsax.pause, Iconsax.play].obs;
  var playingState = 0.obs; //0:未播放 1:正在播放 2:暂停播放
  var playDuration = 0.obs;
  //播放录音部分
  Future<void> startPlay() async {
    print("PLAAAAAAAAAAAAAAAA");
    //record.startPlay(temporaryDir!.path+"/1.m4a");
    //初始化播放内容
    await setSource();
    //开始播放
    player.resume();
    playingState.value = 1;
    player.onPlayerComplete.listen((event) {
      stopPlay();
    });
    player.onPositionChanged.listen((Duration  p){
    print('Current position: $p');
    playDuration.value= p.inSeconds;

    });
    startTimer();
    update();
  }

  Future<void> pausePlay() async {
    if(playingState.value == 1){
      player.pause();
      playingState.value = 2;
      pauseTimer();
      update();
    }

  }
  Future<void> stopPlay() async {
    playingState.value=0;
    stopTimer();
  }
  void resumePlay(){
    if(playingState.value == 2){
      player.resume();
      playingState.value = 1;
      resumeTimer();
      update();
    }

  }
  Future<void> setSource() async {
    await player.setSourceUrl(savePath); // equivalent to setSource(UrlSource(url));
  }

  Future<void> delRecord() async {
    if(playingState.value!=0){
      await player.stop();
      await player.dispose();
      stopPlay();
    }
    print("!@!!sdsaawsaaa");
    await File(savePath).delete();
    hasRecord.value = false;
    reccordTime.value = 0;
    showStartRecord.value = true;
    endTime.value = 0;
    hintName="";
    _textEditingController.clear();
    update();
  }
}
