<<<<<<< HEAD
=======
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livekit_client/livekit_client.dart';
>>>>>>> 781ec7980d763389fc8d786dd9539777b2d20ccb
import 'package:socket_io_client/socket_io_client.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../controller/livekit_controller.dart';
import '../../views/callingpage.dart';

late Socket socket;
connectToServer() {
<<<<<<< HEAD
  socket = io(
      // herokusocketurl,
      'http://192.168.200.51:3000',
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .setExtraHeaders({'foo': 'bar'}) // optional
          .build());

  socket.connect();
}

=======
  try {
    socket = io(
        // herokusocketurl,
        'http://192.168.1.7:3000',
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

    socket.on("chat message", (data) {
      log("Chat msg: $data");
    });

    socket.on("receiveFixedToken", (token) async {
      await livekitCall(token);
    });

    socket.on("receiveRandomToken", (token) async {
      log("receiveRandomToken listener is called");
      await Fluttertoast.showToast(
        msg: "token: $token",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
      );
      await livekitCall(token);
    });

    // ---------------------------------------

    socket.emit('chat message', 'Hello from flutter app');
  } catch (e) {
    log("ERROR in connection: $e");
  }
}

fixedCall(int deviceId) {
  try {
    // livekitCall();
    socket.emit('call', deviceId);
  } catch (e) {
    log("ERROR in fixedCall: $e");
  }
}

randomCall() {
  try {
    // livekitCall();
    socket.emit('randomCall');
  } catch (e) {
    log("ERROR in randomCall: $e");
  }
}
>>>>>>> 781ec7980d763389fc8d786dd9539777b2d20ccb



// livekit call
<<<<<<< HEAD


=======
livekitCall(token) async {
  // log("token is passed:$token");
  await room.dispose();
  room = Room();

  Get.to(const CallingPage());
  const roomOptions = RoomOptions(
    adaptiveStream: true,
    dynacast: true,
  );
  // await room.connect('wss://demo.livekit.cloud',
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb29tSm9ufPVcUZpm5aY6WvOH6E",
  //     roomOptions: roomOptions);

  await listener();
  try {
    await room.connect('wss://ot-dev.livekit.cloud', token,
        roomOptions: roomOptions);
  } catch (e) {
    log("--------------------------------------------LiveKit Error: $e");
    // roomDisconnect();
  }

  await room.localParticipant?.setMicrophoneEnabled(true);
}

Future<void> listener() async {
  var roomListener = room.createListener();

  roomListener
    ..on<TrackSubscribedEvent>((_) async {
      LivekitController.instance.callStatus.value = "Connected";
      await Fluttertoast.showToast(
        msg: "Call Connected",
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
      Get.back();
      await roomDisconnect();
      LivekitController.instance.callStatus.value = "Connecting...";
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
      );
    });
  } catch (e) {
    log("ERROR in send data: $e");
  }
}

Future roomDisconnect() async {
  await room.disconnect();
  await room.dispose();
  room = Room();
  // await room.dispose();
  log("Room disconnected and disposed!!!");
}

disconnect() {
  socket.disconnect();
  log("Socket disconnected!!!");
}



// ----------------------------------------------------------------


>>>>>>> 781ec7980d763389fc8d786dd9539777b2d20ccb
