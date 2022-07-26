import 'package:doctor_care/modules/auth/login_screen/login_body.dart';
import 'package:doctor_care/modules/home_screen/home_screen.dart';
import 'package:doctor_care/shared/components/main_component/appbar_pets.dart';
import 'package:doctor_care/shared/components/main_component/footer_pets.dart';
import 'package:doctor_care/shared/components/responsive.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/cubit/cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          navigateAndFinish(context: context, widget: HomeScreen());
        }
      },
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
            desktop: Stack(
              children: [
                Column(
                  children: [
                    const AppBarOfPets(),
                    Expanded(
                      child: ListView(
                        children:  const [
                          LoginBody(),
                          SizedBox(height: 150,),
                          FooterPets(),
                        ],
                      ),
                    ),
                  ],
                ),
                if(state is AuthLoadingState)
                  const LoadingScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
