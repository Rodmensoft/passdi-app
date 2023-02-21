import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CustomCenteredCicularProgressInd extends StatelessWidget {
  const CustomCenteredCicularProgressInd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: completed,
      ),
    );
  }
}
