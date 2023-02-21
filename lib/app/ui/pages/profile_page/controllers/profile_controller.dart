// ignore_for_file: unnecessary_cast

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passdi_app/app/data/models/api_responde.dart';
import 'package:passdi_app/app/data/models/register/register.dart';
import 'package:passdi_app/app/data/services/auth.service.dart';
import 'package:passdi_app/app/ui/global_widgets/customed_alert_dialog.dart';

import '../../../../../utils/format_date.dart';
import '../../../../data/services/shared_preferences.service.dart';

class ProfileController extends GetxController {
  final Prefs prefs = Get.find();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController get emailCtrl =>
      TextEditingController(text: prefs.authData.user.email);
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController birthCtrl = TextEditingController();
  TextEditingController documentCtrl = TextEditingController();

  Rx<String?> documentTypeId = (null as String?).obs;
  Rx<String?> nationalityId = (null as String?).obs;
  Rx<String?> civilStateId = (null as String?).obs;
  Rx<String?> occupationId = (null as String?).obs;

  RxBool loading = false.obs;

  RegisterModel get updateModel => RegisterModel(
        name: nameCtrl.text,
        civilStateId: int.tryParse(civilStateId.value ?? '0') ?? 0,
        documentTypeId: int.tryParse(documentTypeId.value ?? '0') ?? 0,
        genderId: prefs.authData.user.genderId,
        nationalityId: int.tryParse(nationalityId.value ?? '0') ?? 0,
        occupationId: int.tryParse(occupationId.value ?? '0') ?? 0,
        birthDate: birthCtrl.text,
        document: documentCtrl.text,
        email: emailCtrl.text,
        phone: prefs.authData.user.phone,
      );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    setInitialData();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  setInitialData() {
    nameCtrl.text = prefs.authData.user.name;
    birthCtrl.text = formatDateBirthdate(prefs.authData.user.birthDate);
    documentCtrl.text = prefs.authData.user.document;
    documentTypeId.value = prefs.authData.user.documentTypeId.toString();
    nationalityId.value = prefs.authData.user.nationalityId.toString();
    civilStateId.value = prefs.authData.user.civilStateId.toString();
    occupationId.value = prefs.authData.user.occupationId.toString();
  }

  updateUserData() async {
    if (formKey.currentState?.validate() ?? false) {
      loading.value = true;
      final AuthService service = Get.find();
      ApiResponse response = await service.update(updateModel);
      loading.value = false;
      customedAlertDialog(response.message);
    }
  }
}
