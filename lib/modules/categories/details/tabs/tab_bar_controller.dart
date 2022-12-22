import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response/SourcesResponse.dart';
import 'package:news_app/modules/categories/details/news/news_container.dart';
import 'package:news_app/modules/categories/details/tabs/tab_item.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({Key? key, required this.sources}) : super(key: key);
  final List<Source> sources;

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int selectedIndex = 0;

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
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: widget.sources
                .map(
                  (e) => TabItem(
                      source: e,
                      isSelected: selectedIndex == widget.sources.indexOf(e)),
                )
                .toList(),
          ),
          Expanded(child: NewsContainer(source: widget.sources[selectedIndex])),
        ],
      ),
    );
  }
}
