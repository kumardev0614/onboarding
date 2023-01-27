import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ConnectedpagePage extends GetView<ConnectedpageController> {
  const ConnectedpagePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ConnectedpagePage"),
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
