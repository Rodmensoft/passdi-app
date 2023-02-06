import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class TopBlackContainer extends StatelessWidget {
  const TopBlackContainer({
    super.key,
    required this.child,
    this.height,
    this.bottomSpace,
  });
  final Widget child;
  final double? height;
  final double? bottomSpace;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: radiusOnly(bottomLeft: 80.r),
            color: Theme.of(context).primaryColor,
          ),
          width: double.infinity,
          height: height ?? 300.sp,
          child: SafeArea(
            child: child,
          ),
        ),
        SizedBox(height: bottomSpace ?? 150.sp),
      ],
    );
  }
}
