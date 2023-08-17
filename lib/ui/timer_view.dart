import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_dev_digital/controller/timer_controller.dart';
import 'package:task_dev_digital/utils/utils.dart';

class TimerView extends StatelessWidget {
  TimerView({super.key});
  final controller = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: addText(
          "Count-Down Timer",
          get25FontSize(),
          Colors.white,
          FontWeight.w600,
        ),
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                controller.secondsTEC.clear();
                controller.isStart.value = false;
                controller.timer.cancel();
              },
              child: Icon(
                Icons.clear,
                size: get25FontSize(),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(
            () => Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: textFieldMethod(controller.secondsTEC,
                            fontSize: get15FontSize(),
                            hintText: "Enter seconds",
                            keyboardType: TextInputType.number)),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: getNormalBorderRadius()),
                      child: Center(
                        child: addText(controller.secondsToHMS.value,
                            get20FontSize(), Colors.black, FontWeight.w500),
                      ),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (controller.secondsTEC.text.isNotEmpty) {
                            controller.isStart.isFalse
                                ? controller.startTimer(
                                    int.parse(controller.secondsTEC.text))
                                : controller.isPaused.isTrue
                                    ? controller.resumeTimer()
                                    : controller.pauseTimer();
                          } else {
                            var snackBar =
                                const SnackBar(content: Text('Enter seconds'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: buttonMethod(controller.isStart.isFalse
                            ? "Start"
                            : controller.isPaused.isTrue
                                ? "resume"
                                : "pause"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    addText(
                        "Lap", get20FontSize(), Colors.black, FontWeight.w500),
                    addText(
                        "Time", get20FontSize(), Colors.black, FontWeight.w500),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.timeList.length,
                  itemBuilder: (context, index) {
                    var num = index + 1;
                    var data = controller.timeList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        addText(num.toString(), get20FontSize(), Colors.black,
                            FontWeight.w500),
                        addText(data, get20FontSize(), Colors.black,
                            FontWeight.w500),
                      ],
                    );
                  },
                )),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isStart.isTrue) {
                      controller.timeList.add(controller.secondsToHMS.value);
                    } else {
                      var snackBar = const SnackBar(
                          content: Text('Please start countdown.'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: buttonMethod("Add Timer"),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
