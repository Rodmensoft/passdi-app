import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

class OnBoardingCard extends StatelessWidget {
  const OnBoardingCard({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 520.sp,
      width: 323.sp,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            url,
          ),
          alignment: Alignment.center,
          // repeat: ImageRepeat.repeat,
          fit: BoxFit.cover,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 2),
            color: Theme.of(context).copyWith().primaryColor.withOpacity(0.1),
          ),
        ],
        borderRadius: BorderRadius.all(radiusCircular(20)),
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.white, shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(1, 1),
            blurRadius: 10,
          ),
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Lorem Ipsum',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30.sp,
              ),
            ),
            Text(
              'Lorem Ipsum is ismply dummy text of the printing and typesetting i',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            50.height,
          ],
        ),
      ),
    );
  }
}
