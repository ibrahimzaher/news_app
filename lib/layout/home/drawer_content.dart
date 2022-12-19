import 'package:flutter/material.dart';
import 'package:news_app/shared/style/my_color.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({Key? key, required this.clickDrawerItem})
      : super(key: key);
  final Function clickDrawerItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: MyColor.primaryColor,
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsetsDirectional.only(
              top: 35,
            ),
            child: Text(
              'News App!',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            clickDrawerItem(1);
            Navigator.of(context).pop();
          },
          child: ListTile(
            leading: const Icon(
              Icons.list,
              color: MyColor.blackLightColor,
              size: 30,
            ),
            title: Text(
              'Categories',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            clickDrawerItem(2);
            Navigator.of(context).pop();
          },
          child: ListTile(
            leading: const Icon(
              Icons.settings,
              color: MyColor.blackLightColor,
              size: 30,
            ),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
