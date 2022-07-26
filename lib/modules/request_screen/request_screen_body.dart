import 'package:doctor_care/shared/components/main_component/dropdown_menu_list.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RequestScreenBody extends StatelessWidget {
  const RequestScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenW(context) * 0.32,
          vertical: screenH(context) * 0.05,),
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
          //top title text
          Text(
            'request'.tr().toCapitalized(),
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
          //name
          RoundedTextFormFieldPets(
            textEditingFormField: TextEditingController(),
            hintText: "name",
          ),
          // category
          CustomDropdownExample(
            items: const [
              'Cat',
              'Dog',
            ],
            errorText: 'select category',
            hintText: 'category',
            jobRoleCtrl: TextEditingController(),
          ),
          const SizedBox(height: 20),
          // TODO: year and month dropdown
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDropdownExample(
                    items: const [
                      'Cat',
                      'Dog',
                    ],
                    errorText: 'select category',
                    hintText: 'year',
                    jobRoleCtrl: TextEditingController(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomDropdownExample(
                    items: const [
                      'Cat',
                      'Dog',
                    ],
                    errorText:  'select category',
                    hintText: 'months',
                    jobRoleCtrl: TextEditingController(),
                  ),
                ),
              ],
            ),
          ),
          // TODO: size and breed dropdown
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDropdownExample(
                    items: const [
                      'Cat',
                      'Dog',
                    ],
                    errorText: 'select category',
                    hintText: 'size',
                    jobRoleCtrl: TextEditingController(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomDropdownExample(
                    items: const [
                      'Cat',
                      'Dog',
                    ],
                    errorText: 'select category',
                    hintText: 'breed',
                    jobRoleCtrl: TextEditingController(),
                  ),
                ),
              ],
            ),
          ),
          // TODO: hair length and care & behavior dropdown
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDropdownExample(
                    items: const [
                      'Cat',
                      'Dog',
                    ],
                    errorText: 'select category',
                    hintText: 'hair length',
                    jobRoleCtrl: TextEditingController(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomDropdownExample(
                    items: const [
                      'Cat',
                      'Dog',
                    ],
                    errorText: 'select category',
                    hintText: 'care & behavior',
                    jobRoleCtrl: TextEditingController(),
                  ),
                ),
              ],
            ),
          ),
          // TODO: house trained and color dropdown
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDropdownExample(
                    items: const [
                      'Cat',
                      'Dog',
                    ],
                      errorText: 'select category',
                    hintText: 'house trained',
                    jobRoleCtrl: TextEditingController(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomDropdownExample(
                    items: const [
                      'Cat',
                      'Dog',
                    ],
                    errorText: 'select category',
                    hintText: 'color',
                    jobRoleCtrl: TextEditingController(),
                  ),
                ),
              ],
            ),
          ),
          //location
          const TitleTFF(
            title: 'detect your current location',
            hint: "location",
            onlyRead: true,
            suffixIcon: Icon(Icons.location_on, color: MyColors.cMainColor),
          ),
          const SizedBox(height: 20),
          //phone number
          RoundedTextFormFieldPets(
            textEditingFormField: TextEditingController(),
            hintText: "phone number",
            validator: (value) {
              return validateMobile(value!);
            },
          ),
          const SizedBox(height: 10),
          // description
          RoundedTextFormFieldPets(
            textEditingFormField: TextEditingController(),
            hintText: "description",
            maxLine: 6,
          ),
          const SizedBox(height: 10),
          //send button
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
        ],
      ),
    );
  }
}
