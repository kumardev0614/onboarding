import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
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
            const Text('Enjoy the Conversation...'),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                'Disconnect',
              ),
              onPressed: () {
                // disconnect();
                Get.back();
                roomDisconnect();
              },
            ),
          ],
        ),
      ),
    );
  }
}
