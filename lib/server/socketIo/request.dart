import 'package:http/http.dart' as http;

import '../livekit/livekit.dart';

Future makeGetRequest() async {
  final response =
      // await http.get(Uri.parse('http://192.168.187.49:3000?id="jeet"'));
      await http
          .get(Uri.parse('http://142.93.222.141:3000/?id=%22devendra%22'));

  if (response.statusCode == 200) {
    await livekitCall(response.body);
    print(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }

  return response.body;
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
    // socket.emit('call', deviceId);
    var token = await makeGetRequest();
    await livekitCall(token);
  } catch (e) {
    print("============= ERROR in randomCall: $e ====================");
  }
}
