import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ItemOfThirdHomeTop extends StatelessWidget {
  const ItemOfThirdHomeTop(
      {Key? key, this.title, required this.svgCode, this.onPress,})
      : super(key: key);
  final String? svgCode;
  final String? title;
  final GestureTapCallback? onPress;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          width: 4.0,
          color: const Color(0xFF492F24),
        ),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(30.0),
        hoverColor: const Color(0xFFFFE3C5),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 60,
            vertical: 60,
          ),
          child: Column(
            children: [
              SVGString(
                svgCode,
              ),
              Text(
                '$title'.tr().toCapitalized(),
                style: const TextStyle(
                  fontSize: 46.0,
                  color: Color(0xFF492F24),
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
