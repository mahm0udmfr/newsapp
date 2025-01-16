import 'package:flutter/material.dart';
import 'package:newsapp/category/category_details.dart';
import 'package:newsapp/general_screen.dart';
import 'package:newsapp/providers/apptheme_provider.dart';
import 'package:newsapp/providers/language_provider.dart';
import 'package:newsapp/utils/apptheme.dart';
import 'package:newsapp/home_screen.dart';
import 'package:newsapp/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyServices.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LanguageProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppthemeProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<AppthemeProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: Apptheme.darkTheme,
        theme: Apptheme.lightTheme,
        themeMode: themeProvider.apptheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(languageProvider.appLanguage),
        routes: {
          HomeScreen.routename: (context) => const HomeScreen(),
          GeneralScreen.routename: (context) => const GeneralScreen(),
          CategoryDetails.routename: (context) => const CategoryDetails(),
        },
        initialRoute: GeneralScreen.routename);
  }
}
