import 'package:doctor_care/shared/components/main_component/carousel_slider_widget.dart';
import 'package:flutter/material.dart';

class TopImagesAboutAnimal extends StatelessWidget {
  const TopImagesAboutAnimal({Key? key}) : super(key: key);

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
      child: CarouselSliderWidget(
        widgets: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:200),
                child: Image.asset("assets/image/logo/Ellipse 2.png",width: 400,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300.0),
                child: Image.asset("assets/image/logo/Ellipse 3.png",width: 300,color: Colors.black54.withOpacity(.3),),
              ),
              Image.asset("assets/image/main_images/dog_in_home.png",width: 300,)
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:200),
                child: Image.asset("assets/image/logo/Ellipse 2.png",width: 400,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300.0),
                child: Image.asset("assets/image/logo/Ellipse 3.png",width: 300,color: Colors.black54.withOpacity(.3),),
              ),
              Image.asset("assets/image/main_images/dog_in_home.png",width: 300,)
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:200),
                child: Image.asset("assets/image/logo/Ellipse 2.png",width: 400,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300.0),
                child: Image.asset("assets/image/logo/Ellipse 3.png",width: 300,color: Colors.black54.withOpacity(.3),),
              ),
              Image.asset("assets/image/main_images/dog_in_home.png",width: 300,)
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:200),
                child: Image.asset("assets/image/logo/Ellipse 2.png",width: 400,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300.0),
                child: Image.asset("assets/image/logo/Ellipse 3.png",width: 300,color: Colors.black54.withOpacity(.3),),
              ),
              Image.asset("assets/image/main_images/dog_in_home.png",width: 300,)
            ],
          ),

        ],
      ),
    );
  }
}
