// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navbar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomNavbarController on BottomNavbarControllerBase, Store {
  late final _$tabIndexAtom =
      Atom(name: 'BottomNavbarControllerBase.tabIndex', context: context);

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  late final _$BottomNavbarControllerBaseActionController =
      ActionController(name: 'BottomNavbarControllerBase', context: context);

  @override
  dynamic onTapIndex(int index) {
    final _$actionInfo = _$BottomNavbarControllerBaseActionController
        .startAction(name: 'BottomNavbarControllerBase.onTapIndex');
    try {
      return super.onTapIndex(index);
    } finally {
      _$BottomNavbarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabIndex: ${tabIndex}
    ''';
  }
}
