import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/app/ui/pages/requestpoints_page/controllers/requestpoints_controller.dart';
import 'package:passdi_app/app/ui/pages/requestpoints_page/requestpoints_page.dart';
import 'package:passdi_app/utils/size_box_int.dart';

import './controllers/score_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/common.dart';
import '../home_page/home_page.dart';

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
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SafeArea(child: 190.heightSP),
                            // ...controller.places.asMap().entries.map((entry) {
                            //   int index = entry.key;
                            //   var user = entry.value;
                            //   return UsersVerticalListContainer(
                            //       index: index, user: user);
                            // }),
                            LocationCurvedContainer(
                              height: 100.sp,
                              to: 'Rodríguez Ballón',
                              from: 'Intl Jorge Chávez',
                              score: 25,
                              scoreColor: verifyAcColor,
                            ),
                            LocationCurvedContainer(
                              height: 100.sp,
                              to: 'Rodríguez Ballón',
                              from: 'Intl Jorge Chávez',
                              score: 25,
                              scoreColor: verifyAcColor,
                            ),
                            LocationCurvedContainer(
                              height: 100.sp,
                              to: 'Rodríguez Ballón',
                              from: 'Intl Jorge Chávez',
                              score: 0,
                              scoreColor: verifyAcColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppButton(
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
                    46.heightSP,
                    105.heightSP,
                  ],
                ),
              ),
              Stack(
                children: [
                  LocationCurvedContainer(
                    color: verifyAcColor,
                    height: 191.sp,
                    textColor: Colors.white,
                    to: 'Rodríguez Ballón',
                    from: 'Intl Jorge Chávez',
                    score: 25,
                    bottomBorder: false,
                  ),
                  ScoreCurvedContainer(
                    color: Colors.white.withOpacity(0.3),
                    textColor: Colors.white,
                  ),
                  Container(
                    color: const Color(0xff4BC0E8),
                    width: double.infinity,
                    child: const SafeArea(child: SizedBox()),
                  ),
                ],
              ),
            ],
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
    this.scoreColor,
    required this.to,
    required this.from,
    this.score,
    this.bottomBorder = true,
    this.date,
    this.reservationCode,
  });
  final double height;
  final Color? color;
  final Color textColor;
  final Color? scoreColor;
  final String to, from;
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
              color: score != null && score == 0 ? failed : textColor,
            ),
            child: Row(
              children: [
                FromToWidget(
                  start: false,
                  name: to,
                ),
                if (score == null) const Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 21.sp),
                  width: 1.sp,
                  height: 30.sp,
                  color: const Color(0xffDDDDDD),
                ),
                if (score == null) const Spacer(),
                FromToWidget(
                  name: from,
                ),
                if (score != null) const Spacer(),
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
        Opacity(
          opacity: 0.7,
          child: Text(
            'Aeropuerto',
            style: subtitleStyle,
          ),
        ),
        Text(
          name,
          style: subtitleStyle,
        )
      ],
    );
  }
}
