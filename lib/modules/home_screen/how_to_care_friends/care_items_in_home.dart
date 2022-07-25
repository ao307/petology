import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CIIHome extends StatelessWidget {
  const CIIHome({Key? key,this.title,this.imageLink}) : super(key: key);
 final String? imageLink;
  final  String? title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          "assets/image/main_images/Ellipse 12.png",
          width: 200,
        ),
        Image.asset(
          "assets/image/main_images/dog_in_home.png",
          width: 140,
        ),
        Text(
          '$title'.tr().toCapitalized(),
          style: const TextStyle(
            height: 11,
            fontSize: 30.0,
            color: MyColors.cThirdColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
