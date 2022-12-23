import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/layout/home/home_layout.dart';
import 'package:news_app/modules/categories/details/news/news_details.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/modules/settings/my_provider.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';
import 'package:news_app/shared/style/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MyProvider(),
    child: const MyApp(),
  ));
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
        SearchScreen.routeName: (_) => SearchScreen(),
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      locale: Locale(context.watch<MyProvider>().language),
    );
  }
}
