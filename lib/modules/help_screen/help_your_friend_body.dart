import 'package:doctor_care/shared/components/main_component/dropdown_menu_list.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HelpYourFriendBody extends StatelessWidget {
  const HelpYourFriendBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenW(context) * 0.32, vertical: screenH(context) * 0.05),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(88.0),
        border: Border.all(
          width: 1.5,
          color: MyColors.c6Color,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          Text(
            'help your friend'.tr().toCapitalized(),
            style: const TextStyle(
              height: 1,
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: SVGString(
              cameraSvg,
              width: 100,
            ),
          ),
          CustomDropdownExample(
            items:const ['Cat', 'Dog',],
            hintText: 'category',
            jobRoleCtrl: TextEditingController(),
          ),
          const SizedBox(height: 20),
          const TitleTFF(
            title: 'detect your current location',
            hint: "location",
            onlyRead: true,
            suffixIcon: Icon(Icons.location_on, color: MyColors.cMainColor),
          ),
          const SizedBox(height: 20),
          RoundedTextFormFieldPets(
            textFormField: TextEditingController(),
            hintText: "phone number",
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: screenH(context) * 0.08,
            child: OutlinedButtonPets(
              text: 'send'.tr().toCapitalized(),
              onPressed: () {},
              backColor: MyColors.cPrimary,
              txtColor: MyColors.cThirdColor,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: screenH(context) * 0.08,
            child: OutlinedButtonPets(
              text: 'call'.tr().toCapitalized(),
              onPressed: () {},
              backColor: MyColors.cThirdColor,

            ),
          ),
        ],
      ),
    );
  }
}
