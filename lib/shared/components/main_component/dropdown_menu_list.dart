// drop down menu list example with bloc
// https://medium.com/flutter-community/flutter-dropdown-menu-list-example-with-bloc-c6b8f8f8f9f4

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDropdownExample extends StatefulWidget {
  const CustomDropdownExample({
    Key? key,
    required this.items,
    required this.hintText,
    required this.jobRoleCtrl,
    required this.errorText,
    this.onChanged,
  }) : super(key: key);
  final List<String> items;
  final TextEditingController jobRoleCtrl;
  final Function(String)? onChanged;
  final String hintText;
  final String errorText;


  @override
  _CustomDropdownExampleState createState() => _CustomDropdownExampleState();
}

class _CustomDropdownExampleState extends State<CustomDropdownExample> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: CustomDropdown(
        hintText: widget.hintText.tr().toCapitalized(),
        items: widget.items,
        controller: widget.jobRoleCtrl,
        borderRadius: BorderRadius.circular(30),
        hintStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700, color: MyColors.c5Color,
        ),
        borderSide: BorderSide.none,
        onChanged: widget.onChanged,
        errorText:widget.errorText.tr().toCapitalized(),
        errorBorderSide: BorderSide.none,
      ),
    );
  }
}
