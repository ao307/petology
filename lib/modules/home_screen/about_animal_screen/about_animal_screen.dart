import 'package:doctor_care/models/pets_model.dart';
import 'package:doctor_care/modules/home_screen/about_animal_screen/about_animal_top_images.dart';
import 'package:doctor_care/shared/components/main_component/appbar_pets.dart';
import 'package:doctor_care/shared/components/main_component/footer_pets.dart';
import 'package:doctor_care/shared/components/responsive.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/cubit/cubit.dart';

class AboutAnimalScreen extends StatelessWidget {
  const AboutAnimalScreen({Key? key, this.petsModel}) : super(key: key);
  final PetsModel? petsModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          body: Responsive(
            mobile: Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: const Text('mobile'),
              ),
            ),
            desktop: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarOfPets(),
                Expanded(
                  child: ListView(
                    children: [
                      TopImagesAboutAnimal(images: petsModel!.image),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    "${petsModel!.name}",
                                    style: const TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: "shared by: "
                                              .tr()
                                              .toCapitalized(),
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${petsModel!.user!.firstName} ${petsModel!.user!.firstName}',
                                            )
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {},
                                        child: const SVGString(
                                          phoneSvg,
                                          width: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: MyColors.c5Color.withOpacity(.2),
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    'Adult  Female  Medium  Tabby (Brown / Chocolate)',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: const Color(0xFF492F24)
                                          .withOpacity(0.81),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'about'.tr().toCapitalized(),
                                        style: const TextStyle(
                                          fontSize: 50.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        'HOUSE-TRAINED\nYes\n\nHEALTH\nVaccinations up to date, spayed / neutered.\n\nGOOD IN A HOME WITH\nOther cats.\n\nPREFERS A HOME WITHOUT\nChildren.',
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          color: const Color(0xFF492F24)
                                              .withOpacity(0.95),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: MyColors.c5Color.withOpacity(.2),
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      const SVGString(alarmSvg, width: 40),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          "petfinder recommends that you should always take reasonable security steps before making adabtion."
                                              .tr()
                                              .toCapitalized(),
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            color: const Color(0xFF492F24)
                                                .withOpacity(0.81),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // TODO DESCRIPTION AND ANIMAL NAME
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'meet ${petsModel!.name}'.tr().toTitleCase(),
                                        style: const TextStyle(
                                          fontSize: 50.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '${petsModel!.description}'
                                            .tr()
                                            .toCapitalized(),
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          color: const Color(0xFF492F24)
                                              .withOpacity(0.95),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const FooterPets(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
