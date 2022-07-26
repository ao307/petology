
import 'package:doctor_care/modules/home_screen/about_widgets/second_in_home.dart';
import 'package:doctor_care/modules/home_screen/catigories_widgets/third_in_home.dart';
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

import '../../../shared/cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

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
                    children: [
                      FirstInHomeTop(
                        title: 'Not only people \n need a house',
                        subtitle:
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy.",
                        onPress: () {},
                      ),
                       SecondInHome(
                        key: cubit(context).aboutKey,
                        title: "About Petology",
                        subtitle: """
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea.""",
                      ),
                       ThirdInHome(
                        key: cubit(context).categoryKey,
                        title: "Lets get this right ....",
                        subtitle: "What kind of friend you looking for?",
                      ),
                      const OFLForHouse(),
                      const HTCFriends(
                        title: "How to care for your friends",
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
