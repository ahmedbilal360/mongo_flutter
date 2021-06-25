import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
class MyDropdown extends StatefulWidget {
  String placeHolder;
  TextEditingController controller;
  List<String> list;
  FocusNode nextNode;
  MyDropdown(
      {required this.placeHolder,
        required this.controller,
        required this.list,
        required this.nextNode,
      });
  @override
  _MyDropdownState createState() => _MyDropdownState();
}
class _MyDropdownState extends State<MyDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DropdownSearch<String>(
        validator: (String? item) {
          if (item == null||item.isEmpty)
            return "Required field";
          else
            return null;
        },
        hint: widget.placeHolder,
        mode: Mode.MENU,
        dropdownSearchDecoration: InputDecoration(
          border:OutlineInputBorder(),
          labelText: widget.placeHolder,
          isDense: true,
          contentPadding: EdgeInsets.all(12),
          hintText: widget.placeHolder,
        ),
        showAsSuffixIcons: true,
        clearButtonBuilder: (_) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Icon(
            Icons.clear,
            size: 24,
            color: Colors.black,
          ),
        ),
        dropdownButtonBuilder: (_) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Icon(
            Icons.arrow_drop_down,
            size: 20,
            color: Colors.black,
          ),
        ),
        showSelectedItem: true,
        items: widget.list,
        label: widget.placeHolder,
        showClearButton: true,
        onChanged: print,
        popupItemDisabled: (String s) => s.startsWith('I'),
        selectedItem: null,
      ),
    );
  }
}