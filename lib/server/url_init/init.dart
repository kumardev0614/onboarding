// import 'dart:io';


// import 'package:http/http.dart' as http;


// Future init() async {
//   var url = "https://biswajit1729.github.io/init.json";
//   try {
//     http.Response response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       indexController.state.init = initFromJson(response.body);

//       try {
//         PackageInfo packageInfo = await PackageInfo.fromPlatform();

//         if (int.parse(packageInfo.buildNumber) <
//             indexController.state.init.buildNumber) {
//           await Fluttertoast.showToast(
//               msg: "New Update...",
//               toastLength: Toast.LENGTH_SHORT,
//               gravity: ToastGravity.TOP,
//               timeInSecForIosWeb: 1,
//               backgroundColor: Colors.black,
//               textColor: Colors.white,
//               fontSize: 16.0);
//           await checkForUpdate();
//         }
//       } catch (e) {}
//     }
//   } on SocketException catch (_) {
//     Get.to(() => NoInternet());
//   }
// }
