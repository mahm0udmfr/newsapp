import 'package:newsapp/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: screenSize.height * 0.02,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                ////change Language To English
                languageProvider.changeLanguage("en");
              },
              child: languageProvider.appLanguage == 'en'
                  ? getSelectedItemWedgit(
                      context,
                      AppLocalizations.of(context)!.english,
                    )
                  : getUnSelectedItemWedgit(
                      context,
                      AppLocalizations.of(context)!.english,
                    )),
          Divider(
            thickness: 1.2,
            color: Theme.of(context).indicatorColor,
          ),
          InkWell(
              onTap: () {
                ////Change Language To Arabic
                languageProvider.changeLanguage("ar");
              },
              child: languageProvider.appLanguage == "ar"
                  ? getSelectedItemWedgit(
                      context, AppLocalizations.of(context)!.arabic)
                  : getUnSelectedItemWedgit(
                      context, AppLocalizations.of(context)!.arabic)),
        ],
      ),
    );
  }

  Widget getSelectedItemWedgit(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:Theme.of(context).textTheme.headlineLarge,
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).indicatorColor,
        )
      ],
    );
  }

  Widget getUnSelectedItemWedgit(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
