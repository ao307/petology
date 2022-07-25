import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarouselSliderWidget extends StatelessWidget {
  CarouselSliderWidget({Key? key, this.widgets}) : super(key: key);
  final List<Widget>? widgets;
  final CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenH(context) * 0.6,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              buttonCarouselController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: SVGString(backwardSvg),
            ),
          ),
          Expanded(
            child: CarouselSlider(
              items: widgets,
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                disableCenter: true,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              buttonCarouselController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: SVGString(forwardSvg),
            ),
          ),
        ],
      ),
    );
  }
}
