import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/controller/livekit_controller.dart';
// import 'package:onboarding/views/callingpage.dart';
import 'package:onboarding/views/homepage.dart';

void main() {
  Get.put(LivekitController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
