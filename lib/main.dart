import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_dev_digital/ui/timer_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Count-Down Timer',
      theme: ThemeData.light(useMaterial3: true),
      home: TimerView(),
    );
  }
}
