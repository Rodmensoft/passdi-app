import 'package:flutter/material.dart';
import 'package:passdi_app/utils/colors.dart';

Future<DateTime?> customDatePicker(
  BuildContext context,
  DateTime? initialDate, {
  DateTime? lastDate,
}) async {
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
    initialDate: initialDate ?? dateTime,
    firstDate: DateTime(now.year - 120),
    lastDate: lastDate ?? dateTime,
  );

  return selectedDate;
}
