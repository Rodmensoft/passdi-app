import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import 'custom_cicular_progress_ind.dart';

class FormWhiteCardContainer extends StatelessWidget {
  const FormWhiteCardContainer({
    super.key,
    required this.children,
    this.height,
    this.loading = false,
    this.constraints,
  });
  final List<Widget> children;
  final double? height;
  final bool loading;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      constraints: constraints,
      child: loading
          ? const CustomCenteredCicularProgressInd()
          : FadeIn(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const Spacer(),
                  ...children,
                ],
              ),
            ),
    );
  }
}
