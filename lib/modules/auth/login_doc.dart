import 'package:doctor_care/shared/components/responsive.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {}
      },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          //backgroundColor: MyColors.cPrimary,
          appBar: Responsive.isDesktop(context) == true
              ? AppBar(
                  title: const Text('desktop'),
                )
              : AppBar(
                  title: const Text('mobile'),
                ),
          body: Responsive(
            mobile: Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: const Text('mobile'),
              ),
            ),
            desktop: Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: const Text('desktop'),
              ),
            ),
          ),
        );
      },
    );
  }
}
