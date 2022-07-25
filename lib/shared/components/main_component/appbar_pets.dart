import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/cubit/cubit.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AppBarOfPets extends StatelessWidget {
  const AppBarOfPets({Key? key, this.login = true}) : super(key: key);

  final bool? login;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (BuildContext context, Object? state) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.98, 0.39),
              end: Alignment(0.98, 0.49),
              colors: [Color(0xFF56392D), Color(0xFF110B09)],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/image/logo/bar.png"),
              Row(
                children: cubit(context).buttonsTitleList,
              ),
              if (login == true)
                const ButtonsOfAuthInBarLogin()
              else
                const ButtonsOfAuthInBarSignUp(),
            ],
          ),
        );
      },
    );
  }
}

class ButtonsOfAuthInBarLogin extends StatelessWidget {
  const ButtonsOfAuthInBarLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButtonPets(
          onPressed: () {},
          text: 'sign up',
          backColor: Colors.transparent,
          txtColor: Colors.white,
        ),
        const SizedBox(
          width: 20,
        ),
        OutlinedButtonPets(
          onPressed: () {},
          text: 'login',
        ),
      ],
    );
  }
}

class ButtonsOfAuthInBarSignUp extends StatelessWidget {
  const ButtonsOfAuthInBarSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButtonPets(
          onPressed: () {},
          text: 'sign up',
        ),
        const SizedBox(
          width: 20,
        ),
        OutlinedButtonPets(
          onPressed: () {},
          text: 'login',
          backColor: Colors.transparent,
          txtColor: Colors.white,
        ),
      ],
    );
  }
}
