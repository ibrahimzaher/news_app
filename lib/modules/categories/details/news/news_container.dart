import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/NewsResponse.dart';
import 'package:news_app/models/sources_response/SourcesResponse.dart';
import 'package:news_app/modules/categories/details/news/news_item.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/shared/style/my_color.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({Key? key, required this.source}) : super(key: key);
  final Source source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(source.id ?? '', 1),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: MyColor.primaryColor,
          ));
        }
        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: Text('We Have something Wrong')),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Try Again',
                ),
              ),
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text(snapshot.data?.message ?? '')),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Try Again',
                ),
              ),
            ],
          );
        }
        var response = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) =>
              InkWell(onTap: () {}, child: NewsItem(news: response[index])),
          itemCount: response.length,
        );
      },
    );
  }
}
