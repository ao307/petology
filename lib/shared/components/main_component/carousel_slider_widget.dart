import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:flutter/material.dart';

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
                disableCenter: true,
                autoPlayInterval: const Duration(seconds: 3),
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
