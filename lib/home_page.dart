import 'package:flutter/material.dart';
import 'package:flutter_localization_arb_provider/src/core/provider/locale_provider.dart';
import 'package:flutter_localization_arb_provider/src/module/page1.dart';
import 'package:flutter_localization_arb_provider/src/module/page2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations langs = AppLocalizations.of(context)!;
    LocaleProvider localeProvider =
        Provider.of<LocaleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Localization'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) async {
              localeProvider.setLocale(Locale(result));
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('languageCode', result);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'en',
                child: Text('English'),
              ),
              const PopupMenuItem<String>(
                value: 'ar',
                child: Text('Arabic'),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Page 1'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Page1(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Page 2'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Page2(),
                  ),
                );
                // Add your custom logic here
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(langs.demoData1),
      ),
    );
  }
}
