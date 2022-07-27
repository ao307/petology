import 'package:doctor_care/modules/adaption_screen/adaption_dropdown_item.dart';
import 'package:doctor_care/modules/adaption_screen/grid_view_widget_adaption.dart';
import 'package:doctor_care/shared/components/main_component/appbar_pets.dart';

// ignore: unused_import
import 'package:doctor_care/shared/components/main_component/dropdown_menu_list.dart';
import 'package:doctor_care/shared/components/main_component/footer_pets.dart';
import 'package:doctor_care/shared/components/responsive.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/cubit/cubit.dart';

class AdaptionScreen extends StatelessWidget {
  AdaptionScreen({
    Key? key,
    this.filterCategoryId,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final int? filterCategoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cubit(context).getFilterDropdowns(filterCategoryId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
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
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AdaptionDropDownItem(
                                        title: 'breed',
                                        items: cubit(context)
                                                .filtersModel!
                                                .breed ??
                                            [],
                                        controller: TextEditingController(),
                                      ),
                                      AdaptionDropDownItem(
                                        title: 'age',
                                        items:
                                            cubit(context).filtersModel!.ages ??
                                                [],
                                        controller: TextEditingController(),
                                      ),
                                      AdaptionDropDownItem(
                                        title: 'size',
                                        items:
                                            cubit(context).filtersModel!.size ??
                                                [],
                                        controller: TextEditingController(),
                                      ),
                                      AdaptionDropDownItem(
                                        title: 'good with',
                                        items: cubit(context)
                                                .filtersModel!
                                                .goodWith ??
                                            [],
                                        controller: TextEditingController(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AdaptionDropDownItem(
                                        title: 'gender',
                                        items: const ['Male', "Female"],
                                        controller: TextEditingController(),
                                      ),
                                      AdaptionDropDownItem(
                                        title: 'color',
                                        items: cubit(context)
                                                .filtersModel!
                                                .colors ??
                                            [],
                                        controller: TextEditingController(),
                                      ),
                                      AdaptionDropDownItem(
                                        title: 'hair length',
                                        items: cubit(context)
                                                .filtersModel!
                                                .hairLength ??
                                            [],
                                        controller: TextEditingController(),
                                      ),
                                      AdaptionDropDownItem(
                                        title: 'care & behavior',
                                        items: cubit(context)
                                                .filtersModel!
                                                .behaviour ??
                                            [],
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
                            GVAdaption(
                              petsModel: cubit(context).petsModel,
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
        });
  }
}
