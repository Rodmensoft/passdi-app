import 'package:app_viajeros/utils/common.dart';
import 'package:app_viajeros/utils/size_box_int.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../main.dart';
import '../../../widgets/form_white_container.dart';
import '../../../widgets/logo.dart';
import '../../../widgets/social_media_button.dart';
import '../../../widgets/top_black_container.dart';
import '../../bottom_navbar/view/bottom_navbar_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            children: const [
              LoginTopBlackContainer(),
              LoginTopWhiteContainer()
            ],
          ),
          28.heightSP,
          Container(
            constraints: BoxConstraints(
              maxWidth: 322.sp,
            ),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  color: const Color(0xff998FA2).withOpacity(0.3),
                  height: 1.sp,
                )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17.sp),
                  child: Text('o',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                      )),
                ),
                Expanded(
                    child: Container(
                  color: const Color(0xff998FA2).withOpacity(0.3),
                  height: 1.sp,
                )),
              ],
            ),
          ),
          28.heightSP,
          SocialMediaButton(
            name: 'facebook',
            width: 279.sp,
          ),
          SocialMediaButton(
            name: 'google',
            width: 279.sp,
          ),
        ],
      ),
    );
  }
}

class LoginTopBlackContainer extends StatelessWidget {
  const LoginTopBlackContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TopBlackContainer(
      child: Column(
        children: [
          SizedBox(height: 47.sp),
          Text(
            languages!.welcome.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25.sp,
              color: Colors.white,
            ),
          ),
          5.sp.round().height,
          Text(
            languages!.loginToContinue,
            style: TextStyle(
              // fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 33.sp),
        ],
      ),
    );
  }
}

class LoginTopWhiteContainer extends StatelessWidget {
  const LoginTopWhiteContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                140.heightSP,
                FormWhiteCardContainer(
                  height: 259.sp,
                  children: [
                    const Spacer(),
                    AppTextField(
                      textFieldType: TextFieldType.EMAIL,
                      textStyle: defaultTextFieldStyle,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    AppTextField(
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: const InputDecoration(
                        hintText: 'Clave',
                        border: UnderlineInputBorder(),
                      ),
                      textStyle: defaultTextFieldStyle,
                    ),
                    SizedBox(height: 24.sp),
                    SizedBox(
                      width: 180.sp,
                      child: AppButton(
                        shapeBorder: const StadiumBorder(),
                        elevation: 0,
                        color: Theme.of(context).primaryColor,
                        onTap: () {
                          BottomNavbarView().launch(context, isNewTask: true);
                        },
                        text: languages!.tosignin,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.sp),
                  ],
                ),
              ],
            ),
            SafeArea(
              child: Column(
                children: [
                  125.heightSP,
                  Center(
                      child: Logo(
                    size: 68.sp,
                    blur: false,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
