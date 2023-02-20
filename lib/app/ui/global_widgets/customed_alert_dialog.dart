import 'package:app_viajeros/utils/colors.dart';
import 'package:app_viajeros/utils/size_box_int.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

Future<dynamic> customedAlertDialog(String title,
    {String? accept, bool? cancel, String? deny}) {
  return Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
      ),
      actions: <Widget>[
        AppButton(
          color: completed,
          text: accept ?? 'Ok',
          onTap: () => Get.back(result: true),
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            color: Colors.white,
          ),
        ),
        Visibility(
          visible: cancel ?? false,
          child: AppButton(
            color: completed,
            text: deny ?? 'Cancelar',
            onTap: () => Get.back(result: false),
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
