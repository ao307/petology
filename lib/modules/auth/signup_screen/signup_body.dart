import 'package:doctor_care/shared/components/constants.dart';
import 'package:doctor_care/shared/components/main_component/dropdown_menu_list.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenW(context) * 0.32),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(88.0),
        border: Border.all(
          width: 1.5,
          color: MyColors.c6Color,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Form(
        key: cubit(context).formKeySignUp,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'sign up'.tr().toCapitalized(),
                style: const TextStyle(
                  height: 1,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SocialBtn(
                    text: 'facebook',
                    onPressed: () {},
                    svgCode: facebookSvg,
                    backColor: const Color(0xFF4267B2),
                    txtColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: SocialBtn(
                    text: 'google',
                    onPressed: () {},
                    assetImage: "assets/image/main_images/google-symbol.png",
                  ),
                ),
              ],
            ),
            const RowWithCenterTxt(text: 'or'),
            const SizedBox(
              height: 20.0,
            ),
            RoundedTextFormFieldPets(
              hintText: 'first name',
              textFormField: cubit(context).firstNameSignUp,
              validator: (value) {
                return validateName(value);
              },
            ),
            RoundedTextFormFieldPets(
              hintText: 'last name',
              textFormField: cubit(context).lastNameSignUp,
              validator: (value) {
                return validateName(value);
              },
            ),
            RoundedTextFormFieldPets(
              hintText: 'email',
              textFormField: cubit(context).emailSignUp,
              validator: (value) {
                return validateEmail(value);
              },
            ),
            RoundedTextFormFieldPets(
              hintText: 'password',
              textFormField: cubit(context).passwordSignUp,
              validator: (value) {
                return validatePassword(value);
              },
              isPassword: true,
            ),
            RoundedTextFormFieldPets(
              hintText: 're-enter password',
              textFormField: cubit(context).reWritePasswordSignUp,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'enter password'.tr().toCapitalized();
                } else if (cubit(context).reWritePasswordSignUp.text !=
                    cubit(context).passwordSignUp.text) {
                  return 'password does not match'.tr().toCapitalized();
                }
                return null;
              },
              isPassword: true,
            ),
            // country
            CustomDropdownExample(
              items: countriesShortNamesList,
              jobRoleCtrl: cubit(context).countrySignUp,
              hintText: 'country',
              onChanged: (value) {
                printFullText(cubit(context).countrySignUp.text);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              height: screenH(context) * 0.068,
              child: OutlinedButtonPets(
                text: 'sign up'.tr().toCapitalized(),
                onPressed: () {
                  if(cubit(context).formKeySignUp.currentState!.validate()){
                  }
                },
                backColor: MyColors.cPrimary,
                txtColor: MyColors.cThirdColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: TextRichBtn(
                text1: "already have an account?",
                text2: "login",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
