import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/data/appdata.dart';
import 'package:onsaemiro/screens/main_pages/access_Admin.dart';
import 'package:onsaemiro/screens/main_pages/access_main.dart';
import 'package:onsaemiro/screens/main_pages/controller/controller.dart';
import 'package:onsaemiro/screens/main_pages/culture_main.dart';
import 'package:onsaemiro/screens/main_pages/myinfo_pages/my_info.dart';
import 'package:onsaemiro/screens/main_pages/myinfo_pages/myinfo_Admin.dart';
import 'package:onsaemiro/screens/main_pages/things_main.dart';
import 'package:onsaemiro/screens/things_pages/things_mainAdmin.dart';

class Root extends GetView<RootContorller> {
  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppData appdata = Get.find();
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.rootPageIndex.value,
            children: [
              Navigator(
                  key: controller.navigatorKeys[0],
                  onGenerateRoute: (routeSettings) {
                    return appdata.userType == 'user'
                        ? MaterialPageRoute(
                            builder: (context) => accessMainPage(),
                          )
                        : MaterialPageRoute(
                            builder: (context) => accessAdminPage(),
                          );
                  }),
              Navigator(
                  key: controller.navigatorKeys[1],
                  onGenerateRoute: (routeSettings) {
                    return MaterialPageRoute(
                        builder: (context) => cultureMainPage());
                  }),
              Navigator(
                  key: controller.navigatorKeys[2],
                  onGenerateRoute: (routeSettings) {
                    return appdata.userType == 'user'
                        ? MaterialPageRoute(
                            builder: (context) => accessMainPage(),
                          )
                        : MaterialPageRoute(
                            builder: (context) => accessAdminPage(),
                          );
                  }),
              Navigator(
                  key: controller.navigatorKeys[3],
                  onGenerateRoute: (routeSettings) {
                    return appdata.userType == 'user'
                        ? MaterialPageRoute(
                            builder: (context) => thingsMainPage(),
                          )
                        : MaterialPageRoute(
                            builder: (context) => thingsMainAdminPage(),
                          );
                  }),
              Navigator(
                  key: controller.navigatorKeys[4],
                  onGenerateRoute: (routeSettings) {
                    return appdata.userType == 'user'
                        ? MaterialPageRoute(
                            builder: (context) => MyInfoPage(),
                          )
                        : MaterialPageRoute(
                            builder: (context) => MyInfoAdmin(),
                          );
                  }),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: controller.changeRootPageIndex,
            items: const [
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.feed_outlined, color: Colors.green, size: 30),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.people_outline, color: Colors.green, size: 30),
                activeIcon: Icon(Icons.people, color: Colors.green),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.home_outlined, color: Colors.green, size: 30),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.shopping_bag_outlined,
                    color: Colors.green, size: 30),
              ),
              BottomNavigationBarItem(
                  label: "",
                  icon:
                      Icon(Icons.person_outline, color: Colors.green, size: 30),
                  activeIcon: Icon(Icons.person, color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
