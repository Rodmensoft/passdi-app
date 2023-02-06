import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'base_language.dart';
import 'language_es.dart';

class AppLocalizations extends LocalizationsDelegate<Languages> {
  const AppLocalizations();

  @override
  Future<Languages> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'es':
        return LanguageEs();

      default:
        return LanguageEs();
    }
  }

  @override
  bool isSupported(Locale locale) =>
      LanguageDataModel.languages().contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
