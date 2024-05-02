import 'package:desktop_side_bar_demo/models/menu_item.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  bool isDesktop = true;
  MenuItem? menuItem;

  void toggleSideBar() {
    print('TOGGLING SIDE');

    isDesktop = !isDesktop;
    update();
  }

  void setCurrentItem(MenuItem item) {
    menuItem = item;
  }

  MenuItem? get item => menuItem;
}
