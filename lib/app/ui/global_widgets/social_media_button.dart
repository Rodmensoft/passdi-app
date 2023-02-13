import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class SocialMediaButton extends StatelessWidget {
  SocialMediaButton({
    super.key,
    required this.name,
    this.width,
  });
  final String name;
  final double? width;
  final socialMedia = {
    'facebook': {
      'icon': FontAwesomeIcons.facebookF,
      'color': const Color(0xff177BF2),
      'name': 'FACEBOOK'
    },
    'google': {
      'icon': FontAwesomeIcons.google,
      'color': const Color(0xffEA4335),
      'name': 'GOOGLE'
    },
    'email': {
      'icon': FontAwesomeIcons.solidEnvelope,
      'color': Colors.black,
      'name': 'EMAIL'
    },
  };
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 322.sp,
      child: AppButton(
        margin: EdgeInsets.zero,
        height: 40.sp,
        padding: EdgeInsets.only(right: 3.sp, left: 30.sp),
        shapeBorder: const StadiumBorder(),
        color: socialMedia[name]!['color'] as Color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${languages!.registerWith} ${socialMedia[name]!['name']}',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
            Container(
              width: 34.sp,
              height: 34.sp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
              ),
              child: FaIcon(
                socialMedia[name]!['icon'] as IconData,
                size: 21.7.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
        onTap: () {
          print('object');
        },
      ),
    );
  }
}
