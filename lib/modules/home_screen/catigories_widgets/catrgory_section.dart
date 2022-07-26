import 'package:doctor_care/modules/home_screen/catigories_widgets/card_of_catigories.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.c5Color.withOpacity(.2),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 50,
      ),
      child: Column(
        children: [
          Text(
            '$title'.tr().toCapitalized(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 70.0,
              fontWeight: FontWeight.w700,
              height: 1,
              color: Color(0xFF492F24),
            ),
          ),
          Text(
            '$subtitle'.tr().toCapitalized(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 66.0,
              color: Color(0xFF492F24),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ItemOfThirdHomeTop(
                svgCode: dogCategories,
                title: 'dog',
              ),
              SizedBox(width: 150),
              ItemOfThirdHomeTop(
                svgCode: catCategories,
                title: 'cat',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
