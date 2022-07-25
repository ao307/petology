import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/cubit/cubit.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FooterPets extends StatelessWidget {
  const FooterPets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (BuildContext context, Object? state) {
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.98, 0.39),
                  end: Alignment(0.98, 0.49),
                  colors: [Color(0xFF56392D), Color(0xFF110B09)],
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FooterItems(
                          topTitle: 'for any questions'.tr().toCapitalized(),
                          icon1: emailSvg,
                          title1: 'email@gmail.com'.tr().toCapitalized(),
                          icon2: phoneSvg,
                          title2: '+966 544 544 544'.tr().toCapitalized(),
                        ),
                        FooterItems(
                          topTitle: 'we are waiting you'.tr().toCapitalized(),
                          icon1: phoneSvg,
                          title1: 'First settlement/Cairo'.tr().toCapitalized(),
                          icon2: locationSvg,
                          title2: 'First settlement/Cairo'.tr().toCapitalized(),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/image/main_images/footer_dog.png",
                    scale: 2.5,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/image/main_images/footer_dog.png",
              width: 250,
            ),
          ],
        );
      },
    );
  }
}

class FooterItems extends StatelessWidget {
  const FooterItems({
    Key? key,
    required this.icon1,
    required this.icon2,
    required this.title1,
    required this.title2,
    required this.topTitle,
  }) : super(key: key);
  final String? topTitle;
  final String? icon1;
  final String? title1;
  final String? icon2;
  final String? title2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$topTitle'.tr().toCapitalized(),
            style: const TextStyle(
              fontSize: 36.0,
              color: MyColors.cThirdColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: ListTile(
              leading: SVGString(icon1, width: 40),
              title: Text(
                '$title1'.tr().toCapitalized(),
                style: const TextStyle(
                  fontSize: 20.0,
                  color: MyColors.cThirdColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: ListTile(
              leading: SVGString(icon2, width: 40),
              title: Text(
                '$title2'.tr().toCapitalized(),
                style: const TextStyle(
                  fontSize: 20.0,
                  color: MyColors.cThirdColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
