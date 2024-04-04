import 'package:flutter/material.dart';
import 'package:flutter_localization_arb_provider/src/module/page1.dart';
import 'package:flutter_localization_arb_provider/src/module/page2.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
        final AppLocalizations langs = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Localization'),
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
        body:  Center(
          child: Text(langs.demoData),
        ),
      );
  }
}