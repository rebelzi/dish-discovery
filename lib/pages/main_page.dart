import 'package:dish_discover/pages/chef_ai_page.dart';
import 'package:dish_discover/pages/home_page.dart';
import 'package:dish_discover/pages/profile_page.dart';
import 'package:dish_discover/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  List<PersistentTabConfig> _tabs(BuildContext context) => [
    PersistentTabConfig(
      screen: HomePage(),
      item: ItemConfig(
        icon: Icon(Icons.home),
        title: 'Home',
        iconSize: 32,
        activeColorSecondary: AppColors.secondary,
        activeForegroundColor: AppColors.primary,
        inactiveBackgroundColor: Colors.black,
        inactiveForegroundColor: Colors.black
      ),
    ),
    PersistentTabConfig(
      screen: ChefAiPage(),
      item: ItemConfig(
        icon: Icon(Icons.chat_rounded),
        title: 'Chef AI',
        iconSize: 32,
        activeColorSecondary: AppColors.secondary,
        activeForegroundColor: AppColors.primary,
        inactiveBackgroundColor: Colors.black,
        inactiveForegroundColor: Colors.black,
      ),
    ),
    PersistentTabConfig(
      screen: ProfilePage(),
      item: ItemConfig(
        icon: Icon(Icons.person_2),
        title: 'Profile',
        iconSize: 32,
        activeColorSecondary: AppColors.secondary,
        activeForegroundColor: AppColors.primary,
        inactiveBackgroundColor: Colors.black,
        inactiveForegroundColor: Colors.black,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) =>
      PersistentTabView(tabs: _tabs(context), navBarBuilder:
        (navBarConfig) => Style9BottomNavBar(
          height: 74,
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.9,
                offset: Offset(0, -1),
              ),
            ],
          ),
        ), 
      );
}
