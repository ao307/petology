import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';

class HospitalTFF extends StatelessWidget {
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final FormFieldValidator? validator;
  final bool? obscure;
  final IconData? prefixIcon;
  final String? hintText;
  final double? prefixSize;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyboardType,
      obscureText: obscure ?? false,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: Container(
          padding: const EdgeInsetsDirectional.only(start: 30.0, end: 16),
          child: Icon(
            prefixIcon,
            color: Colors.white,
            size: prefixSize ?? 30,
          ),
        ),
        hintText: hintText!.tr().toTitleCase(),
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 22.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: const BorderSide(
            width: 2.4,
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: const BorderSide(
            width: 2.4,
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: const BorderSide(
            width: 2.4,
            color: Colors.white,
          ),
        ),
      ),
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, height: 1.2,),
    );
  }

  const HospitalTFF({
    Key? key,
    this.textEditingController,
    this.keyboardType,
    this.validator,
    this.obscure,
    this.prefixIcon,
    this.hintText,
    this.prefixSize,
  }) : super(key: key);
}

class MyRoundedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final double? height;
  final Widget? endWidget;

  const MyRoundedButton(
      {required this.text,
      required this.onPressed,
      this.color,
      this.textColor,
      this.height,
      this.endWidget,
      Key? key,})
      : super(key: key);

  final double borderRadius = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            // gradient: const LinearGradient(
            //     colors: [Color(0xffffffff), Color(0xffffffff)]),
          ),
          child: SizedBox(
            width: double.infinity,
            height: height ?? 62,
            child: ElevatedButton(
              style: ButtonStyle(
                // elevation: MaterialStateProperty.all(0),
                overlayColor:
                    MaterialStateProperty.all(Colors.grey.withOpacity(.5)),
                alignment: Alignment.center,
                backgroundColor:
                    MaterialStateProperty.all(color ?? Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
              onPressed: onPressed,
              child: Text(
                text.tr().toUpperCase(),
                style: TextStyle(
                  color: textColor ?? MyColors.cPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        if (endWidget != null) endWidget!,
      ],
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
