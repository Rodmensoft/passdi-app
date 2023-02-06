import 'package:app_viajeros/app/presentation/modules/02-users/view/users_view.dart';
import 'package:app_viajeros/app/presentation/modules/03-location/view/location_view.dart';
import 'package:app_viajeros/app/presentation/modules/04-score/view/score_view.dart';
import 'package:app_viajeros/app/presentation/modules/05-profile/view/profile_view.dart';
import 'package:app_viajeros/app/presentation/modules/bottom_navbar/controller/bottom_navbar_controller.dart';
import 'package:app_viajeros/utils/colors.dart';
import 'package:app_viajeros/utils/size_box_int.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../assets/assets.dart';
import '../../01-home/view/home_view.dart';

class BottomNavbarView extends StatelessWidget {
  final BottomNavbarController controller = BottomNavbarController();

  BottomNavbarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: _widgets.elementAt(controller.tabIndex),
        bottomNavigationBar: CustomBottomNavBar(controller: controller),
      );
    });
  }

  final List<Widget> _widgets = [
    const HomeView(),
    const UsersView(),
    const LocationView(),
    const ScoreView(),
    const ProfileView(),
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
                currentIndex: controller.tabIndex,
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
