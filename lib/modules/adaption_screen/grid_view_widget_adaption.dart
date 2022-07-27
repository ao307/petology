import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_care/models/pets_model.dart';
import 'package:doctor_care/modules/home_screen/about_animal_screen/about_animal_screen.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:flutter/material.dart';

//TODO: GRID VIEW ADAPTION
class GVAdaption extends StatelessWidget {
  const GVAdaption({Key? key, this.petsModel}) : super(key: key);
  final List<PetsModel>? petsModel;

  @override
  Widget build(BuildContext context) {
    if(petsModel!.isEmpty||petsModel==null){
      return const Center(child: Text("no pets"));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(30),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 80,
      ),
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.c5Color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(petsModel![index].image!.isNotEmpty)
                CachedNetworkImage(
                  imageUrl: petsModel![index].image![0],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: 100,
                )
              else
                const Text("no image",style: TextStyle(color: Colors.red),),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${petsModel![index].name}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF492F24),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // TODO: GO TO DETAILS SCREEN ABOUT Animal
              SizedBox(
                width: screenW(context) * .2,
                height: 50,
                child: OutlinedButtonPets(
                  onPressed: () {
                    navigateTo(context: context, widget: AboutAnimalScreen(
                      petsModel: petsModel![index],
                    ),
                    );
                  },
                  text: 'read more',
                  backColor: MyColors.cPrimary,
                  txtColor: Colors.white,
                  border: false,
                ),
              ),
              Text(
                "by: ${petsModel![index].user!.firstName}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF492F24),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
      shrinkWrap: true,
      itemCount: petsModel!.length,
    );
  }
}
