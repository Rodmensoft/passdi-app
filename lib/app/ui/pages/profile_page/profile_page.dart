import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/app/constants/civil_states.dart';
import 'package:passdi_app/app/data/services/shared_preferences.service.dart';
import 'package:passdi_app/app/ui/global_widgets/custom_dropdown.dart';
import 'package:passdi_app/app/ui/global_widgets/custom_search_select_dialog.dart';
import 'package:passdi_app/utils/size_box_int.dart';

import './controllers/profile_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/date_picker.dart';
import '../../../../utils/format_date.dart';
import '../../global_widgets/custom_cicular_progress_ind.dart';
import '../../global_widgets/score_curved_container.dart';

export './bindings/profile_binding.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();

    controller.setInitialData();
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: SafeArea(child: SizedBox()),
        ),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Obx(
                        () => controller.loading.value
                            ? const CustomCenteredCicularProgressInd()
                            : const ProfileForm(),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: const [
                  ScoreCurvedContainer(hasBorder: true),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();
    final Prefs prefs = Get.find();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          110.heightSP,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 31.sp),
            width: 322.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1.sp),
                  blurRadius: 5.r,
                  color: const Color(0xffE5E5E5),
                )
              ],
              color: Colors.white,
            ),
            child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: <Widget>[
                  41.heightSP,
                  AppTextField(
                    controller: controller.nameCtrl,
                    textFieldType: TextFieldType.NAME,
                    decoration: InputDecoration(
                      hintStyle: primaryTextStyle(color: Colors.black45),
                      hintText: 'Nombres y Apellidos',
                    ),
                  ),
                  AppTextField(
                    readOnly: true,
                    controller: controller.emailCtrl,
                    textFieldType: TextFieldType.EMAIL,
                    decoration: InputDecoration(
                      hintStyle: primaryTextStyle(color: Colors.black45),
                      hintText: 'Email',
                    ),
                  ),
                  Obx(() => CustomDropdownButton(
                        value: controller.documentTypeId.value,
                        items: prefs.severalData!.documentTypes,
                        onChanged: (value) {
                          controller.documentTypeId.value = value;
                        },
                        hintText: 'Tipo de Documento',
                      )),
                  AppTextField(
                    controller: controller.documentCtrl,
                    textFieldType: TextFieldType.NAME,
                    decoration: InputDecoration(
                      hintStyle: primaryTextStyle(color: Colors.black45),
                      hintText: 'Número de Documento',
                    ),
                  ),
                  Obx(() => GestureDetector(
                        onTap: () {
                          Get.dialog(
                            SearchSelectDialog(
                              items: prefs.severalData!.nationality,
                              selectedItemId: controller.nationalityId.value,
                              onChanged: (value) async {
                                controller.nationalityId.value = value;
                                await Future.delayed(
                                    const Duration(milliseconds: 300));
                                controller.formKey.currentState?.validate();
                              },
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: IgnorePointer(
                            child: CustomDropdownButton(
                              value: controller.nationalityId.value,
                              items: prefs.severalData!.nationality,
                              onChanged: (value) {},
                              hintText: 'Nacionalidad',
                            ),
                          ),
                        ),
                      )),
                  GestureDetector(
                    onTap: () async {
                      DateTime? initialDate = controller.birthCtrl.text.isEmpty
                          ? null
                          : DateTime.parse(controller.birthCtrl.text);
                      DateTime? selectedDate =
                          await customDatePicker(context, initialDate);
                      if (selectedDate != null) {
                        controller.birthCtrl.text =
                            formatDateBirthdate(selectedDate);
                      }
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: IgnorePointer(
                        ignoring: true,
                        child: AppTextField(
                          controller: controller.birthCtrl,
                          textFieldType: TextFieldType.NAME,
                          decoration: InputDecoration(
                            hintStyle: primaryTextStyle(color: Colors.black45),
                            hintText: 'Fecha de Nacimiento',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(() => CustomDropdownButton(
                        value: controller.civilStateId.value,
                        items: civilStates,
                        onChanged: (value) {
                          controller.civilStateId.value = value;
                        },
                        hintText: 'Estado civil',
                      )),
                  Obx(() => CustomDropdownButton(
                        value: controller.occupationId.value,
                        items: prefs.severalData!.occupations,
                        onChanged: (value) {
                          controller.occupationId.value = value;
                        },
                        hintText: 'Ocupación',
                      )),
                  Obx(
                    () => CheckboxListTile(
                      activeColor: accept,
                      visualDensity: VisualDensity.comfortable,
                      value: controller.profileVisible.value,
                      dense: true,
                      title: Text(
                        'Visibilidad del usuario',
                        style: primaryTextStyle(fontStyle: FontStyle.italic),
                      ),
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (bool? value) {
                        controller.profileVisible.value = value!;
                      },
                    ),
                  ),
                  47.heightSP,
                  AppButton(
                    height: 40.sp,
                    width: 225.sp,
                    color: completed,
                    onTap: () {
                      controller.updateUserData();
                    },
                    child: Text(
                      'GUARDAR',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  10.heightSP,
                  AppButton(
                    height: 40.sp,
                    width: 225.sp,
                    color: failed,
                    onTap: () {
                      controller.logout();
                    },
                    child: Text(
                      'Cerrar sesión'.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  20.heightSP,
                ],
              ),
            ),
          ),
          105.heightSP,
        ],
      ),
    );
  }
}
