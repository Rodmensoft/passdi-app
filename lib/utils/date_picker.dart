import 'package:app_viajeros/utils/colors.dart';
import 'package:flutter/material.dart';

Future<DateTime?> customDatePicker(BuildContext context) async {
  final DateTime now = DateTime.now();

  //Solo para mayores de 18 años
  DateTime dateTime = DateTime(now.year - 18, now.month, now.day);

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    locale: const Locale('es', 'PE'),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light().copyWith(
            primary: primaryColor,
          ),
        ),
        child: child!,
      );
    },
    initialDate: dateTime,
    firstDate: DateTime(now.year - 120),
    lastDate: dateTime,
  );

  return selectedDate;
}
