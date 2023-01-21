import 'dart:developer';
import 'package:livekit_client/livekit_client.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as rtc;

late Socket socket;
connectToServer() {  
  try {
    socket = io(
        // herokusocketurl,
        'http://192.168.181.51:3000',
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());

    socket.connect();

    socket.on('connect', (_) {
      log(socket.id!); //outputs the socket id
    });

    socket.emit('chat message', 'Hello from flutter app');
    socket.on("chat message", (data) => log("recived: $data"));
  } catch (e) {
    log("============= ERROR in connection: $e ====================");
  }
}

randomCall(int deviceId) {
  try {
    socket.emit('call', deviceId);
    socket.on("receiveToken", (token) {
      log("The Token is: $token");
      livekitCall(token);
      // Get.snackbar("Random Call", "Calling...");
    });
  } catch (e) {
    log("============= ERROR in randomCall: $e ====================");
  }
}

Room room = Room();
// livekit call
livekitCall(token) async {
  log("token is passed:$token");

  final roomOptions = RoomOptions(
    adaptiveStream: true,
    dynacast: true,
    // ... your room options
  );
  await room.connect('wss://ot-dev.livekit.cloud',
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlbyI6eyJyb29tSm9pbiI6dHJ1ZSwicm9vbSI6Im15Um9vbSJ9LCJpYXQiOjE2NzQyODI3MDAsIm5iZiI6MTY3NDI4MjcwMCwiZXhwIjoxNjc0MzA0MzAwLCJpc3MiOiJBUElpdmlzanZuQlNwZWEiLCJzdWIiOiIyMzA0MDAiLCJqdGkiOiIyMzA0MDAifQ.LMKjQ6DBVCTn2X4ymbbLC0MKnuGoW9xdhlbGjC2q89Y",
      roomOptions: roomOptions);

  await room.localParticipant?.setMicrophoneEnabled(true);
  await rtc.Helper.setSpeakerphoneOn(true);
}

sendData() {
  try {
    socket.emit('addValue', 5);
    socket.on("showValue", (data) => log("The sum is: $data"));
  } catch (e) {
    log("============= ERROR in connection: $e ====================");
  }
}

disconnect() async {
  await room.disconnect();
  await room.dispose();
  log("room disposed!!!");
  // socket.disconnect();
}
