import 'package:flutter/material.dart';
import 'package:news_app/models/category/category.dart';
import 'package:news_app/models/sources_response/SourcesResponse.dart';
import 'package:news_app/modules/categories/details/tabs/tab_bar_controller.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/shared/style/my_color.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({Key? key, required this.category}) : super(key: key);
  final Category category;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(category.id),
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
                child:const Text(
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
                child:const Text(
                  'Try Again',
                ),
              ),
            ],
          );
        }
        var response = snapshot.data?.sources ?? [];
        return TabBarController(sources: response);
      },
    );
  }
}
