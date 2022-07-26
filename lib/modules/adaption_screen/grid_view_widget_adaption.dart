import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GVAdaption extends StatelessWidget {
  const GVAdaption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(30),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 80,
      ),
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return  Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.c5Color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/main_images/dog_in_home.png",
                width: screenW(context)*.14,
              ),
              const SizedBox(height: 12,),
              Text(
                'Elsa'.tr().toCapitalized(),
                style: const TextStyle(
                  fontSize: 46.0,
                  color: Color(0xFF492F24),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6,),
              SizedBox(
                width: screenW(context)*.2,
                height: 50,
                child: OutlinedButtonPets(
                  onPressed: (){},
                  text: 'read more',
                  backColor: MyColors.cPrimary,
                  txtColor: Colors.white,
                  border: false,
                ),
              ),
              Text(
                'by: ali'.tr().toTitleCase(),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF492F24),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
      shrinkWrap: true,
      itemCount: 6,
    );
  }
}
