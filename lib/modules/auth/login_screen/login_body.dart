import 'package:doctor_care/modules/auth/login_screen/login_screen.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
   const LoginBody({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/image/main_images/footer_dog.png",
          scale: 2.5,
        ),
        Container(
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
            key: cubit(context).formKeyLogin,
            child: Column(
              children: [
                Text(
                  'login'.tr().toCapitalized(),
                  style: const TextStyle(
                    height: 1,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                // email
                RoundedTextFormFieldPets(
                  hintText: 'email',
                  textEditingFormField: cubit(context).emailLogin,
                  validator: (value) {
                    return validateEmail(value);
                  },
                ),
                // password
                RoundedTextFormFieldPets(
                  hintText: 'password',
                  textEditingFormField: cubit(context).passwordLogin,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter password'.tr().toCapitalized();
                    } else if (value.length < 6) {
                      return 'password must be at least 6 characters'
                          .tr()
                          .toCapitalized();
                    }
                    return null;
                  },
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // login button
                SizedBox(
                  width: double.infinity,
                  height: screenH(context) * 0.068,
                  child: OutlinedButtonPets(
                    text: 'login'.tr().toCapitalized(),
                    onPressed: () {
                      if (cubit(context).formKeyLogin.currentState!.validate()) {
                        cubit(context).loginFun();
                      }
                    },
                    backColor: MyColors.cPrimary,
                    txtColor: MyColors.cThirdColor,
                  ),
                ),
                // forgot password button
                TxtBtn(
                  text: 'forget password?'.tr().toCapitalized(),
                  onPressed: () {},
                ),
                const RowWithCenterTxt(text: 'or'),
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
                 TextRichBtn(
                  text1: "don't have an account?",
                  text2: "sign up",
                  onPressed: () {
                    navigateAndFinish(context: context, widget: LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
