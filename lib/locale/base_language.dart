import 'package:flutter/material.dart';

abstract class Languages {
  String get appName;
  String get haveAccount;
  String get tosignin;
  String get loginToContinue;
  String get nextButton;
  String get registerWith;
  String get signin;
  String get tosignup;
  String get welcome;
  static Languages of(BuildContext context) =>
      Localizations.of<Languages>(context, Languages)!;
}
