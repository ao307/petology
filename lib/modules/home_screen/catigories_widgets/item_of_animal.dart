import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class ItemOfCarouselAnimal extends StatelessWidget {
  const ItemOfCarouselAnimal(
      {Key? key, this.title, required this.imageLink, this.onPress,})
      : super(key: key);
  final String? imageLink;
  final String? title;
  final GestureTapCallback? onPress;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenW(context)*.20,vertical: 40),
      child: InkWell(
        onTap: onPress,
        hoverColor: Colors.white,
        child: HoverWidget(
          onHover: (e){},
          hoverChild: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                width: 4.0,
                color: const Color(0xFF492F24),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF492F24).withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "$imageLink",
                  width: 200,
                ),
                Text(
                  '$title'.tr().toCapitalized(),
                  style: const TextStyle(
                    fontSize: 46.0,
                    color: Color(0xFF492F24),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6,),
                SeeMoreNtn(
                  onPressed: (){},
                  text: 'see more',
                )
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                width: 4.0,
                color: const Color(0xFF492F24),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "$imageLink",
                  width: 200,
                ),
                Text(
                  '$title'.tr().toCapitalized(),
                  style: const TextStyle(
                    fontSize: 46.0,
                    color: Color(0xFF492F24),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6,),
                SeeMoreNtn(
                  onPressed: (){},
                  text: 'see more',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
