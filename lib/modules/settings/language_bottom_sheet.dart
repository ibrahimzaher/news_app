import 'package:flutter/material.dart';
import 'package:news_app/modules/settings/my_provider.dart';
import 'package:news_app/shared/style/my_color.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: const EdgeInsetsDirectional.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.toggleLanguage('en');
            },
            child: provider.language == 'en'
                ? selectedLanguage(AppLocalizations.of(context)!.english)
                : unSelectedLanguage(AppLocalizations.of(context)!.english),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.toggleLanguage('ar');
            },
            child: provider.language == 'ar'
                ? selectedLanguage(AppLocalizations.of(context)!.arabic)
                : unSelectedLanguage(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget selectedLanguage(String selected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          selected,
          style: const TextStyle(
            color: MyColor.primaryColor,
            fontSize: 18,
          ),
        ),
        const Icon(
          Icons.check,
          size: 30,
          color: MyColor.primaryColor,
        ),
      ],
    );
  }

  Widget unSelectedLanguage(String unSelected) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        unSelected,
        style: const TextStyle(
          color: MyColor.blackLightColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
