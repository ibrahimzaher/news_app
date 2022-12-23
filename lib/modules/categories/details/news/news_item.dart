import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/NewsResponse.dart';
import 'package:news_app/shared/style/my_color.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key, required this.news}) : super(key: key);
  final News news;
  @override
  Widget build(BuildContext context) {
    var difference =
        DateTime.now().difference(DateTime.parse(news.publishedAt ?? ""));
    return Container(
      margin: const EdgeInsetsDirectional.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(
                15,
              ),
            ),
            child: CachedNetworkImage(
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: MyColor.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: news.urlToImage ?? '',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            news.title ?? '',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff79828B),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            news.description ?? "",
            style: const TextStyle(
                fontSize: 14,
                color: Color(0xff42505C),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            difference.inHours == 0
                ? '${difference.inMinutes} minutes ago'
                : '${difference.inHours} hours ago',
            style: const TextStyle().copyWith(
              fontSize: 13,
              color: const Color(0xffA3A3A3),
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
