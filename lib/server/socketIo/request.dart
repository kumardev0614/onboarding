import 'package:onboarding/server/socketIo/socket_client.dart';

import 'package:http/http.dart' as http;

Future makeGetRequest() async {
  final response =
      await http.get(Uri.parse('http://192.168.187.49:3000?id="jeet"'));

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}

// sendData() {
//   try {
//     socket.emit('addValue', 5);
//     socket.on("showValue", (data) => log("The sum is: $data"));
//   } catch (e) {
//     log("============= ERROR in connection: $e ====================");
//   }
// }

Future randomCall(int deviceId) async {
  try {
    // livekitCall();
    socket.emit('call', deviceId);
  } catch (e) {
    print("============= ERROR in randomCall: $e ====================");
  }
}
