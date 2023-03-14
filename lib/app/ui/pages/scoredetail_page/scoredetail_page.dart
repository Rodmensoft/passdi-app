import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './controllers/scoredetail_controller.dart';
import '../../global_widgets/score_curved_container.dart';
import '../score_page/score_page.dart';

export './bindings/scoredetail_binding.dart';

class ScoreDetailPage extends StatelessWidget {
  const ScoreDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScoreDetailController controller = Get.find<ScoreDetailController>();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: SafeArea(child: SizedBox()),
          ),
          Stack(
            children: [
              LocationCurvedContainer(
                height: 260.sp,
                textColor: Colors.black.withOpacity(0.7),
                destination: 'Rodríguez Ballón',
                origin: 'Intl Jorge Chávez',
                bottomBorder: true,
                date: '01/02/2022',
                reservationCode: 'F4GHDAASD',
              ),
              const ScoreCurvedContainer(hasBorder: true),
              const SizedBox(
                width: double.infinity,
                child: SafeArea(child: SizedBox()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
