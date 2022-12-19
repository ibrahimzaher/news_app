import 'package:flutter/material.dart';
import 'package:news_app/layout/home/drawer_content.dart';
import 'package:news_app/modules/categories/categories_screen.dart';
import 'package:news_app/modules/settings/settings_screen.dart';
import 'package:news_app/shared/style/my_color.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const String routeName = 'Home';
  static int? currentIndex = 1;

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColor.whiteColor,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/pattern.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News App',
          ),
        ),
        drawer: Drawer(
          child: DrawerContent(
            clickDrawerItem: oClickItem,
          ),
        ),
        body: HomeLayout.currentIndex == 2
            ? SettingsScreen()
            : CategoriesScreen(),
      ),
    );
  }

  oClickItem(int index) {
    if (HomeLayout.currentIndex == index) return;
    setState(() {
      HomeLayout.currentIndex = index;
    });
  }
}
