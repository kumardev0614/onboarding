import '../../lib.dart';

Future socketListeners() async {
  try {
    socket.on('connect', (_) {
      print(socket.id!); //outputs the socket id
    });
    socket.on("receiveToken", (token) async {
      await livekitCall(token);
    });

    socket.emit('chat message', 'Hello from flutter app');
    socket.on("chat message", (data) => print("Chat msg: $data"));
  } catch (e) {
    print("============= ERROR in connection: $e ====================");
  }
}
