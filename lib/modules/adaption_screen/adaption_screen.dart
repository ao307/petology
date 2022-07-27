import 'package:doctor_care/modules/adaption_screen/adaption_dropdown_item.dart';
import 'package:doctor_care/modules/adaption_screen/grid_view_widget_adaption.dart';
import 'package:doctor_care/shared/components/main_component/appbar_pets.dart';
// ignore: unused_import
import 'package:doctor_care/shared/components/main_component/dropdown_menu_list.dart';
import 'package:doctor_care/shared/components/main_component/footer_pets.dart';
import 'package:doctor_care/shared/components/responsive.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/cubit/cubit.dart';

class AdaptionScreen extends StatelessWidget {
  AdaptionScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

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
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:50),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AdaptionDropDownItem(
                                  title: 'Вид питомца',
                                  items: const ['Кот', 'Собака'],
                                  controller: TextEditingController(),
                                ),
                                AdaptionDropDownItem(
                                  title: 'Вид питомца',
                                  items: const ['Кот', 'Собака'],
                                  controller: TextEditingController(),
                                ),
                                AdaptionDropDownItem(
                                  title: 'Вид питомца',
                                  items: const ['Кот', 'Собака'],
                                  controller: TextEditingController(),
                                ),
                                AdaptionDropDownItem(
                                  title: 'Вид питомца',
                                  items: const ['Кот', 'Собака'],
                                  controller: TextEditingController(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AdaptionDropDownItem(
                                  title: 'Вид питомца',
                                  items: const ['Кот', 'Собака'],
                                  controller: TextEditingController(),
                                ),
                                AdaptionDropDownItem(
                                  title: 'Вид питомца',
                                  items: const ['Кот', 'Собака'],
                                  controller: TextEditingController(),
                                ),
                                AdaptionDropDownItem(
                                  title: 'Вид питомца',
                                  items: const ['Кот', 'Собака'],
                                  controller: TextEditingController(),
                                ),
                                AdaptionDropDownItem(
                                  title: 'Вид питомца',
                                  items: const ['Кот', 'Собака'],
                                  controller: TextEditingController(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const GVAdaption(),
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
