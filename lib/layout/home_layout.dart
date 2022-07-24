import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/cubit/cubit.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../modules/auth/login_doc.dart';

class HomeLayOut extends StatelessWidget {
  HomeLayOut({Key? key}) : super(key: key);
  final PageController controllerPage = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          // extendBody: true,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controllerPage,
            children: cubit(context).screens,
          ),
          bottomNavigationBar: SizedBox(
            height: screenH(context) * .088,
            child: SlidingClippedNavBar(
              //backgroundColor: Colors.white,
              onButtonPressed: (index) {
                cubit(context).changeIndex(index);
                controllerPage.animateToPage(
                  cubit(context).currentIndex,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad,
                );
              },
              iconSize: 24,
              activeColor: MyColors.cPrimary,
              selectedIndex: cubit(context).currentIndex,
              //inactiveColor: MyColors.cUnSelectedIconLight,
              barItems: [
                BarItem(
                  icon: IconlyBold.home,
                  title: 'Home',
                ),
                BarItem(
                  icon: IconlyBold.home,
                  title: 'Home',
                ),
                BarItem(
                  icon: IconlyBold.home,
                  title: 'Home',
                ),
                BarItem(
                  icon: IconlyBold.home,
                  title: 'Home',
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              navigateAndFinish(context: context, widget: LoginScreen());

            },
          ),
        );
      },
    );
  }
}
