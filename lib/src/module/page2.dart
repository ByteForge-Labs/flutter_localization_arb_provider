import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations langs = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body:  Center(
        child: Text(langs.demoData3),
      ),
    );
  }
}