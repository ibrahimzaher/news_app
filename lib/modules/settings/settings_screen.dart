import 'package:flutter/material.dart';
import 'package:news_app/modules/settings/language_bottom_sheet.dart';
import 'package:news_app/modules/settings/my_provider.dart';
import 'package:news_app/shared/style/my_color.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff303030),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(
              top: 15,
              start: 10,
            ),
            padding: const EdgeInsetsDirectional.all(
              10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(
                10,
              ),
              border: Border.all(
                color: MyColor.primaryColor,
                width: 2,
              ),
            ),
            child: InkWell(
              onTap: () {
                showLanguageBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.language == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: const TextStyle(
                      color: MyColor.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                    color: MyColor.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }
}
