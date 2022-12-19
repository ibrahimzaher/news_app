import 'package:flutter/material.dart';
import 'package:news_app/models/category/category.dart';
import 'package:news_app/modules/categories/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
        start: 35,
        top: 34,
        end: 35,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category\nof interest',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: const Color(0xff4F5A69),
                ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsetsDirectional.only(
                top: 37,
                start: 14,
                end: 2,
                bottom: 91,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 18,
                childAspectRatio: 1 / 1.2,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: CategoryItem(
                      category: Category.categories[index], index: index),
                );
              },
              itemCount: Category.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
