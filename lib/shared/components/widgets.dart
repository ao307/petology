import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/cubit/cubit.dart';
import 'package:doctor_care/shared/cubit/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/colors.dart';

//for all screens
class TitleTFF extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? hint;
  final Function()? onTap;
  final ValueChanged? onEditingSubmitted;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final FormFieldValidator? validator;
  final bool? onlyRead;
  final int? maxLength;
  final Widget? suffixIcon;

  const TitleTFF({
    Key? key,
    this.title,
    this.subTitle,
    this.textEditingController,
    this.keyboardType,
    this.validator,
    required this.hint,
    this.onTap,
    this.onlyRead,
    this.onEditingSubmitted,
    this.maxLength,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextOfNav(title: title, subTitle: subTitle),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: const Offset(0, 3.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: TextFormField(
            readOnly: onlyRead ?? false,
            onTap: onTap,
            maxLength: maxLength,
            onFieldSubmitted: onEditingSubmitted,
            validator: validator,
            keyboardType: keyboardType,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: '$hint'.tr().toCapitalized(),
              hintStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: MyColors.c5Color,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              border: InputBorder.none,
              suffixIcon: suffixIcon,
            ),
          ),
        )
      ],
    );
  }
}

class TextOfNav extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const TextOfNav({Key? key, this.title, this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12.0),
      child: Row(
        children: [
          Text(
            title!.tr().toCapitalized(),
            style: const TextStyle(
              fontSize: 16.0,
              letterSpacing: 0.49999998092651365,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (subTitle != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 6.0),
              child: Text(
                subTitle!.tr(),
                style: TextStyle(
                  fontSize: 12.0,
                  color: MyColors.cUnSelectedIconLight.withOpacity(0.5),
                  letterSpacing: 0.3999999847412109,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class AppBarTxtButton extends StatelessWidget {
  AppBarTxtButton({
    Key? key,
    this.txt,
    required this.widget,
    this.selected = false,
    this.currentIndex,
  }) : super(key: key);

  final String? txt;
  final Widget? widget;
  late bool selected;

  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder: (context,state){
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenW(context) * .02),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  if (currentIndex == 1) {
                   cubit(context).itemScrollController.scrollTo(
                        index: 1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutCubic,);
                  }
                  else if (currentIndex == 2) {
                    //navigateAndFinish(context: context, widget: widget!);
                    cubit(context).itemScrollController.scrollTo(
                      index: 2,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutCubic,);
                  }else if (currentIndex == 3) {
                    //navigateAndFinish(context: context, widget: widget!);
                    cubit(context).itemScrollController.scrollTo(
                      index: 4,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutCubic,);
                  }

                  else {
                    navigateAndFinish(context: context, widget: widget!);
                  }
                  cubit(context).setCurrentIndex(currentIndex!);
                },
                child: Text(
                  '$txt'.tr().toCapitalized(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              if (selected)
                Container(
                  width: 90,
                  height: 4,
                  decoration: BoxDecoration(
                    color: MyColors.cThirdColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class OutlinedButtonPets extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? backColor;
  final Color? txtColor;
  final bool? border;

  const OutlinedButtonPets({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backColor,
    this.txtColor,
    this.border = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        alignment: Alignment.center,
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(
            right: 25,
            left: 25,
            top: 15,
            bottom: 15,
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            width: 1.5,
            color: border == true ? Colors.white : Colors.transparent,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(backColor ?? Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text.tr().toTitleCase(),
        style: TextStyle(
          fontSize: 16,
          color: txtColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(.5),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SVGString extends StatelessWidget {
  final String? code;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      code!,
      width: width,
      height: height,
      color: color,
    );
  }

  const SVGString(
    this.code, {
    Key? key,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);
}

class RoundedTextFormFieldPets extends StatelessWidget {
  const RoundedTextFormFieldPets({
    Key? key,
    required this.textEditingFormField,
    this.validator,
    this.isPassword,
    this.maxLine,
    required this.hintText,
  }) : super(key: key);
  final TextEditingController? textEditingFormField;
  final FormFieldValidator<String>? validator;
  final bool? isPassword;
  final String? hintText;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: const Offset(0, 3.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: '$hintText'.tr().toCapitalized(),
            hintStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: MyColors.c5Color,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            border: InputBorder.none,
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(40.0),
            // ),
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(40.0),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(40.0),
            // ),
            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(40.0),
            // ),
          ),
          controller: textEditingFormField,
          validator: validator,
          obscureText: isPassword ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLines: maxLine ?? 1,
        ),
      ),
    );
  }
}

class SeeMoreNtn extends StatelessWidget {
  const SeeMoreNtn({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        alignment: Alignment.center,
        side: MaterialStateProperty.all(
          const BorderSide(
            width: 4,
            color: MyColors.cThirdColor,
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(
            right: 75,
            left: 75,
            top: 20,
            bottom: 20,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text.tr().toCapitalized(),
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// login components

class TxtBtn extends StatelessWidget {
  const TxtBtn({
    Key? key,
    this.onPressed,
    this.text,
    this.withSpace,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String? text;
  final bool? withSpace;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (withSpace ?? true) const Spacer(),
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 6.0, top: 6.0),
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              '$text'.tr().toCapitalized(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RowWithCenterTxt extends StatelessWidget {
  const RowWithCenterTxt({Key? key, this.text}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.2,
            color: MyColors.c6Color,
          ),
        ),
        SizedBox(
          width: 50,
          child: Text(
            '$text'.tr().toCapitalized(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1.2,
            color: MyColors.c6Color,
          ),
        ),
      ],
    );
  }
}

class SocialBtn extends StatelessWidget {
  final Function()? onPressed;
  final Color? backColor;
  final Color? txtColor;
  final String? text;
  final String? svgCode;
  final String? assetImage;

  const SocialBtn({
    required this.onPressed,
    this.backColor,
    this.txtColor,
    this.text,
    this.svgCode,
    this.assetImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenH(context) * 0.068,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backColor ?? Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(
                color: backColor != null ? Colors.transparent : Colors.black,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgCode != null)
              SVGString(
                svgCode,
                width: 20,
              )
            else
              Image.asset(
                '$assetImage',
                width: 20,
              ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "$text".tr().toCapitalized(),
              style: TextStyle(
                color: txtColor ?? Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextRichBtn extends StatelessWidget {
  const TextRichBtn({
    Key? key,
    this.onPressed,
    this.text1,
    this.text2,
  }) : super(key: key);
  final GestureTapCallback? onPressed;
  final String? text1;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${"$text1".tr().toCapitalized()} ",
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: MyColors.cFourthColor,
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: Text(
            "$text2".tr(),
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: MyColors.c6Color,
            ),
          ),
        ),
      ],
    );
  }
}
