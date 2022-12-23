import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Category {
  String id;
  String title;
  String image;
  int background;
  Category({
    required this.id,
    required this.title,
    required this.image,
    required this.background,
  });
  //   technology
  //business entertainment general health science sports technology
  static List<Category> categories = [
    Category(
        id: 'general',
        title: 'General',
        image: 'assets/images/global.png',
        background: 0xff013E8E),
    Category(
        id: 'sports',
        title: 'Sports',
        image: 'assets/images/sports.png',
        background: 0xffC91C22),
    Category(
        id: 'technology',
        title: 'Technology',
        image: 'assets/images/technology.png',
        background: 0xff050F39),
    Category(
        id: 'health',
        title: 'Health',
        image: 'assets/images/health.png',
        background: 0xffED1E79),
    Category(
        id: 'entertainment',
        title: 'Entertainment',
        image: 'assets/images/entertainment.png',
        background: 0xff212121),
    Category(
        id: 'science',
        title: 'Science',
        image: 'assets/images/science.png',
        background: 0xffF2D352),
    Category(
        id: 'business',
        title: 'Business',
        image: 'assets/images/bussines.png',
        background: 0xffCF7E48),
  ];
}
