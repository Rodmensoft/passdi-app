import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/app/ui/pages/requestpoints_page/controllers/requestpoints_controller.dart';
import 'package:passdi_app/app/ui/pages/requestpoints_page/requestpoints_page.dart';
import 'package:passdi_app/utils/size_box_int.dart';

import './controllers/score_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/common.dart';
import '../../global_widgets/custom_cicular_progress_ind.dart';
import '../../global_widgets/score_curved_container.dart';

export './bindings/score_binding.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScoreController controller = Get.find<ScoreController>();

    return Column(
      children: [
        Container(
          color: verifyAcColor,
          width: double.infinity,
          child: const SafeArea(child: SizedBox()),
        ),
        Expanded(
          child: Obx(
            () => Stack(
              children: [
                controller.loading.value
                    ? const CustomCenteredCicularProgressInd()
                    : SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    93.heightSP,
                                    ...controller.allRequestedPoints.map(
                                      (element) => LocationCurvedContainer(
                                        textColor: element.stateColor,
                                        height: 100.sp,
                                        destination: element.destination,
                                        origin: element.origin,
                                        score: element.point,
                                        scoreColor: verifyAcColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            90.heightSP,
                          ],
                        ),
                      ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: AppButton(
                        height: 40.sp,
                        width: 225.sp,
                        onTap: () {
                          Get.lazyPut(() => RequestPointsController());
                          Get.dialog(const RequestPointsPage());
                        },
                        color: hold,
                        child: Text(
                          'SOLICITAR PUNTOS',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    10.heightSP,
                    105.heightSP,
                  ],
                ),
                Stack(
                  children: const [
                    ScoreCurvedContainer(
                      color: Color(0xff4DC2EA),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LocationCurvedContainer extends StatelessWidget {
  const LocationCurvedContainer({
    super.key,
    required this.height,
    this.color = Colors.white,
    this.textColor = Colors.black,
    required this.destination,
    required this.origin,
    this.score,
    this.bottomBorder = true,
    this.date,
    this.reservationCode,
    this.scoreColor,
  });
  final double height;
  final Color? color;
  final Color textColor;
  final Color? scoreColor;

  final String destination, origin;
  final int? score;
  final bool bottomBorder;
  final String? date;
  final String? reservationCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.sp),
      padding: EdgeInsets.symmetric(horizontal: 50.sp),
      clipBehavior: Clip.antiAlias,
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: curvedContainerBorderRadius,
          color: color,
          boxShadow: bottomBorder
              ? [
                  BoxShadow(
                      color: const Color(0xffE7E4E9),
                      offset: Offset(-1.sp, 1.sp))
                ]
              : null),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DefaultTextStyle(
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: textColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: FromToWidget(
                    start: false,
                    name: destination,
                  ),
                ),
                if (score == null) const Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 21.sp),
                  width: 1.sp,
                  height: 30.sp,
                  color: const Color(0xffDDDDDD),
                ),
                if (score == null) const Spacer(),
                Expanded(
                  child: FromToWidget(
                    name: origin,
                  ),
                ),
                if (score != null)
                  Container(
                    width: 53.sp,
                    height: 38.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        radiusCircular(10.r),
                      ),
                      color: score == 0
                          ? deactivatedCard
                          : scoreColor ?? Colors.white.withOpacity(0.2),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Puntos\n$score',
                      style: TextStyle(
                        color: score == 0
                            ? Colors.black.withOpacity(0.2)
                            : Colors.white,
                        fontSize: 10.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
          // Row(
          //   children: const [
          //     Icon(Icons.calendar_month_outlined),
          //   ],
          // ),
          if (date != null) 15.heightSP,
          if (date != null)
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Opacity(
                          opacity: 0.5,
                          child: Icon(
                            Icons.calendar_month_outlined,
                            color: textColor,
                            size: 15.sp,
                          ),
                        ),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      TextSpan(
                        text: '\t\tFecha:\t\t\t\t',
                        style: TextStyle(
                          color: textColor.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(text: '01/02/2022'),
                    ],
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: textColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),

          if (reservationCode != null) 21.heightSP,
          if (reservationCode != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Código de Reserva',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: textColor,
                  ),
                ),
                18.widthSP,
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.sp, vertical: 12.5.sp),
                  decoration: BoxDecoration(
                      color: const Color(0xffE0FBFC),
                      borderRadius: BorderRadius.circular(52.r)),
                  child: Text(
                    reservationCode!,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),

          42.heightSP,
        ],
      ),
    );
  }
}

class FromToWidget extends StatelessWidget {
  const FromToWidget({
    super.key,
    this.start = true,
    required this.name,
  });
  final bool start;
  final String name;
  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 10.sp,
    );
    final TextStyle subtitleStyle = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 12.sp,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Opacity(
          opacity: 0.7,
          child: Text(
            start ? 'Origen' : 'Destino',
            style: titleStyle,
          ),
        ),
        // Opacity(
        //   opacity: 0.7,
        //   child: Text(
        //     'Aeropuerto',
        //     style: subtitleStyle,
        //   ),
        // ),
        Row(
          children: [
            Expanded(
              child: AutoSizeText(
                name,
                style: subtitleStyle,
                // minFontSize: 12.sp,
                maxLines: 2,
              ),
            ),
          ],
        )
      ],
    );
  }
}
