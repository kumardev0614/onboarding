import 'dart:developer';

import 'package:get/get.dart';
import 'package:livekit_client/livekit_client.dart';

import '../../lib.dart';

Room room = Room();

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

  // Get.to(() => CallingPage());
  Get.to(() => ConnectedpagePage());
  // await rtc.Helper.setSpeakerphoneOn(true);
}

Future disconnect() async {
  await room.disconnect();
  await room.dispose();
  room = Room();
  homeController.state.iamNotBusy = true;
  log("--------- room disconnected!!! ---------- ");
  // socket.disconnect();
}
