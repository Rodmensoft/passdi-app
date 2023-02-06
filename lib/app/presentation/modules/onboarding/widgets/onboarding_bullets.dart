import 'package:flutter/material.dart';

class OnBoardingBullets extends StatelessWidget {
  const OnBoardingBullets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...[true, false, false].map(
          (e) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: e
                  ? Theme.of(context).copyWith().primaryColor
                  : const Color(0xffD1D1D1),
            ),
          ),
        ),
      ],
    );
  }
}
