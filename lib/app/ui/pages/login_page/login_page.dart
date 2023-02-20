import 'package:app_viajeros/app/ui/pages/login_page/controllers/login_controller.dart';
import 'package:app_viajeros/utils/size_box_int.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';
import '../../../../utils/common.dart';
import '../../global_widgets/form_white_container.dart';
import '../../global_widgets/logo.dart';
import '../../global_widgets/social_media_button.dart';
import '../../global_widgets/top_black_container.dart';

export './bindings/login_binding.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: const [
                  LoginTopBlackContainer(),
                ],
              ),
              const Spacer(),
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
              const Spacer(),
            ],
          ),
          const LoginTopWhiteContainer()
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
    LoginController controller = Get.find();
    return Positioned.fill(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                140.heightSP,
                Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: FormWhiteCardContainer(
                    constraints: BoxConstraints(
                      minHeight: 280.sp,
                    ),
                    children: [
                      25.heightSP,
                      AppTextField(
                        controller: controller.emailCtrl,
                        textFieldType: TextFieldType.EMAIL,
                        textStyle: defaultTextFieldStyle,
                        errorInvalidEmail: 'El email no es válido',
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      AppTextField(
                        controller: controller.passCtrl,
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
                          onTap: controller.login,
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
