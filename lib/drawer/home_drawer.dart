import 'package:flutter/material.dart';
import 'package:newsapp/drawer/drawer_item_section.dart';
import 'package:newsapp/drawer/language_bottomsheet.dart';
import 'package:newsapp/drawer/theme_bottom_sheet.dart';
import 'package:newsapp/providers/apptheme_provider.dart';
import 'package:newsapp/providers/language_provider.dart';
import 'package:newsapp/utils/app_styles.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:newsapp/utils/imageassets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<AppthemeProvider>(context);
    return Column(
      children: [
        Container(
          color: AppColor.white,
          alignment: Alignment.center,
          width: double.infinity,
          height: screenSize.height * 0.25,
          child: Text(
            "News App",
            style: AppStyles.bold24Black,
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        DrawerItemSection(imagePath: ImageAssets.homeimage, text: "Go To Home"),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        Divider(
          thickness: 2,
          color: AppColor.white,
          indent: 10,
          endIndent: 10,
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        DrawerItemSection(imagePath: ImageAssets.themeimage, text: "Theme"),
        InkWell(
          onTap: () {
            ///change app theme
            showThemeBottomShhet(context);
          },
          child: Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColor.white, width: 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  themeProvider.apptheme == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark,
                  style: AppStyles.bold20White,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColor.white,
                  size: 35,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        Divider(
          thickness: 2,
          color: AppColor.white,
          indent: 10,
          endIndent: 10,
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        DrawerItemSection(
            imagePath: ImageAssets.languageimage, text: "Language"),
        InkWell(
          onTap: () {
            showLanguageBottomShhet(context);
          },
          child: Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColor.white, width: 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  languageProvider.appLanguage == "en"
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: AppStyles.bold20White,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColor.white,
                  size: 35,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showLanguageBottomShhet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomShhet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
