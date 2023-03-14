import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passdi_app/utils/colors.dart';

class SearchSelectDialog extends StatefulWidget {
  final List<dynamic> items;
  final String? selectedItemId;
  final void Function(String?)? onChanged;
  final String? searchHintText;

  const SearchSelectDialog({
    Key? key,
    required this.items,
    required this.selectedItemId,
    this.onChanged,
    this.searchHintText,
  }) : super(key: key);
  @override
  State<SearchSelectDialog> createState() => _SearchSelectDialogState();
}

class _SearchSelectDialogState extends State<SearchSelectDialog> {
  List<dynamic> tempItems = [];

  int? groupValue;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.items.length > 2)
            AppTextField(
              textFieldType: TextFieldType.NAME,
              decoration: InputDecoration(
                  hintText: widget.searchHintText ?? 'Buscar',
                  hintStyle: primaryTextStyle(color: Colors.black45)),
              onChanged: (String value) {
                tempItems = widget.items.where(
                  (p0) {
                    return (p0.name as String)
                        .toLowerCase()
                        .contains(value.toLowerCase());
                  },
                ).toList();
                setState(() {});
              },
            ),
        ],
      ),
      children: [
        Column(
          children: <Widget>[
            ...tempItems.map((item) {
              return RadioListTile(
                activeColor: completed,
                groupValue: groupValue,
                value: item.id,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: primaryTextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                controlAffinity: ListTileControlAffinity.platform,
                onChanged: (value) {
                  groupValue = value;
                  widget.onChanged?.call(value.toString());
                  setState(() {});
                  Get.back();
                  // Get.back();
                },
              );
            })
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    tempItems.addAll(widget.items);
    groupValue = int.tryParse(widget.selectedItemId ?? '');
  }
}
