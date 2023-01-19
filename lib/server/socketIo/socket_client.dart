import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart';

late Socket socket;

connectToServer() {
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

    socket.on('connect', (_) {
      log(socket.id!); //outputs the socket id
    });

    socket.emit('chat message', 'Hello from flutter app');

    // listener, event = chat message
    socket.on("chat message", (data) => log("recived: $data"));
  } catch (e) {
    log("============= ERROR in connection: $e ====================");
  }
}

randomCall(int deviceId) {
  try {
    socket.emit('callDetails', deviceId);
    socket.on("showUserName", (clintID) => log("The UserID is: $clintID"));
  } catch (e) {
    log("============= ERROR in randomCall: $e ====================");
  }
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
  socket.disconnect();
}
