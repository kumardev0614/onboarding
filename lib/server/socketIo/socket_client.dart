import 'dart:developer';
import 'package:livekit_client/livekit_client.dart';
import 'package:socket_io_client/socket_io_client.dart';

late Socket socket;
connectToServer() {
  try {
    socket = io(
        // herokusocketurl,
        'http://192.168.200.51:3000',
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());

    socket.connect();

    socket.on('connect', (_) {
      log(socket.id!); //outputs the socket id
    });
    socket.on("receiveToken", (token) async {
      await livekitCall(token);
    });

    socket.emit('chat message', 'Hello from flutter app');
    socket.on("chat message", (data) => log("Chat msg: $data"));
  } catch (e) {
    log("============= ERROR in connection: $e ====================");
  }
}

randomCall(int deviceId) {
  try {
    // livekitCall();
    socket.emit('call', deviceId);
  } catch (e) {
    log("============= ERROR in randomCall: $e ====================");
  }
}

Room room = Room();

// livekit call
livekitCall(token) async {
  // log("token is passed:$token");

  const roomOptions = RoomOptions(
    adaptiveStream: true,
    dynacast: true,
  );
  // await room.connect('wss://demo.livekit.cloud',
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2aWRlbyI6eyJyb29tSm9pbiI6dHJ1ZSwicm9vbSI6IndhcnpvbmUiLCJjYW5QdWJsaXNoIjp0cnVlLCJjYW5TdWJzY3JpYmUiOnRydWV9LCJpYXQiOjE2NzQ0MDI5NDEsIm5iZiI6MTY3NDQwMjk0MSwiZXhwIjoxNjc0NDEwMTQxLCJpc3MiOiJBUElreldoYnhCYUdTaXEiLCJzdWIiOiJiaXN3YWppdCIsImp0aSI6ImJpc3dhaml0In0.ryCOz3M8RUO49rG9kDgdxWroufPVcUZpm5aY6WvOH6E",
  //     roomOptions: roomOptions);

  await room.connect('wss://ot-dev.livekit.cloud', token,
      roomOptions: roomOptions);

  await room.localParticipant?.setMicrophoneEnabled(true);
  // await rtc.Helper.setSpeakerphoneOn(true);
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
  // await room.dispose();
  log("room disconnected!!!");
  // socket.disconnect();
}
