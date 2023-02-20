import 'package:intl/intl.dart';

String formatDateBirthdate(DateTime dateTime) {
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDate;
}
