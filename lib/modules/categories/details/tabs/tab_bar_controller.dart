import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/NewsResponse.dart';
import 'package:news_app/models/sources_response/SourcesResponse.dart';
import 'package:news_app/modules/categories/details/news/news_details.dart';

import 'package:news_app/modules/categories/details/news/news_item.dart';
import 'package:news_app/modules/categories/details/tabs/tab_item.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({Key? key, required this.sources}) : super(key: key);
  final List<Source> sources;

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int selectedIndex = 0;
  List<News> news = [];
  var page = 1;
  bool hasMore = true;
  bool isLoading = false;
  var controller = ScrollController();
  @override
  void initState() {
    super.initState();
    fetch();
    controller.addListener(() {
      // print(controller.offset);
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;
    print('max');
    var response =
        await ApiManager.getNews(widget.sources[selectedIndex].id ?? '', page);
    if (response.status == 'ok') {
      page++;
      isLoading = false;
      if (response.articles!.length < 10) {
        hasMore = false;
      }
      news.addAll(response.articles ?? []);
      setState(() {});
    } else {
      hasMore = false;
      setState(() {});
    }
  }

  Future<void> refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      page = 1;
      news.clear();
      fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
            isScrollable: true,
            onTap: (index) {
              selectedIndex = index;
              refresh();
              setState(() {});
            },
            tabs: widget.sources
                .map(
                  (e) => TabItem(
                      source: e,
                      isSelected: selectedIndex == widget.sources.indexOf(e)),
                )
                .toList(),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                controller: controller,
                itemCount: news.length + 1,
                itemBuilder: (context, index) {
                  if (index < news.length) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, NewsDetails.routeName,
                              arguments: news[index]);
                        },
                        child: NewsItem(news: news[index]));
                  } else {
                    return Padding(
                      padding:const EdgeInsets.all(
                        20,
                      ),
                      child: Center(
                        child: hasMore
                            ? const CircularProgressIndicator(
                                color: Colors.green,
                              )
                            : const Text('No has More Data'),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
