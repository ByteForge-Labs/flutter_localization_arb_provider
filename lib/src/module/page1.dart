import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations langs = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body:  Center(
        child: Text(langs.demoData2),
      ),
    );
  }
}