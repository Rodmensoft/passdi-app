import 'package:faker/faker.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  final RxList<UsersModel> users = <UsersModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fillFakeUsers();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  fillFakeUsers() {
    users.addAll(
      List.generate(
        10,
        (index) => UsersModel(
            name: Faker().person.name(),
            country: 'Peruano',
            image: 'https://picsum.photos/id/${index + 9}/300/300'),
      ),
    );
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
