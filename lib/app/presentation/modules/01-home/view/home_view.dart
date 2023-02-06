import 'package:app_viajeros/utils/size_box_int.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/colors.dart';
import '../../../../assets/assets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.only(bottomLeft: Radius.circular(80.r));
    return SafeArea(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 283.sp,
                decoration: BoxDecoration(
                  color: verifyAcColor,
                  borderRadius: borderRadius,
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
                        value: 125,
                      ),
                      Container(
                        height: 40.sp,
                        width: 1.sp,
                        color: Colors.black.withOpacity(0.07),
                      ),
                      const InfoContainer(
                        title: 'Siguiendo',
                        value: 150,
                      ),
                      Container(
                        height: 40.sp,
                        width: 1.sp,
                        color: Colors.black.withOpacity(0.07),
                      ),
                      const InfoContainer(
                        title: 'Seguidores',
                        value: 21,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 213.sp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius,
                ),
                child: Container(
                  // color: Colors.red,
                  height: 73.sp,
                  margin:
                      EdgeInsets.only(bottom: 39.sp, left: 35.sp, right: 35.sp),
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                            color: Colors.black,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Text(
                                'Camila Lopez',
                              ),
                              Text(
                                'Lorem ipsum',
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
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFAFAFA),
                  borderRadius: borderRadius,
                ),
                width: double.infinity,
                height: 73.sp,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 264.sp,
                      height: 40.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1.sp,
                          color: cardColor,
                        ),
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
                              text: 'Tienes 25 puntos acumulados',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
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
