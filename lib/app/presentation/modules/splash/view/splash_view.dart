import 'package:app_viajeros/app/presentation/modules/onboarding/view/onboarding_view.dart';
import 'package:app_viajeros/app/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).copyWith().primaryColor,
      body: Center(
          child: Logo(
        border: false,
        blur: false,
        shadow: false,
        size: 102.sp,
      )),
    );
  }

  Future<void> init() async {
    await 1500.milliseconds.delay;
    const OnBoardingView().launch(context, isNewTask: true);
  }
}
