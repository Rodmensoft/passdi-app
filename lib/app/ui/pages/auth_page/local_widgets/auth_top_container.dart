import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../assets/assets.dart';
import '../../../global_widgets/logo.dart';

class AuthTopContainer extends StatelessWidget {
  const AuthTopContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomClipLogin(),
          child: Container(
            height: context.height() * 0.5,
            width: double.infinity,
            color: Theme.of(context).copyWith().primaryColor,
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.white,
              ),
              child: SafeArea(
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          40.height,
                          child,
                        ],
                      ),
                    ),
                    const AuthTopImage()
                  ],
                ),
              ),
            ),
          ),
        ),
        const AuthTopLogo(),
      ],
    );
  }
}

class AuthTopLogo extends StatelessWidget {
  const AuthTopLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Logo(size: 90.sp),
          ],
        ),
      ),
    );
  }
}

class AuthTopImage extends StatelessWidget {
  const AuthTopImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 23.sp,
      left: 23.sp,
      child: Image.asset(
        Assets.assetsMiscAuthViajera,
        width: 138.sp,
        height: 267.sp,
        fit: BoxFit.contain,
      ),
    );
  }
}

class CustomClipLogin extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //! ME COSTÓ HACER ESTO JAJAJA
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.95);

    path.cubicTo(
      size.width * 0.6,
      size.height * 0.45,
      size.width * 0.95,
      size.height * 0.45,
      size.width,
      size.height * 0.58,
    );

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
