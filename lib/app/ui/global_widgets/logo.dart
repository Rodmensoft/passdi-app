import 'package:passdi_app/app/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.size,
    this.blur = true,
    this.border = true,
    this.shadow = true,
  });
  final double? size;
  final bool blur;
  final bool border;
  final bool shadow;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          boxShadow: shadow
              ? [
                  BoxShadow(
                    offset: Offset(0, 2.sp),
                    blurRadius: blur ? 10.r : 0,
                    spreadRadius: blur ? 10.r : 0,
                    color: const Color(0xffe5e5e5),
                  ),
                ]
              : null,
          border: border
              ? Border.all(
                  color: Colors.white,
                  width: 3.sp,
                  strokeAlign: BorderSide.strokeAlignOutside)
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0.sp),
          child: Image.asset(
            Assets.assetsMiscMiscLogo,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
