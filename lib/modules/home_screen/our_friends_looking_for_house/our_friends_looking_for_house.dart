import 'package:doctor_care/modules/home_screen/catigories_widgets/item_of_animal.dart';
import 'package:doctor_care/modules/home_screen/our_friends_looking_for_house/carousel_slider_widget.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OFLForHouse extends StatelessWidget {
  const OFLForHouse({
    Key? key,
    this.title,
    this.subtitle,
    this.onPress,
  }) : super(key: key);
  final String? title;
  final String? subtitle;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            'our friends who\n looking for a house'.tr().toCapitalized(),
            style: const TextStyle(
              fontSize: 60.0,
              fontWeight: FontWeight.w700,
              height: 1,
              color: Color(0xFF492F24),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          CarouselSliderWidget(
            widgets: List.generate(10, (index) => ItemOfCarouselAnimal(
              imageLink: 'assets/image/main_images/dog_in_home.png',
              title: 'Dog',
              onPress: () {},
            ),),
          ),
        ],
      ),
    );
  }
}
