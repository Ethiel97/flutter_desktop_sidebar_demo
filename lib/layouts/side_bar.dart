import 'package:desktop_side_bar_demo/models/menu_item.dart';
import 'package:desktop_side_bar_demo/providers/app_controller.dart';
import 'package:desktop_side_bar_demo/widgets/side_bar_menu_item.dart';
import 'package:desktop_side_bar_demo/widgets/workspace_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:get/get.dart';

import '../constants.dart';

List<MenuItem> topMenuItems = [
  MenuItem(
    null,
    'Search',
    AntDesign.search1,
  ),
  MenuItem(
    null,
    'Dashboard',
    AntDesign.home,
  ),
  MenuItem(
    null,
    'Chat',
    AntDesign.message1,
  ),
  MenuItem(
    null,
    'Teams',
    AntDesign.team,
  ),
  MenuItem(null, 'Tasks', AntDesign.tool),
  MenuItem(
    null,
    'Game',
    AntDesign.mobile1,
  ),
  MenuItem(
    null,
    'Notes',
    AntDesign.book,
  ),
  MenuItem(
    null,
    'Administration',
    AntDesign.setting,
  ),
];

List<MenuItem> bottomMenuItems = [
  MenuItem(
    null,
    'Notifications',
    Entypo.bell,
  ),
  MenuItem(
    'me.jpg',
    'Profile',
    null,
  )
];

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());

    final Size size = MediaQuery.of(context).size;
    bool isDesktop = size.width >= screenLg;

    return GetBuilder<AppController>(
        init: controller,
        builder: (logic) {
          isDesktop = controller.isDesktop;

          return AnimatedContainer(
            transformAlignment: Alignment.topLeft,
            duration: const Duration(milliseconds: 250),
            width: isDesktop ? sideBarDesktopWidth : sideBarMobileWidth,
            height: size.height,
            // height: size.height,
            decoration: BoxDecoration(
              color: secondaryBackgroundColor,
              border: Border(
                right: BorderSide(
                  width: .3,
                  color: darkColor.withOpacity(.2),
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 24,
              horizontal: isDesktop ? 24 : 12,
            ),
            child: Column(
              crossAxisAlignment: isDesktop
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //top item
                Container(
                  height: 120,
                  padding: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: .3,
                        color: darkColor.withOpacity(.2),
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment:
                            isDesktop ? Alignment.topRight : Alignment.center,
                        child: IconButton(
                          onPressed: () {
                            controller.toggleSideBar();
                          },
                          icon: const Icon(
                            AntDesign.leftsquareo,
                            color: textColor,
                            size: 18,
                          ),
                        ),
                      ),
                      WorkspaceItem(
                        isDesktop: isDesktop,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: topMenuItems.length,
                  itemBuilder: (context, index) =>
                      SideBarMenuItem(topMenuItems[index], isDesktop),
                ),

                const Spacer(),
                ...bottomMenuItems.map(
                  (e) => SideBarMenuItem(e, isDesktop, UniqueKey()),
                ),
              ],
            ),
          );
        });
  }
}
