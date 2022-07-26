import 'package:doctor_care/modules/request_screen/request_screen_body.dart';
import 'package:doctor_care/shared/components/main_component/appbar_pets.dart';
import 'package:doctor_care/shared/components/main_component/footer_pets.dart';
import 'package:doctor_care/shared/components/responsive.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/cubit/cubit.dart';

class RequestScreen extends StatelessWidget {
  RequestScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
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
            desktop: Column(
              children: [
                const AppBarOfPets(),
                Expanded(
                  child: ListView(
                    children: const [
                      RequestScreenBody(),
                      FooterPets(),
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
