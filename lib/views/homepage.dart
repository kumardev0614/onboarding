import 'package:flutter/material.dart';
import 'package:onboarding/server/socketIo/socket_server.dart';

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
              }, // make a random call
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text(
                'Send Data',
              ),
              onPressed: () {
                sendData();
              }, // emit msg
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text(
                'Call',
              ),
              onPressed: () {
                randomCall(deviceId);
              }, // emit msg
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text(
                'Disconnect',
              ),
              onPressed: () {
                disconnect();
              }, // emit msg
            ),
          ],
        ),
      ),
    );
  }
}
