import 'dart:developer';
import 'package:livekit_client/livekit_client.dart';
import 'package:socket_io_client/socket_io_client.dart';

late Socket socket;

connectToServer() {
  try {
    socket = io(
        // herokusocketurl,
        'http://192.168.43.23:3000',
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
  await room.connect('wss://ot-dev.livekit.cloud', token.toString(),
      roomOptions: roomOptions);

  await room.localParticipant?.setMicrophoneEnabled(true);
}

sendData() {
  try {
    socket.emit('addValue', 5);
    socket.on("showValue", (data) => log("The sum is: $data"));
  } catch (e) {
    log("============= ERROR in connection: $e ====================");
  }
}

disconnect() {
  room.disconnect();
  socket.disconnect();
}
