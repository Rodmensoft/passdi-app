import 'package:app_viajeros/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../main.dart';

class AuthTopButtons extends StatelessWidget {
  const AuthTopButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration(const Color(0xff111016)),
      height: 36.sp,
      width: 322.sp,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        child: Row(
          children: [
            AuthTopButton(
              onTap: () {
                Get.toNamed(AppRoutes.REGISTER);
              },
              text: languages!.tosignup,
              decoration: decoration(Colors.transparent),
              color: Colors.white.withOpacity(0.6),
            ),
            AuthTopButton(
              onTap: () {
                Get.toNamed(AppRoutes.LOGIN);
              },
              text: languages!.tosignin,
              decoration: decoration(const Color(0xffEFB810)),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration decoration(Color color) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: color,
    );
  }
}

class AuthTopButton extends StatelessWidget {
  const AuthTopButton({
    super.key,
    required this.text,
    required this.decoration,
    required this.onTap,
    required this.color,
  });
  final String text;
  final Decoration decoration;
  final void Function() onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: decoration,
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
