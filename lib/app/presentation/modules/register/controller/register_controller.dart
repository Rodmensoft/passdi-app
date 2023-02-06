import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  @observable
  int currentStepValue = 1;

  @action
  setIndexTrue(int key, BuildContext context) {
    changeCurrentStepValue(key, context);
  }

  @action
  changeCurrentStepValue(int key, BuildContext context) {
    currentStepValue = key + 1;
    if (currentStepValue == 4) {
      finish(context);
    }
  }
}
