import 'package:app_viajeros/utils/size_box_int.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './controllers/users_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/common.dart';
import '../home_page/home_page.dart';

export './bindings/users_binding.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UsersController controller = Get.find();
    const color = Color(0xff4A4A4A);
    return Column(
      children: [
        Container(
          color: color,
          width: double.infinity,
          child: const SafeArea(child: SizedBox()),
        ),
        Stack(
          children: [
            ...controller.users.asMap().entries.map((entry) {
              int index = entry.key;
              var user = entry.value;
              return Text("$index: ${user.name}");
            }),
            UsersCurvedBlackContainer(
              controller: controller,
            ),
            const ScoreCurvedContainer(
              color: color,
              textColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}

class UsersCurvedBlackContainer extends StatelessWidget {
  const UsersCurvedBlackContainer({
    super.key,
    required this.controller,
  });
  final UsersController controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 229.sp,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: curvedContainerBorderRadius,
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            20.heightSP,
            Text(
              '6 personas en tu misma ubicación',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
                color: Colors.white,
              ),
            ),
            20.heightSP,
            UsersListHorizontal(
              users: controller.users,
            ),
            30.heightSP,
          ],
        ),
      ),
    );
  }
}

class UsersListHorizontal extends StatelessWidget {
  const UsersListHorizontal({
    super.key,
    required this.users,
  });
  final RxList<UsersModel> users;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          width: double.infinity,
          height: 85.sp,
          child: ListView.builder(
            itemCount: users.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var user = users[index];
              return Container(
                margin: EdgeInsets.only(left: index == 0 ? 30.sp : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UserAvatar(image: user.image),
                    5.heightSP,
                    SizedBox(
                      width: 40,
                      child: Text(
                        user.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Colors.white.withOpacity(0.7)),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        border: Border.all(
          width: 2.sp,
          color: avatarBorder,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      height: 40.sp,
      width: 40.sp,
      child: Image.network(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
}
