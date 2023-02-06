import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension IntExtensions on int? {
  /// Validate given int is not null and returns given value if null.
  int validate({int value = 0}) {
    return this ?? value;
  }

  /// Leaves given height of space
  Widget get heightSP => SizedBox(height: this?.toDouble().sp);
  Widget get widthSP => SizedBox(width: this?.toDouble().sp);
  Widget get squareSP => SizedBox(
        width: this?.toDouble().sp,
        height: this?.toDouble(),
      );
}
