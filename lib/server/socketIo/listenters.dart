import 'dart:developer';

import '../../lib.dart';

socketListeners() {
  try {
    socket.on("callRequest", (id) {
      log("------- callRequest triggered------------");
      if (homeController.state.iamNotBusy) {
        socket.emit("accepted", id);
        log("------- call accepted ------------");
        homeController.state.iamNotBusy = false;
      } else {
        socket.emit("rejected", id);
        log("------- call rejected ------------");
      }
    });

    socket.on("receiveRandomToken", (token) async {
      log("------------- receiveRandomToken -------------");
      log("------------- Token -------------");
      log(token);
      await livekitCall(token);
    });

    socket.on("rejectedCallAgain", (id) {
      socket.emit("userWantToConnect", "Hi");
    });

    // socket.emit('chat message', 'Hello from flutter app');
    // socket.on("chat message", (data) => print("Chat msg: $data"));
  } catch (e) {
    print("============= ERROR in connection: $e ====================");
  }
}
