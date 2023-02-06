import 'package:app_viajeros/app/assets/assets.dart';
import 'package:app_viajeros/app/presentation/widgets/form_white_container.dart';
import 'package:app_viajeros/app/presentation/widgets/logo.dart';
import 'package:app_viajeros/app/presentation/widgets/top_black_container.dart';
import 'package:app_viajeros/utils/colors.dart';
import 'package:app_viajeros/utils/size_box_int.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controller/register_controller.dart';
import '../widgets/register_forms.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final controller = RegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                TopBlackContainer(
                  bottomSpace: 400.sp,
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
                    )),
                Positioned.fill(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Observer(builder: (_) {
                      return Column(
                        children: [
                          158.heightSP,
                          FormWhiteCardContainer(
                            height: 484.sp,
                            children: [
                              41.heightSP,
                              CurrentStep(step: controller.currentStepValue),
                              if (controller.currentStepValue == 1)
                                const FormStep1(),
                              if (controller.currentStepValue == 2)
                                const FormStep2(),
                              if (controller.currentStepValue == 3)
                                const FormStep3(),
                              AppButton(
                                onTap: () => controller.setIndexTrue(
                                    controller.currentStepValue, context),
                                text: controller.currentStepValue != 3
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
                              20.heightSP,
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
      duration: const Duration(milliseconds: 500),
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
