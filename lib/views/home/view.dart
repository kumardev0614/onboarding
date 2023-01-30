import 'dart:developer';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/lib.dart';

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
            onPressed: () {
              randomCall();
              Get.to(const ConnectedpagePage());
            }, // emit userWantToConnect event on server
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: controller.selectedIndex.value,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) => () {
              log("hello");
              controller.tabIndex = index;
              controller
                ..animateToPage(index,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              controller.update();
            },
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.apps),
                title: Text('Home'),
                activeColor: Colors.red,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.people),
                  title: Text('Users'),
                  activeColor: Colors.purpleAccent),
              BottomNavyBarItem(
                  icon: Icon(Icons.message),
                  title: Text('Messages'),
                  activeColor: Colors.pink),
              BottomNavyBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                  activeColor: Colors.blue),
            ],
          ),
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Home",
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  onPressed: () {
                    // perform search action
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your on press code here
            },
            child: const Icon(Icons.add),
          ),
          body: SafeArea(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.selectedIndex.value = index;
              },
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                ),
                _buildView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
