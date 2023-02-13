import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'onboarding_card.dart';

class OnBoardinCarousel extends StatelessWidget {
  const OnBoardinCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        height: 560.sp,
        slideIndicator: CircularSlideIndicator(
          indicatorRadius: 4.r,
          itemSpacing: 15.sp,
          alignment: Alignment.bottomCenter,
          currentIndicatorColor: Colors.black,
        ),
        floatingIndicator: true,
        showIndicator: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        enableInfiniteScroll: true,
        autoPlay: true,
        disableCenter: true,
        indicatorMargin: 18.sp,
      ),
      items: [
        'https://picsum.photos/id/302/323/520',
        'https://picsum.photos/id/238/323/520',
        'https://picsum.photos/id/239/323/520'
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              children: [
                Center(child: OnBoardingCard(url: i)),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
