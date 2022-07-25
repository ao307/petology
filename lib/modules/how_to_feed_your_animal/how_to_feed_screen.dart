import 'package:doctor_care/shared/components/main_component/appbar_pets.dart';
import 'package:doctor_care/shared/components/main_component/footer_pets.dart';
import 'package:doctor_care/shared/components/responsive.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/cubit/cubit.dart';

class HowToFeedScreen extends StatelessWidget {
  const HowToFeedScreen({Key? key}) : super(key: key);

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
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/image/main_images/dryfood.png",
                              height: screenH(context) * .4,
                            ),
                            Image.asset(
                              "assets/image/main_images/plate.png",
                              height: screenH(context) * .2,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'how you feed Your Dog?'.tr().toCapitalized(),
                              style: const TextStyle(
                                fontSize: 70.0,
                                color: Color(0xFF492F24),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'As a general rule, puppies and young dogs burn more calories, so they need a greater quantity of food that is higher in protein and fat. Older, less active dogs require fewer calories to remain healthy.\n\nRichard H. Pitcairn, DVM, PhD, author of Dr. Pitcairn’s Complete Guide to Natural Health for Dogs and Cats, believes the most reliable approach is to feed what seems to be a reasonable amount and monitor his body weight.\n\n“You should be able to feel your pet’s ribs easily as you slide your hand over his sides,” Pitcairn says. “If you can’t, he’s probably too heavy, so begin to feed a smaller quantity. If you’re using a commercial pet food, beware of the “feeding guidelines” on the bag or box. It lists different weights and the corresponding amount of food to feed your dog to maintain that weight, and should be used only as a rough guideline.  Many dogs are overweight because their families closely followed the directions on the label, which often indicates portion sizes that are too large. After all, the sooner the bag is empty, the sooner you will need to buy more food.  Starting at the low end of the suggested guidelines and then monitoring your dog for hunger and body condition is a good way to proceed.  Different Portions for Different Pooches  Though it may sound counterintuitive, as a general rule, large breed dogs require less food and small breed dogs require more food when expressed on a volume of food per pound of body weight. The food requirements of individual dogs vary according to their health, level of activity, and age. ”'.tr().toCapitalized(),
                              style: TextStyle(
                                fontSize: 40.0,
                                color:
                                    const Color(0xFF492F24).withOpacity(0.95),
                                height: 1.56,
                              ),
                            ),
                          ],
                        ),
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
