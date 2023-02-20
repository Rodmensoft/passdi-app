import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final String? value;

  final List<dynamic> items;
  final void Function(String?)? onChanged;
  final String hintText;
  const CustomDropdownButton({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String?>(
      // itemHeight: 49,
      isDense: true,
      value: value,
      isExpanded: true,

      hint: Opacity(
        opacity: 0.5,
        child: Text(
          hintText,
        ),
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
              child: Text(e.name),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
