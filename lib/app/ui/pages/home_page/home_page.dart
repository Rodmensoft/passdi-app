import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passdi_app/app/data/services/shared_preferences.service.dart';
import 'package:passdi_app/app/ui/pages/home_page/controllers/home_controller.dart';
import 'package:passdi_app/utils/size_box_int.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/common.dart';
import '../../../assets/assets.dart';
import '../../global_widgets/score_curved_container.dart';

export './bindings/home_binding.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return SafeArea(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            width: double.infinity,
            child: SafeArea(child: SizedBox()),
          ),
          Stack(
            // alignment: Alignment.bottomCenter,
            children: const [
              UserStatsCurvedContainer(),
              ProfileCurvedContainer(),
              ScoreCurvedContainer(hasBorder: true),
            ],
          ),
          23.heightSP,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform.translate(
                offset: Offset(23.sp, 0),
                child: Image.asset(
                  Assets.assetsMiscMiscSol,
                  height: 46.54.sp,
                ),
              ),
            ],
          ),
          249.heightSP,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                Assets.assetsMiscMiscNube,
                height: 22.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserStatsCurvedContainer extends StatelessWidget {
  const UserStatsCurvedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 283.sp,
      decoration: BoxDecoration(
        color: verifyAcColor,
        borderRadius: curvedContainerBorderRadius,
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        // color: Colors.red,
        height: 50.sp,
        margin: EdgeInsets.only(left: 57.sp, right: 35.sp),
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const InfoContainer(
              title: 'Likes',
              value: 0,
            ),
            Container(
              height: 40.sp,
              width: 1.sp,
              color: Colors.black.withOpacity(0.07),
            ),
            const InfoContainer(
              title: 'Siguiendo',
              value: 0,
            ),
            Container(
              height: 40.sp,
              width: 1.sp,
              color: Colors.black.withOpacity(0.07),
            ),
            const InfoContainer(
              title: 'Seguidores',
              value: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCurvedContainer extends StatelessWidget {
  const ProfileCurvedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Prefs prefs = Get.find();
    return Container(
      alignment: Alignment.bottomCenter,
      height: 213.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: curvedContainerBorderRadius,
      ),
      child: Container(
        // color: Colors.red,
        height: 73.sp,
        margin: EdgeInsets.only(bottom: 39.sp, left: 35.sp, right: 35.sp),
        child: Row(
          children: <Widget>[
            ClipOval(
              child: Image.network(
                'https://picsum.photos/id/28/300/300',
                width: 70.sp,
                height: 70.sp,
              ),
            ),
            10.widthSP,
            Expanded(
              child: DefaultTextStyle(
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: Colors.black,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AutoSizeText(
                      prefs.authData.user.name,
                      maxLines: 1,
                    ),
                    Text(
                      prefs.authData.user.nationality,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: appTextSecondaryColor,
                      ),
                    ),
                    10.heightSP,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: Colors.white,
      ),
      child: Column(
        // cr
        children: [
          Text('$value'),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 11.sp,
              color: Colors.white.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}
