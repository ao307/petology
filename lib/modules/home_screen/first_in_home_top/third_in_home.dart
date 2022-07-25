import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ThirdInHome extends StatelessWidget {
  const ThirdInHome({
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
        vertical: 100,
      ),
      child: Column(
        children: [
          Text(
            '$title'.tr().toCapitalized(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 74.0,
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

class ItemOfThirdHomeTop extends StatelessWidget {
  const ItemOfThirdHomeTop(
      {Key? key, this.title, required this.svgCode, this.onPress})
      : super(key: key);
  final String? svgCode;
  final String? title;
  final GestureTapCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          width: 4.0,
          color: const Color(0xFF492F24),
        ),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(30.0),
        hoverColor: const Color(0xFFFFE3C5),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 60,
            vertical: 60,
          ),
          child: Column(
            children: [
              SVGString(
                svgCode,
              ),
              Text(
                '$title'.tr().toCapitalized(),
                style: const TextStyle(
                  fontSize: 46.0,
                  color: Color(0xFF492F24),
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
