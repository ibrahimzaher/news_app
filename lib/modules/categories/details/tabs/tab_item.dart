import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response/SourcesResponse.dart';
import 'package:news_app/shared/style/my_color.dart';

class TabItem extends StatelessWidget {
  const TabItem({Key? key, required this.source, required this.isSelected})
      : super(key: key);
  final Source source;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 19,
      ),
      decoration: BoxDecoration(
        color: isSelected ? MyColor.primaryColor : Colors.transparent,
        borderRadius: BorderRadiusDirectional.circular(
          15,
        ),
        border: Border.all(
          color: MyColor.primaryColor,
          width: 2,
        ),
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(
          color: isSelected ? MyColor.whiteColor : MyColor.primaryColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
