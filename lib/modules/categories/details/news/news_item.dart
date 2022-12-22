import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key, required this.news}) : super(key: key);
  final News news;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            margin: const EdgeInsetsDirectional.all(
              10,
            ),
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
          ListTile(
            title: Text(
              news.title ?? '',
            ),
            subtitle: Text(
              news.description ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff42505C),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(
              end: 10,
            ),
            child: Text(
              '${DateTime.parse(news.publishedAt ?? '').year}/${DateTime.parse(news.publishedAt ?? '').month}/${DateTime.parse(news.publishedAt ?? '').day}',
              style: const TextStyle().copyWith(color: Colors.grey),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
