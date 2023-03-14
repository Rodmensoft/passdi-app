import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../locale/applocalizations.dart';
import '../locale/base_language.dart';
import '../main.dart';
import '../utils/configs.dart';

part 'app_storage.g.dart';

class AppStorage = AppStorageBase with _$AppStorage;

abstract class AppStorageBase with Store {
  @observable
  String selectedLanguageCode = DEFAULT_LANGUAGE;

  @action
  Future<void> setLanguage(String val, {BuildContext? context}) async {
    selectedLanguageCode = val;
    selectedLanguageDataModel = getSelectedLanguageModel();

    await setValue(SELECTED_LANGUAGE_CODE, selectedLanguageCode);
    languages =
        await const AppLocalizations().load(Locale(selectedLanguageCode));

    if (context != null) {
      // ignore: use_build_context_synchronously
      languages = Languages.of(context);
    }

    // errorMessage = languages!.pleaseTryAgain;
    // errorSomethingWentWrong = languages!.somethingWentWrong;
    errorThisFieldRequired = 'Este campo es requerido';
    fontFamilyPrimaryGlobal = 'Montserrat';
    // errorInternetNotAvailable = languages!.internetNotAvailable;
  }
}
