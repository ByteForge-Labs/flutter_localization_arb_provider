import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization_arb_provider/home_page.dart';
import 'package:flutter_localization_arb_provider/src/core/provider/locale_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (BuildContext context, localeProvider, Widget? child) { 
           return MaterialApp(
             title: 'Material App',
             locale: localeProvider.locale,
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
