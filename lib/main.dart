import 'package:flutter/material.dart';
import 'package:news_app/layout/home/home_layout.dart';
import 'package:news_app/modules/categories/details/news/news_details.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';
import 'package:news_app/shared/style/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.light,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (_) => HomeLayout(),
        NewsDetails.routeName: (_) => NewsDetails(),
        WebViewScreen.routeName: (_) => WebViewScreen(),
      },
    );
  }
}
