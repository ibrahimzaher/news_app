import 'package:flutter/material.dart';
import 'package:news_app/layout/home/drawer_content.dart';
import 'package:news_app/models/category/category.dart';
import 'package:news_app/modules/categories/categories_screen.dart';
import 'package:news_app/modules/categories/details/category_details.dart';
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
  Category? selectedCategory;
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
          title: Text(
            selectedCategory == null
                ? 'News App'
                : selectedCategory?.title ?? "",
          ),
          actions: selectedCategory == null
              ? null
              : [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.primaryColor,
                          elevation: 0,
                          shape: const CircleBorder(),
                        ),
                        onPressed: () {},
                        child: const Icon(
                          Icons.search,
                          size: 30,
                        )),
                  )
                ],
        ),
        drawer: Drawer(
          child: DrawerContent(
            clickDrawerItem: oClickItem,
          ),
        ),
        body: HomeLayout.currentIndex == 2
            ? SettingsScreen()
            : selectedCategory == null
                ? CategoriesScreen(
                    onCategoryTab: oClickCategory,
                  )
                : CategoryDetails(category: selectedCategory!),
      ),
    );
  }

  oClickItem(int index) {
    setState(() {
      selectedCategory = null;
      HomeLayout.currentIndex = index;
    });
  }

  oClickCategory(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
