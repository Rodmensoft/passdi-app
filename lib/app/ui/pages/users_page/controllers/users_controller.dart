import 'package:get/get.dart';

import '../../../../data/models/auth/user.model.dart';
import '../../../../data/services/get_nearby_users.service.dart';

class UsersController extends GetxController {
  final RxList<User> users = <User>[].obs;
  int get usersLength => users.length;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  fillFakeUsers() async {
    users.clear();
    final NearbyUsersService service = Get.find();
    var response = await service.getNearbyUsers();
    users.value = response.data;
    return;
    // users.addAll(
    //   List.generate(
    //     10,
    //     (index) => UsersModel(
    //         name: Faker().person.name(),
    //         country: 'Peruano',
    //         image: 'https://picsum.photos/id/${index + 9}/300/300'),
    //   ),
    // );
  }
}

class UsersModel {
  final String name;
  final String country;
  final String image;
  UsersModel({
    required this.name,
    required this.country,
    required this.image,
  });
}
