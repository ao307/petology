import 'package:doctor_care/shared/components/widgets.dart';
import 'package:flutter/material.dart';

class FirstInHomeTop extends StatelessWidget {
  const FirstInHomeTop({Key? key,
    this.title,
    this.subtitle,
    this.onPress,

  }) : super(key: key);
  final String? title;
  final String? subtitle;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.98, 0.39),
          end: Alignment(0.98, 0.49),
          colors: [Color(0xFF56392D), Color(0xFF110B09)],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$title',
                  style: const TextStyle(
                    fontSize: 36.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '$subtitle',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    height: 1.9,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: SizedBox(
                    height: 52,
                    width: 500,
                    child: OutlinedButtonPets(
                      onPressed: onPress!,
                      text: 'help them',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:200),
                  child: Image.asset("assets/image/logo/Ellipse 2.png",width: 400,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 300.0),
                  child: Image.asset("assets/image/logo/Ellipse 3.png",width: 300,),
                ),
                Image.asset("assets/image/main_images/dog_in_home.png",width: 300,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
