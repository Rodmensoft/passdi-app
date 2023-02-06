// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_storage.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStorage on AppStorageBase, Store {
  late final _$selectedLanguageCodeAtom =
      Atom(name: 'AppStorageBase.selectedLanguageCode', context: context);

  @override
  String get selectedLanguageCode {
    _$selectedLanguageCodeAtom.reportRead();
    return super.selectedLanguageCode;
  }

  @override
  set selectedLanguageCode(String value) {
    _$selectedLanguageCodeAtom.reportWrite(value, super.selectedLanguageCode,
        () {
      super.selectedLanguageCode = value;
    });
  }

  late final _$setLanguageAsyncAction =
      AsyncAction('AppStorageBase.setLanguage', context: context);

  @override
  Future<void> setLanguage(String val, {BuildContext? context}) {
    return _$setLanguageAsyncAction
        .run(() => super.setLanguage(val, context: context));
  }

  @override
  String toString() {
    return '''
selectedLanguageCode: ${selectedLanguageCode}
    ''';
  }
}
