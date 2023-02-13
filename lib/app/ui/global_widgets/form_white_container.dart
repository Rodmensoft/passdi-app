import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class FormWhiteCardContainer extends StatelessWidget {
  const FormWhiteCardContainer({
    super.key,
    required this.children,
    required this.height,
    this.visible = true,
  });
  final List<Widget> children;
  final double height;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: EdgeInsets.only(top: 45.sp, left: 35.sp, right: 35.sp),
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: cardColor,
            width: 1.sp,
          ),
        ),
        width: double.infinity,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const Spacer(),
            ...children,
          ],
        ),
      ),
    );
  }
}
