import 'package:doctor_care/modules/help_screen/help_your_friend.dart';
import 'package:doctor_care/modules/home_screen/about_widgets/second_in_home.dart';
import 'package:doctor_care/modules/home_screen/catigories_widgets/catrgory_section.dart';
import 'package:doctor_care/modules/home_screen/first_in_home_top/first_in_home_top.dart';
import 'package:doctor_care/modules/home_screen/how_to_care_friends/how_to_care_friends.dart';
import 'package:doctor_care/modules/home_screen/our_friends_looking_for_house/our_friends_looking_for_house.dart';
import 'package:doctor_care/shared/components/main_component/appbar_pets.dart';
import 'package:doctor_care/shared/components/main_component/footer_pets.dart';
import 'package:doctor_care/shared/components/responsive.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../shared/cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cubit(context).getHome(),
        builder: (context, snapshot) {
          return BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (BuildContext context, Object? state) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  state is HomeStaticLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is HomeStaticErrorState) {
                return Center(
                  child: Text(state.error),
                );
              }
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
                        child: ScrollablePositionedList.builder(
                          itemBuilder: (context, index) => [
                            FirstInHomeTop(
                              title:
                                  '${cubit(context).firstSectionModel!.title}',
                              subtitle:
                                  '${cubit(context).firstSectionModel!.body}',
                              onPress: () {
                                navigateTo(context: context, widget: HelpYourFriendScreen());
                              },
                            ),
                            SecondInHome(
                              title: "${cubit(context).aboutSectionModel!.title}",
                              subtitle:
                                  "${cubit(context).aboutSectionModel!.body}",
                              onPress: () {},
                            ), //1
                            const CategorySection(
                              title: "Lets get this right ....",
                              subtitle: "What kind of friend you looking for?",
                            ), //2
                            const OFLForHouse(),
                            HTCFriends(
                              title: "How to care for your friends",
                              howToCareFriendsList: cubit(context).howToCareFriendsList,
                            ),
                            const FooterPets(),
                          ].elementAt(index),
                          itemCount: 6,
                          itemScrollController:
                              cubit(context).itemScrollController,
                          itemPositionsListener:
                              cubit(context).itemPositionsListener,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
    );
  }
}
