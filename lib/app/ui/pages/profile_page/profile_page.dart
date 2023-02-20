import 'package:app_viajeros/utils/size_box_int.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import './controllers/profile_controller.dart';
import '../../../../utils/colors.dart';
import '../home_page/home_page.dart';

export './bindings/profile_binding.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: SafeArea(child: SizedBox()),
        ),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            110.heightSP,
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 31.sp),
                              width: 322.sp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1.sp),
                                    blurRadius: 5.r,
                                    color: const Color(0xffE5E5E5),
                                  )
                                ],
                                color: Colors.white,
                              ),
                              child: Column(
                                children: <Widget>[
                                  41.heightSP,
                                  AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    decoration: const InputDecoration(
                                      hintText: 'Nombres y Apellidos',
                                    ),
                                  ),
                                  AppTextField(
                                    textFieldType: TextFieldType.EMAIL,
                                    decoration: const InputDecoration(
                                      hintText: 'Email',
                                    ),
                                  ),
                                  AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    decoration: const InputDecoration(
                                      hintText: 'Tipo de Documento',
                                    ),
                                  ),
                                  AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    decoration: const InputDecoration(
                                      hintText: 'Nacionalidad',
                                    ),
                                  ),
                                  AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    decoration: const InputDecoration(
                                      hintText: 'Fecha de Nacimiento',
                                    ),
                                  ),
                                  AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    decoration: const InputDecoration(
                                      hintText: 'Estado Civil',
                                    ),
                                  ),
                                  AppTextField(
                                    textFieldType: TextFieldType.NAME,
                                    decoration: const InputDecoration(
                                      hintText: 'Ocupación',
                                    ),
                                  ),
                                  47.heightSP,
                                  AppButton(
                                    height: 40.sp,
                                    width: 225.sp,
                                    disabledColor: deactivatedCard,
                                    child: Text(
                                      'GUARDAR',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                  20.heightSP,
                                ],
                              ),
                            ),
                            105.heightSP,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: const [
                  ScoreCurvedContainer(
                    hasBorder: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
