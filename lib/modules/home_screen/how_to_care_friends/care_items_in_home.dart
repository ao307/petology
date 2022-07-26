import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CIIHome extends StatelessWidget {
  const CIIHome({Key? key, this.title, this.imageLink}) : super(key: key);
  final String? imageLink;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/image/main_images/Ellipse 12.png",
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Text(
                '$title'.tr().toCapitalized(),
                style: const TextStyle(
                  fontSize: 25.0,
                  color: MyColors.cThirdColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        CachedNetworkImage(
          width: 90,
          imageUrl: '$imageLink',
        ),
      ],
    );
  }
}
