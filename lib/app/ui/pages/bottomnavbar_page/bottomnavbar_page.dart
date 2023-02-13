import 'package:app_viajeros/utils/size_box_int.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './controllers/bottomnavbar_controller.dart';
import '../../../../utils/colors.dart';
import '../../../assets/assets.dart';
import '../home_page/home_page.dart';
import '../location_page/location_page.dart';
import '../profile_page/profile_page.dart';
import '../score_page/score_page.dart';
import '../users_page/users_page.dart';

export './bindings/bottomnavbar_binding.dart';

class BottomNavbarPage extends StatelessWidget {
  BottomNavbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavbarController controller = Get.find();
    return Obx(() => Scaffold(
          body: _widgets.elementAt(controller.tabIndex.value),
          bottomNavigationBar: CustomBottomNavBar(controller: controller),
        ));
  }

  final List<Widget> _widgets = [
    const HomePage(),
    const UsersPage(),
    const LocationPage(),
    const ScorePage(),
    const ProfilePage(),
  ];
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.controller,
  });

  final BottomNavbarController controller;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RPSCustomPainter(),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.4,
              child: Image.asset(
                Assets.assetsMiscBottomNavTrazado,
                width: double.infinity,
                fit: BoxFit.fill,
                height: 105.97.sp,
              ),
            ),
            Positioned.fill(
              bottom: -30.sp,
              child: BottomNavigationBar(
                items: [
                  customNavigationBarItem(
                    label: 'Inicio',
                    icon: Assets.assetsMiscBnavbarHome,
                  ),
                  customNavigationBarItem(
                    label: 'Usuarios',
                    icon: Assets.assetsMiscBnavbarContactos,
                  ),
                  customNavigationBarItem(
                    label: 'Ubicación',
                    icon: Assets.assetsMiscBnavbarUbicacion,
                  ),
                  customNavigationBarItem(
                    label: 'Puntos',
                    icon: Assets.assetsMiscBnavbarDinero,
                  ),
                  customNavigationBarItem(
                    label: 'Perfil',
                    icon: Assets.assetsMiscBnavbarPerfil,
                  ),
                ],
                currentIndex: controller.tabIndex.value,
                unselectedItemColor: primaryColor,
                selectedItemColor: primaryColor,
                iconSize: 1,
                type: BottomNavigationBarType.fixed,
                onTap: controller.onTapIndex,
                enableFeedback: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem customNavigationBarItem(
      {required String label, required String icon}) {
    return BottomNavigationBarItem(
      label: '',
      icon: BottonNavBarIcon(
        label: label,
        icon: icon,
      ),
      activeIcon: BottonNavBarIcon(
        label: label,
        icon: icon,
        isSelected: true,
      ),
    );
  }
}

class BottonNavBarIcon extends StatelessWidget {
  const BottonNavBarIcon({
    super.key,
    this.isSelected = false,
    required this.icon,
    required this.label,
  });
  final bool isSelected;
  final String icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        5.heightSP,
        Image.asset(
          icon,
          height: 30.sp,
          width: 30.sp,
          color: isSelected ? verifyAcColor : null,
        ),
        Text(label),
        5.heightSP,
        Container(
          height: 8.sp,
          width: 8.sp,
          decoration: BoxDecoration(
            color: isSelected ? verifyAcColor : null,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
