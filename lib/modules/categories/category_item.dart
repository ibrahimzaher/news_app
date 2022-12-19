import 'package:flutter/material.dart';
import 'package:news_app/models/category/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category, required this.index})
      : super(key: key);
  final Category category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(category.background),
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(index % 2 == 0 ? 0 : 20),
          bottomStart: Radius.circular(index % 2 == 0 ? 20 : 0),
          topEnd: const Radius.circular(20),
          topStart: const Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            category.image,
            height: 80,
            width: 80,
          ),
          Text(
            category.title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
