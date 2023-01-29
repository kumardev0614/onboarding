import 'package:socket_io_client/socket_io_client.dart';

import '../../lib.dart';

late Socket socket;
connectToServer() {
  socket = io(
      // herokusocketurl,
      'http://192.168.2.51:3000/',
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .setExtraHeaders({'foo': 'bar'}) // optional
          .build());

  socket.connect();

  socketListeners();
}

randomCall() {
  socket.emit("userWantToConnect", "Hi");
}
