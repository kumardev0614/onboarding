import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/controller.dart';
import '../../server/livekit/livekit.dart';
import 'index.dart';

class ConnectedpagePage extends GetView<ConnectedpageController> {
  const ConnectedpagePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(
            () {
              return Text(connectedPagectr.callStatus.value);
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text(
              'Disconnect',
            ),
            onPressed: () async {
              // disconnect();
              Get.back();
              connectedPagectr.callStatus.value = "Connecting...";
              await disconnect();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConnectedpageController>(
      init: ConnectedpageController(),
      id: "connectedpage",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("connectedpage")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
