import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/NewsResponse.dart';
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
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(
                    15,
                  ),
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(
                        news.urlToImage ?? '',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(news.title ?? ''),
              const SizedBox(
                height: 20,
              ),
              Text(
                news.description ?? '',
                maxLines: 2,
                style: TextStyle().copyWith(color: Colors.black54),
              ),
              Text(
                '${DateTime.parse(news.publishedAt ?? '').year}/${DateTime.parse(news.publishedAt ?? '').month}/${DateTime.parse(news.publishedAt ?? '').day}',
                style: const TextStyle().copyWith(color: Colors.grey),
                textAlign: TextAlign.end,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Text(
                  news.content ?? '',
                  maxLines: 5,
                  style: const TextStyle().copyWith(
                    fontSize: 22,
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
                  children: [
                    Text(
                      'View Full Article',
                      style: TextStyle().copyWith(
                        fontWeight: FontWeight.bold,
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
    );
  }
}
