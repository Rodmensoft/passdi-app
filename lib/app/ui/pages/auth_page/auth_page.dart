import 'package:app_viajeros/app/routes/app_routes.dart';
import 'package:app_viajeros/utils/size_box_int.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../global_widgets/social_media_button.dart';
import 'local_widgets/auth_top_buttons.dart';
import 'local_widgets/auth_top_container.dart';

export './bindings/auth_binding.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const AuthTopContainer(child: AuthTopButtons()),
        const Spacer(),
        SocialMediaButton(name: 'facebook'),
        9.heightSP,
        SocialMediaButton(name: 'google'),
        9.heightSP,
        SocialMediaButton(name: 'email'),
        const Spacer(),
        const AlreadyHaveAnAccountWidget(),
        SizedBox(height: 115.sp),
      ],
    ));
  }
}

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: languages!.haveAccount,
        style: GoogleFonts.montserrat(
          fontSize: 10.sp,
          color: Theme.of(context).primaryColor,
        ),
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: AppButton(
              onTap: () {
                Get.toNamed(AppRoutes.LOGIN);
              },
              text: languages!.signin,
              elevation: 0,
              shapeBorder: const StadiumBorder(),
              textStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
