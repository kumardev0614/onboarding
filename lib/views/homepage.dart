import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
=======
// import 'package:get/get.dart';
>>>>>>> 781ec7980d763389fc8d786dd9539777b2d20ccb
import 'package:onboarding/server/socketIo/socket_client.dart';
import 'package:onboarding/views/callingpage.dart';

import '../lib.dart';
import 'ConnectedPage/view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    var deviceId = (screenSize.width * screenSize.height).toInt();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Opentalk"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Connect',
              ),
              onPressed: () {
                connectToServer();
                Get.to(() => ConnectedpagePage());
              }, // make a random call
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text(
                'Send Data',
              ),
              onPressed: () async {
                await makeGetRequest();
              }, // emit msg
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text(
                'Call',
              ),
<<<<<<< HEAD
              onPressed: () async {
                await randomCall(deviceId);
=======
              onPressed: () {
                fixedCall(deviceId);
                Get.to(const CallingPage());
              }, // emit msg
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text(
                'Random Call',
              ),
              onPressed: () {
                randomCall();
                // Get.to(const CallingPage());
>>>>>>> 781ec7980d763389fc8d786dd9539777b2d20ccb
              }, // emit msg
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text(
                'Disconnect',
              ),
              onPressed: () async {
                await disconnect();
              }, // emit msg
            ),
          ],
        ),
      ),
    );
  }
}
