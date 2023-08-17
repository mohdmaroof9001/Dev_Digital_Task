import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class TimerController extends GetxController {
  TextEditingController secondsTEC = TextEditingController();
  final isStart = false.obs;
  final isPaused = false.obs;
  final secondsToHMS = "HH:mm:ss".obs;
  final secondsValue = 0.obs;
  final timeList = [].obs;

  late Timer timer;

  void startTimer(seconds) {
    isStart.value = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        formatSecondsToHMS(seconds);
      } else {
        isStart.value = false;
        timer.cancel();
      }
    });
  }

  formatSecondsToHMS(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    secondsToHMS.value = '$hoursStr:$minutesStr:$secondsStr';
    secondsValue.value = seconds;
  }

  void pauseTimer() {
    timer.cancel();
    isPaused.value = true;
  }

  void resumeTimer() {
    startTimer(secondsValue.value);
    isPaused.value = false;
  }
}
