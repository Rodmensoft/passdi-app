import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/app/data/models/api_responde.dart';
import 'package:passdi_app/app/data/services/terms_conditions.service.dart';
import 'package:passdi_app/app/ui/global_widgets/custom_cicular_progress_ind.dart';
import 'package:passdi_app/app/ui/pages/register_page/controllers/register_controller.dart';
import 'package:passdi_app/utils/colors.dart';
import 'package:passdi_app/utils/size_box_int.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../utils/date_picker.dart';
import '../../../../../utils/format_date.dart';
import '../../../../constants/civil_states.dart';
import '../../../global_widgets/custom_dropdown.dart';
import '../../../global_widgets/custom_search_select_dialog.dart';

class FormStep1 extends StatelessWidget {
  const FormStep1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();
    return Obx(
      () => Form(
        key: controller.formKeyStep1,
        autovalidateMode: controller.formKeyStep1HasChanged.value
            ? AutovalidateMode.onUserInteraction
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextField(
              controller: controller.name,
              textFieldType: TextFieldType.NAME,
              decoration: const InputDecoration(
                hintText: 'Nombres y Apellidos',
              ),
            ),
            AppTextField(
              controller: controller.email,
              textFieldType: TextFieldType.EMAIL,
              errorInvalidEmail: 'El email no es válido',
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            AppTextField(
              controller: controller.password,
              textFieldType: TextFieldType.PASSWORD,
              errorMinimumPasswordLength: 'La contraseña demasiado corta.',
              decoration: const InputDecoration(
                hintText: 'Clave',
              ),
            ),
            AppTextField(
              controller: controller.repassword,
              textFieldType: TextFieldType.PASSWORD,
              decoration: const InputDecoration(
                hintText: 'Repetir clave',
              ),
              validator: (v) {
                if (controller.password.text != v) {
                  return 'Las contraseñas no coinciden.';
                } else if (controller.repassword.text.isEmpty) {
                  return 'Este campo es requerido';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FormStep2 extends StatelessWidget {
  const FormStep2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();
    return Obx(
      () => Form(
        key: controller.formKeyStep2,
        autovalidateMode: controller.formKeyStep2HasChanged.value
            ? AutovalidateMode.onUserInteraction
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => CustomDropdownButton(
                value: controller.documentTypeId.value,
                items: controller.documentTypes,
                hintText: 'Tipo de Documento',
                onChanged: (value) {
                  controller.documentTypeId.value = value;
                },
              ),
            ),
            AppTextField(
              controller: controller.document,
              textFieldType: TextFieldType.NUMBER,
              decoration:
                  const InputDecoration(hintText: 'Número de Documento'),
            ),
            AppTextField(
              controller: controller.phone,
              textFieldType: TextFieldType.PHONE,
              decoration: const InputDecoration(
                hintText: 'Celular',
              ),
            ),
            Obx(
              () => CustomDropdownButton(
                value: controller.genderId.value,
                items: genders,
                hintText: 'Género',
                onChanged: (value) {
                  controller.genderId.value = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormStep3 extends StatelessWidget {
  const FormStep3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();
    return Obx(() => Form(
          key: controller.formKeyStep3,
          autovalidateMode: controller.formKeyStep3HasChanged.value
              ? AutovalidateMode.onUserInteraction
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () async {
                    await Get.dialog(
                      SearchSelectDialog(
                        items: controller.products,
                        selectedItemId: controller.nationalityId.value,
                        onChanged: (value) async {
                          controller.nationalityId.value = value;
                          await Future.delayed(
                              const Duration(milliseconds: 300));
                          controller.formKeyStep3.currentState?.validate();
                        },
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: IgnorePointer(
                      child: CustomDropdownButton(
                        value: controller.nationalityId.value,
                        items: controller.products,
                        hintText: 'Nacionalidad',
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => CustomDropdownButton(
                  value: controller.occupationId.value,
                  items: controller.ocuppations,
                  hintText: 'Ocupación',
                  onChanged: (value) {
                    controller.occupationId.value = value;
                    controller.formKeyStep3.currentState?.validate();
                  },
                ),
              ),
              GestureDetector(
                onTap: () async {
                  DateTime? initialDate = controller.birthDate.text.isEmpty
                      ? null
                      : DateTime.parse(controller.birthDate.text);
                  DateTime? selectedDate =
                      await customDatePicker(context, initialDate);
                  if (selectedDate != null) {
                    controller.birthDate.text =
                        formatDateBirthdate(selectedDate);
                  }
                  controller.formKeyStep3.currentState?.validate();
                },
                child: Container(
                  color: Colors.transparent,
                  child: IgnorePointer(
                    ignoring: true,
                    child: AppTextField(
                      controller: controller.birthDate,
                      textFieldType: TextFieldType.NAME,
                      decoration: const InputDecoration(
                        hintText: 'Fecha de Nacimiento',
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => CustomDropdownButton(
                  value: controller.civilStateId.value,
                  items: civilStates,
                  hintText: 'Estado Civil',
                  onChanged: (value) {
                    controller.civilStateId.value = value;
                    controller.formKeyStep3.currentState?.validate();
                  },
                ),
              ),
              Obx(
                () => CheckboxListTile(
                  secondary: const Text('¿Acepta los términos y condiciones?'),
                  value: controller.termsConditions.value,
                  onChanged: (bool? value) async {
                    Get.dialog(
                      TermsConditionsWidget(
                        onAccept: () {
                          controller.termsConditions.value = true;
                          Get.back();
                        },
                        onDecline: () {
                          controller.termsConditions.value = false;
                          Get.back();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class TermsConditionsWidget extends StatelessWidget {
  const TermsConditionsWidget({
    super.key,
    required this.onAccept,
    required this.onDecline,
  });

  final void Function() onAccept;
  final void Function() onDecline;

  @override
  Widget build(BuildContext context) {
    TermsConditionsService service = Get.find();

    return FutureBuilder(
        future: service.getTYC(),
        builder: (_, AsyncSnapshot<ApiResponse?> snapshot) {
          return SimpleDialog(
            children: [
              !snapshot.hasData
                  ? const CustomCenteredCicularProgressInd()
                  : Html(
                      data: snapshot.data?.data,
                      onLinkTap: (url, context, attributes, element) =>
                          _launchUrl(url!),
                    ),
              if (snapshot.hasData)
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        color: completed,
                        onTap: onAccept,
                        child: const Text(
                          'Aceptar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      20.widthSP,
                      AppButton(
                        color: failed,
                        onTap: onDecline,
                        child: const Text(
                          'Rechazar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        });
  }

  Future<void> _launchUrl(String uri) async {
    // if (await canLaunchUrl(Uri.parse(uri))) {
    await launchUrlString(uri);
  }
}
