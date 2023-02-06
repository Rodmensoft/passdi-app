import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../assets/assets.dart';
import '../widgets/onboarding_carousel.dart';
import '../widgets/onboarding_next_button.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
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
