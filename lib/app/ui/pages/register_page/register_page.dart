import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/app/ui/global_widgets/customed_alert_dialog.dart';
import 'package:passdi_app/utils/size_box_int.dart';

import './controllers/register_controller.dart';
import '../../../../utils/colors.dart';
import '../../../assets/assets.dart';
import '../../global_widgets/form_white_container.dart';
import '../../global_widgets/logo.dart';
import '../../global_widgets/top_black_container.dart';
import 'local_widgets/register_forms.dart';

export './bindings/register_binding.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();

    return WillPopScope(
      onWillPop: () async {
        return await customedAlertDialog(
          '¿Está seguro de que desea salir?\nSi sale, perderá todo el progreso que haya hecho en el registro.',
          accept: 'Si',
          deny: 'No',
          cancel: true,
        );
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  TopBlackContainer(
                    child: Column(
                      children: [
                        30.heightSP,
                        Logo(
                          size: 69.sp,
                          blur: false,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 307.sp,
                    child: Image.asset(
                      Assets.assetsMiscMiscNube,
                      width: 24.sp,
                    ),
                  ),
                  Positioned.fill(
                    child: RegisterForms(controller: controller),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterForms extends StatelessWidget {
  const RegisterForms({
    super.key,
    required this.controller,
  });

  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(() => Column(
            children: [
              158.heightSP,
              FormWhiteCardContainer(
                constraints: BoxConstraints(
                  minHeight: 500.sp,
                ),
                loading: controller.loading.value,
                // height: 528.sp,
                children: [
                  41.heightSP,
                  CurrentStep(step: controller.currentStep.value),
                  if (controller.currentStep.value == 1) const FormStep1(),
                  if (controller.currentStep.value == 2) const FormStep2(),
                  if (controller.currentStep.value == 3) const FormStep3(),
                  10.heightSP,
                  Column(
                    children: [
                      AppButton(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        onTap: () => controller.nextStep(),
                        text: controller.currentStep.value != 3
                            ? 'SIGUIENTE'
                            : 'FINALIZAR',
                        color: completed,
                        width: 180.sp,
                        shapeBorder: const StadiumBorder(),
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                      5.heightSP,
                      if (controller.currentStep.value != 1)
                        AppButton(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          onTap: () => controller.prevStep(),
                          text: 'ANTERIOR',
                          color: completed,
                          width: 180.sp,
                          shapeBorder: const StadiumBorder(),
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                  20.heightSP,
                ],
              ),
            ],
          )),
    );
  }
}

class CurrentStep extends StatelessWidget {
  const CurrentStep({
    super.key,
    required this.step,
  });
  final int step;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: <Widget>[
            40.widthSP,
            Expanded(
              child: SizedBox(
                height: 32.sp,
                child: Center(
                  child: DottedLine(
                    dashLength: 1.5.sp,
                    dashGapLength: 8.sp,
                    lineThickness: 1.sp,
                    dashRadius: 16.sp,
                  ),
                ),
              ),
            ),
            40.widthSP,
          ],
        ),
        Row(
          children: <Widget>[
            40.widthSP,
            CurrentCircledStep(active: step == 1, step: 1),
            const Spacer(),
            CurrentCircledStep(active: step == 2, step: 2),
            const Spacer(),
            CurrentCircledStep(active: step == 3, step: 3),
            40.widthSP,
          ],
        ),
      ],
    );
  }
}

class CurrentCircledStep extends StatelessWidget {
  const CurrentCircledStep({
    super.key,
    required this.active,
    required this.step,
  });
  final bool active;
  final int step;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: 500.milliseconds,
      child: Column(
        key: ValueKey('$step,$active'),
        children: [
          Container(
            height: 32.sp,
            width: 32.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active ? completed : deactivatedCard,
            ),
            child: Center(
              child: Text(
                '$step',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: active ? Colors.white : deactivatedText,
                ),
              ),
            ),
          ),
          Text(
            'Paso $step',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
              color: active ? null : deactivatedText,
            ),
          ),
        ],
      ),
    );
  }
}
