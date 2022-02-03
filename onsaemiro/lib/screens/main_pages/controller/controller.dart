import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/product/product_list.dart';

class RootContorller extends GetxController {
  RxInt rootPageIndex = 0.obs;

  GlobalKey<NavigatorState> navigatorKey1 = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> navigatorKey2 = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> navigatorKey3 = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> navigatorKey4 = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> navigatorKey5 = GlobalKey<NavigatorState>();
  List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];
  void changeRootPageIndex(int index) {
    rootPageIndex(index);
  }

  Future<bool> onWillPop() async {
    return !await navigatorKeys[rootPageIndex.value].currentState!.maybePop();
  }
}
