import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import './controllers/onboarding_controller.dart';
import '../../../assets/assets.dart';
import 'local_widgets/onboarding_carousel.dart';
import 'local_widgets/onboarding_next_button.dart';

export './bindings/onboarding_binding.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find<OnboardingController>();

    return Scaffold(
      backgroundColor: const Color(0xffFAF9FA),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100.sp),
            child: Image.asset(
              Assets.assetsMiscOnboardingBg,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                const Spacer(),
                const OnBoardinCarousel(),
                60.height,
                const OnBoardingNextButton(),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
