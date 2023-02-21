import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/app/data/services/shared_preferences.service.dart';
import 'package:passdi_app/app/ui/global_widgets/custom_cicular_progress_ind.dart';
import 'package:passdi_app/utils/size_box_int.dart';

import './controllers/requestpoints_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/date_picker.dart';
import '../../../../utils/format_date.dart';
import '../../global_widgets/custom_dropdown.dart';

export './bindings/requestpoints_binding.dart';

class RequestPointsPage extends StatelessWidget {
  const RequestPointsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RequestPointsController controller =
        Get.find<RequestPointsController>();

    Prefs prefs = Get.find();

    return SimpleDialog(
      title: const Text(
        'Solicitar Puntos',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400, color: Colors.black, fontSize: 18.sp),
      titlePadding: const EdgeInsets.all(18),
      children: [
        Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Obx(
            () => Stack(
              children: [
                Opacity(
                  opacity: controller.loading.value ? 0 : 1,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 31.sp),
                          width: 322.sp,
                          child: Column(
                            children: [
                              AppTextField(
                                controller: controller.reservationCtrl,
                                textFieldType: TextFieldType.NAME,
                                decoration: const InputDecoration(
                                  hintText: 'Código de Reserva',
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  DateTime now = DateTime.now();
                                  DateTime? initialDate =
                                      controller.travelDateCtrl.text.isEmpty
                                          ? now
                                          : DateTime.parse(
                                              controller.travelDateCtrl.text);
                                  DateTime? selectedDate =
                                      await customDatePicker(
                                    context,
                                    initialDate,
                                    lastDate: now,
                                  );
                                  if (selectedDate != null) {
                                    controller.travelDateCtrl.text =
                                        formatDateBirthdate(selectedDate);
                                  }
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: IgnorePointer(
                                    ignoring: true,
                                    child: AppTextField(
                                      controller: controller.travelDateCtrl,
                                      textFieldType: TextFieldType.NAME,
                                      decoration: const InputDecoration(
                                        hintText: 'Fecha de Viaje',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => CustomDropdownButton(
                                  value: controller.origin.value,
                                  items: prefs.severalData!.airports,
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.origin.value = value;
                                    }
                                  },
                                  hintText: 'Aeropuerto de Origen',
                                ),
                              ),
                              Obx(
                                () => CustomDropdownButton(
                                  value: controller.destination.value,
                                  items: prefs.severalData!.airports,
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.destination.value = value;
                                    }
                                  },
                                  hintText: 'Aeropuerto de Destino',
                                ),
                              ),
                              Obx(
                                () => CustomDropdownButton(
                                  value: controller.airline.value,
                                  items: prefs.severalData!.airlines,
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.airline.value = value;
                                    }
                                  },
                                  hintText: 'Aeropuerto de Origen',
                                ),
                              ),
                              20.heightSP,
                              AppButton(
                                height: 40.sp,
                                width: 225.sp,
                                color: completed,
                                onTap: () {
                                  controller.requestPoints();
                                },
                                child: Text(
                                  'SOLICITAR',
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
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Visibility(
                      visible: controller.loading.value,
                      child: const CustomCenteredCicularProgressInd()),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
