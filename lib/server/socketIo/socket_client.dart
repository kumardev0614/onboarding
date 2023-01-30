import 'package:socket_io_client/socket_io_client.dart';

import '../../lib.dart';

late Socket socket;
connectToServer() {
  socket = io(
      // herokusocketurl,
      'http://142.93.222.141:3000/',
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .setExtraHeaders({'foo': 'bar'}) // optional
          .build());

  socket.connect();

  socketListeners();
}

randomCall() {
  socket.emit("userWantToConnect", socket.id);
}

disconnectBeforeCall() {
  socket.emit("disconnectBeforeCall", socket.id);
}
