import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:passdi_app/utils/size_box_int.dart';

import '../../../utils/colors.dart';
import '../../../utils/common.dart';
import '../../assets/assets.dart';
import '../../data/services/shared_preferences.service.dart';

class ScoreCurvedContainer extends StatelessWidget {
  const ScoreCurvedContainer({
    super.key,
    this.color = const Color(0xffFAFAFA),
    this.textColor,
    this.hasBorder = false,
  });

  final Color color;
  final Color? textColor;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    final Prefs prefs = Get.find();

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: curvedContainerBorderRadius,
      ),
      width: double.infinity,
      height: 93.sp,
      alignment: Alignment.center,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 264.sp,
              height: 40.sp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: hasBorder
                    ? Border.all(
                        width: 1.sp,
                        color: cardColor,
                      )
                    : null,
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Image.asset(
                        Assets.assetsMiscHomePuntaje,
                        width: 21.53.sp,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Tienes ${prefs.userNumberPoints} puntos acumulados',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: textColor,
                        // color:,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            26.heightSP,
          ],
        ),
      ),
    );
  }
}
