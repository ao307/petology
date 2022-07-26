import 'package:doctor_care/shared/components/main_component/dropdown_menu_list.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:flutter/material.dart';

class AdaptionDropDownItem extends StatelessWidget {
  const AdaptionDropDownItem({
    Key? key,
    required this.title,
    required this.items,
    required this.controller,
  }) : super(key: key);
  final String? title;
  final TextEditingController? controller;
  final List<String>? items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextOfNav(title: '$title'),
        SizedBox(
          width: 200,
          child: CustomDropdownExample(
            hintText: "",
            errorText: "",
            jobRoleCtrl: TextEditingController(),
            items: items ?? [""],
          ),
        ),
      ],
    );
  }
}
