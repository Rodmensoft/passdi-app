import 'package:mobx/mobx.dart';

part 'bottom_navbar_controller.g.dart';

class BottomNavbarController = BottomNavbarControllerBase
    with _$BottomNavbarController;

abstract class BottomNavbarControllerBase with Store {
  @observable
  int tabIndex = 0;

  @action
  onTapIndex(int index) {
    tabIndex = index;
  }
}
