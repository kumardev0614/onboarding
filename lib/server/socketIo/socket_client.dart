import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../controller/livekit_controller.dart';

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

    // All listeners -------------------------
    socket.on('connect', (_) {
      log(socket.id!); //outputs the socket id
    });
    socket.on("receiveToken", (token) async {
      await livekitCall(token);
    });
    socket.on("chat message", (data) => log("Chat msg: $data"));

    socket.emit('chat message', 'Hello from flutter app');
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

  await listener();
  await room.connect('wss://ot-dev.livekit.cloud', token,
      roomOptions: roomOptions);

  await room.localParticipant?.setMicrophoneEnabled(true);
  // await rtc.Helper.setSpeakerphoneOn(true);
}

Future<void> listener() async {
  var roomListener = room.createListener();

  roomListener
    ..on<TrackSubscribedEvent>((_) async {
      LivekitController.instance.callStatus.value = "Connected";
      await Fluttertoast.showToast(
        msg: "Yippee!!! Call Connected",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    })
    ..on<ParticipantDisconnectedEvent>((_) async {
      await Fluttertoast.showToast(
        msg: "Participant Disconnected",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
}

sendData() {
  try {
    log("Send Data");
    socket.emit('addValue', 5);
    socket.on("showValue", (data) async {
      log("The sum is: $data");
      await Fluttertoast.showToast(
        msg: "Data recived: $data",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  } catch (e) {
    log("============= ERROR in connection: $e ====================");
  }
}

roomDisconnect() async {
  await room.disconnect();
  room.dispose();
  room = Room();
  // await room.dispose();
  log("Room disconnected and disposed!!!");
}

disconnect() {
  socket.disconnect();
  log("Socket disconnected!!!");
}
