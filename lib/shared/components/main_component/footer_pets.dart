import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/cubit/cubit.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

//TODO: Footer OF PETS
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
                        // first column
                        FooterItems(
                          topTitle: 'for any questions'.tr().toCapitalized(),
                          icon1: emailSvg,
                          title1: '${cubit(context).footerModel!.email}'
                              .tr()
                              .toCapitalized(),
                          onTap1: () => launch(
                            'mailto:${cubit(context).footerModel!.email}',
                          ),
                          icon2: phoneSvg,
                          title2: '${cubit(context).footerModel!.phone}'
                              .tr()
                              .toCapitalized(),
                          onTap2: () => launch(
                            'tel:${cubit(context).footerModel!.phone}',
                          ),
                        ),
                        // second column
                        FooterItems(
                          topTitle: 'we are waiting you'.tr().toCapitalized(),
                          icon1: phoneSvg,
                          title1: '${cubit(context).footerModel!.location}'
                              .tr()
                              .toCapitalized(),
                          icon2: locationSvg,
                          title2: '${cubit(context).footerModel!.location2}'
                              .tr()
                              .toCapitalized(),
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
    this.onTap1,
    required this.title2,
    this.onTap2,
    required this.topTitle,
  }) : super(key: key);
  final String? topTitle;
  final String? icon1;
  final String? title1;
  final String? icon2;
  final String? title2;
  final GestureTapCallback? onTap1;
  final GestureTapCallback? onTap2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top title
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
          // first item
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: InkWell(
              onTap: onTap1,
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
          ),
          // second item
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: InkWell(
              onTap: onTap2,
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
          ),
        ],
      ),
    );
  }
}
