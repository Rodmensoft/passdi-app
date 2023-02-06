import 'package:app_viajeros/app/presentation/modules/splash/view/splash_view.dart';
import 'package:app_viajeros/locale/base_language.dart';
import 'package:app_viajeros/storage/app_storage.dart';
import 'package:app_viajeros/utils/colors.dart';
import 'package:app_viajeros/utils/common.dart';
import 'package:app_viajeros/utils/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import 'app_theme.dart';
import 'locale/applocalizations.dart';

//region Mobx Stores
AppStorage appStorage = AppStorage();
//region App languages
Languages? languages;
//endregion
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  localeLanguageList = languageList();
  appStorage.setLanguage(DEFAULT_LANGUAGE);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            supportedLocales: LanguageDataModel.languageLocales(),
            theme: AppTheme.lightTheme(color: primaryColor),
            home: const SplashView(),
            localizationsDelegates: const [
              AppLocalizations(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) => locale,
            locale: const Locale('es'),
          );
        });
  }
}
