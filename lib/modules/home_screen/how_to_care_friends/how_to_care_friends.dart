import 'package:doctor_care/modules/home_screen/catigories_widgets/card_of_catigories.dart';
import 'package:doctor_care/modules/home_screen/how_to_care_friends/care_items_in_home.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HTCFriends extends StatelessWidget {
  const HTCFriends({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

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
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
              height: 1,
              color: Color(0xFF492F24),
            ),
          ),
          const SizedBox(height: 50),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 50,
            children: List.generate(9, (index) => CIIHome(
              title: '$index',
              imageLink: 'assets/image/main_images/dog_in_home.png',
            ),
            ),
          ),
        ],
      ),
    );
  }
}
