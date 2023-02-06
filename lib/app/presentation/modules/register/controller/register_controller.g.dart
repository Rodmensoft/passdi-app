// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on RegisterControllerBase, Store {
  late final _$currentStepValueAtom =
      Atom(name: 'RegisterControllerBase.currentStepValue', context: context);

  @override
  int get currentStepValue {
    _$currentStepValueAtom.reportRead();
    return super.currentStepValue;
  }

  @override
  set currentStepValue(int value) {
    _$currentStepValueAtom.reportWrite(value, super.currentStepValue, () {
      super.currentStepValue = value;
    });
  }

  late final _$RegisterControllerBaseActionController =
      ActionController(name: 'RegisterControllerBase', context: context);

  @override
  dynamic setIndexTrue(int key, BuildContext context) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.setIndexTrue');
    try {
      return super.setIndexTrue(key, context);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCurrentStepValue(int key, BuildContext context) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.changeCurrentStepValue');
    try {
      return super.changeCurrentStepValue(key, context);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentStepValue: ${currentStepValue}
    ''';
  }
}
