import 'package:newsapp/providers/apptheme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var themeProvider = Provider.of<AppthemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: screenSize.height * 0.02,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                ////change Theme to light To English
                themeProvider.changeTheme(ThemeMode.light);
              },
              child: themeProvider.apptheme == ThemeMode.light
                  ? getSelectedItemWedgit(
                      context,
                      AppLocalizations.of(context)!.light,
                    )
                  : getUnSelectedItemWedgit(
                      context,
                      AppLocalizations.of(context)!.light,
                    )),
          Divider(
            thickness: 1.2,
            color:  Theme.of(context).primaryColor,
          ),
          InkWell(
              onTap: () {
                ////Change Theme To dark
                themeProvider.changeTheme(ThemeMode.dark);
              },
              child: themeProvider.apptheme == ThemeMode.dark
                  ? getSelectedItemWedgit(
                      context, AppLocalizations.of(context)!.dark)
                  : getUnSelectedItemWedgit(
                      context, AppLocalizations.of(context)!.dark)),
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
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
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
