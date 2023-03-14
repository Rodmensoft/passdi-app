import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomDropdownButton extends StatelessWidget {
  final String? value;

  final List<dynamic> items;
  final void Function(String?)? onChanged;
  final String hintText;
  const CustomDropdownButton({
    super.key,
    required this.value,
    required this.items,
    this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String?>(
      // itemHeight: 49,
      isDense: true,
      value: value,
      isExpanded: true,
      style: primaryTextStyle(fontStyle: FontStyle.italic),
      hint: Text(
        hintText,
        style: primaryTextStyle(color: Colors.black45),
      ),

      validator: (value) {
        if (value == null) {
          return 'Este campo es requerido';
        }
        return null;
      },
      items: items
          .map(
            (dynamic e) => DropdownMenuItem<String?>(
              value: e.id.toString(),
              child: Text(
                e.name,
                style: primaryTextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
