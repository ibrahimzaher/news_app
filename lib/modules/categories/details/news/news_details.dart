import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/NewsResponse.dart';
import 'package:news_app/modules/categories/details/news/news_item.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';
import 'package:news_app/shared/style/my_color.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key}) : super(key: key);
  static const String routeName = 'News-Details';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as News;
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
        appBar: AppBar(title: Text(news.source?.name ?? "")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NewsItem(news: news),
            Expanded(
              child: Card(
                margin: const EdgeInsetsDirectional.all(
                  15,
                ),
                borderOnForeground: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsetsDirectional.all(
                            20,
                          ),
                          child: Text(
                            news.content ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff42505C),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, WebViewScreen.routeName,
                            arguments: news);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'View Full Article',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff42505C),
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
