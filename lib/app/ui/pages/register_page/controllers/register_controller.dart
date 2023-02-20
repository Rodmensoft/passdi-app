// ignore_for_file: unnecessary_cast

import 'package:app_viajeros/app/data/models/api_responde.dart';
import 'package:app_viajeros/app/data/models/register/register.dart';
import 'package:app_viajeros/app/data/models/several_data/document_types.dart';
import 'package:app_viajeros/app/data/models/several_data/occupations.dart';
import 'package:app_viajeros/app/data/models/several_data/product.dart';
import 'package:app_viajeros/app/data/models/several_data/several_data.model.dart';
import 'package:app_viajeros/app/data/services/auth.service.dart';
import 'package:app_viajeros/app/data/services/several_data.service.dart';
import 'package:app_viajeros/app/data/services/shared_preferences.service.dart';
import 'package:app_viajeros/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/customed_alert_dialog.dart';

class RegisterController extends GetxController {
  RxInt currentStep = 1.obs;
  final prefs = Get.find<SharedPreferencesService>();

  final GlobalKey<FormState> formKeyStep1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyStep2 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyStep3 = GlobalKey<FormState>();

  RxBool formKeyStep1HasChanged = false.obs;
  RxBool formKeyStep2HasChanged = false.obs;
  RxBool formKeyStep3HasChanged = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController document = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  SeveralData? get severalData => prefs.severalData;
  List<DropDownModel> get documentTypes => severalData?.documentTypes ?? [];
  List<Product> get products => severalData?.products ?? [];
  List<Occupation> get ocuppations => severalData?.occupations ?? [];

  Rx<String?> documentTypeId = (null as String?).obs;
  Rx<String?> genderId = (null as String?).obs;
  Rx<String?> nationalityId = (null as String?).obs;
  Rx<String?> occupationId = (null as String?).obs;
  Rx<String?> civilStateId = (null as String?).obs;

  RegisterModel get registerModel => RegisterModel(
        birthDate: birthDate.text,
        document: document.text,
        email: email.text,
        name: name.text,
        password: password.text,
        phone: phone.text,
        civilStateId: int.tryParse(civilStateId.value ?? '0') ?? 0,
        documentTypeId: int.tryParse(documentTypeId.value ?? '0') ?? 0,
        genderId: int.tryParse(genderId.value ?? '0') ?? 0,
        nationalityId: int.tryParse(nationalityId.value ?? '0') ?? 0,
        occupationId: int.tryParse(occupationId.value ?? '0') ?? 0,
      );

  RxBool loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getSeveralData();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  prevStep() {
    if (currentStep.value != 1) {
      currentStep.value--;
    }
  }

  nextStep() async {
    if (currentStep.value == 1) {
      formKeyStep1HasChanged.value = true;
      if (formKeyStep1.currentState?.validate() ?? false) {
        currentStep++;
      }
      return;
    }
    if (currentStep.value == 2) {
      formKeyStep2HasChanged.value = true;
      if (formKeyStep2.currentState?.validate() ?? false) {
        currentStep++;
      }
      return;
    }

    if (currentStep.value == 3) {
      formKeyStep3HasChanged.value = true;
      if (formKeyStep3.currentState?.validate() ?? false) {
        await registerUser();
      } else {
        return;
      }
    }

    //En este punto se han pasado todas las validaciones

    return;
    // Get.back();
  }

  Future<void> registerUser() async {
    final AuthService service = Get.find();
    loading.value = true;
    ApiResponse response = await service.register(registerModel);
    loading.value = false;
    if (response.success) {
      customedAlertDialog(response.message);
      Get.back();
      Get.offAllNamed(AppRoutes.BOTTOM);
      return;
    }
    customedAlertDialog(response.message);
  }

  Future<void> getSeveralData() async {
    if (severalData == null) {
      loading.value = true;
      final SeveralDataService service = Get.find();
      ApiResponse response = await service.getSeveralData();
      loading.value = false;
    }
  }
}
