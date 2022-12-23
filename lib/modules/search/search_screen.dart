import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/NewsResponse.dart';
import 'package:news_app/modules/categories/details/news/news_details.dart';
import 'package:news_app/modules/categories/details/news/news_item.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/shared/style/my_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = 'Search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var future;
  String? search;
  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.search),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                15,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.searching,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    borderSide: const BorderSide(
                      width: 2,
                      color: MyColor.primaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    borderSide: const BorderSide(
                      color: MyColor.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    search = text;
                    future = ApiManager.search(search ?? '');
                  });
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<NewsResponse>(
                future: future,
                builder: (context, snapshot) {
                  if (search == null || search == '') return const SizedBox();
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
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, NewsDetails.routeName,
                              arguments: response[index]);
                        },
                        child: NewsItem(news: response[index])),
                    itemCount: response.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
