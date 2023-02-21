import 'package:passdi_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../main.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppButton(
          enableScaleAnimation: false,
          color: Theme.of(context).copyWith().primaryColor,
          onTap: () {
            Get.offAllNamed(AppRoutes.AUTH);
          },
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: radiusCircular(100.r),
              bottomLeft: radiusCircular(100.r),
            ),
          ),
          child: Text.rich(
            TextSpan(
              text: languages!.nextButton,
              children: const [
                WidgetSpan(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.white,
                    ),
                    alignment: PlaceholderAlignment.middle),
              ],
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
