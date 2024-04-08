import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization_arb_provider/home_page.dart';
import 'package:flutter_localization_arb_provider/src/core/provider/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLanguageCode = prefs.getString('languageCode'); 
  runApp(MyApp(savedLanguageCode: savedLanguageCode ?? 'en'));
}

class MyApp extends StatelessWidget {
  final String savedLanguageCode;

  const MyApp({super.key, required this.savedLanguageCode});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (BuildContext context, localeProvider, Widget? child) { 
           return MaterialApp(
             title: 'Material App',
              locale: Locale(savedLanguageCode), 
             localizationsDelegates: AppLocalizations.localizationsDelegates,
             supportedLocales: AppLocalizations.supportedLocales,
             debugShowCheckedModeBanner: false,
             home: const HomePage(),
           );
         },
       
      ),
    );
  }
}
