import 'package:get/get.dart';

import '../../lib.dart';

class AppPages {
  static const INITIAL = "/home";

  static final routes = [
    GetPage(
      name: "/home",
      page: () => const HomePage(),
      bindings: [HomeBinding()],
    ),
  ];
}
