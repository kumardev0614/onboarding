import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../server/socketIo/request.dart';
import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          ElevatedButton(
            child: const Text(
              'Call',
            ),
            onPressed: () async {
              await makeGetRequest();
            }, // emit msg
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("home")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
