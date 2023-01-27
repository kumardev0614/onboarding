import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/controller/livekit_controller.dart';
import 'package:onboarding/server/socketIo/socket_client.dart';

class CallingPage extends StatelessWidget {
  const CallingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LiveKit Call"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Obx(() {
            //   return
            // }),
            GetX<LivekitController>(builder: (controller) {
              return Text(controller.callStatus.value);
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                'Disconnect',
              ),
              onPressed: () async {
                // disconnect();
                Get.back();
                LivekitController.instance.callStatus.value = "Connecting...";
                await roomDisconnect();
              },
            ),
          ],
        ),
      ),
    );
  }
}
