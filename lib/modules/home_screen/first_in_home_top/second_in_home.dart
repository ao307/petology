import 'package:flutter/material.dart';

class SecondInHome extends StatelessWidget {
  const SecondInHome({Key? key,
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
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 300.0),
                  child: Image.asset("assets/image/logo/Ellipse 3.png",width: 300,),
                ),
                Image.asset("assets/image/logo/cat_home.png",width: 300,),
                Image.asset("assets/image/logo/dog_home.png",width: 300,),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$title',
                  style: const TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '$subtitle',
                  style: const TextStyle(
                    fontSize: 20.0,
                    height: 1.9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
