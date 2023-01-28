import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/server/socketIo/socket_client.dart';
import 'package:onboarding/views/ConnectedPage/bindings.dart';
import 'package:onboarding/views/home/view.dart';

void main() {
  runApp(const MyApp());
  // connectToServer();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ConnectedBinding(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
