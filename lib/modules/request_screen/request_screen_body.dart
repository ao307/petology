import 'package:doctor_care/shared/components/main_component/dropdown_menu_list.dart';
import 'package:doctor_care/shared/components/reuse_functions.dart';
import 'package:doctor_care/shared/components/svg_images.dart';
import 'package:doctor_care/shared/components/widgets.dart';
import 'package:doctor_care/shared/themes/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RequestScreenBody extends StatelessWidget {
  const RequestScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenW(context) * 0.32,
        vertical: screenH(context) * 0.05,
      ),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(88.0),
        border: Border.all(
          width: 1.5,
          color: MyColors.c6Color,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Form(
        key: cubit(context).formKeyPostRequest,
        child: Column(
          children: [
            //top title text
            Text(
              'request'.tr().toCapitalized(),
              style: const TextStyle(
                height: 1,
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            // image
            InkWell(
              onTap: () {
                cubit(context).fetchRequestImages();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: SVGString(
                  cameraSvg,
                  width: 100,
                ),
              ),
            ),
            //name
            RoundedTextFormFieldPets(
              textEditingFormField: cubit(context).namePostRequest,
              hintText: "name",
              validator: (value) {
                if (value!.isEmpty) {
                  return 'name is required';
                }
                return null;
              },
            ),
            // category
            CustomDropdownExample(
              items: const [
                'Cat',
                'Dog',
              ],
              errorText: 'select category',
              hintText: 'category',
              jobRoleCtrl: cubit(context).categoryIdRequestHelp!,
              onChanged: (value) {
                cubit(context).getFilterDropdowns(value == 'Cat' ? 2 : 1);
              },
            ),
            const SizedBox(height: 20),
            // TODO: year and month dropdown
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomDropdownExample(
                      items: const [
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                      ],
                      errorText: 'enter year',
                      hintText: 'year',
                      jobRoleCtrl: TextEditingController(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomDropdownExample(
                      items: const[
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                        '8',
                        '9',
                        '10',
                        '11',
                        '12',
                      ],
                      errorText: 'enter month',
                      hintText: 'months',
                      jobRoleCtrl: TextEditingController(),
                    ),
                  ),
                ],
              ),
            ),
            // TODO: size and breed dropdown
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomDropdownExample(
                      items: const [
                        "small",
                        "medium",
                        "large",
                      ],
                      errorText: 'select size',
                      hintText: 'size',
                      jobRoleCtrl: TextEditingController(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomDropdownExample(
                      items: const [
                        "persian",
                        "siamese",
                        "ragdoll",
                        "other",
                      ],
                      errorText: 'select breed',
                      hintText: 'breed',
                      jobRoleCtrl: cubit(context).breadPostRequest!,
                    ),
                  ),
                ],
              ),
            ),
            // TODO: hair length and care & behavior dropdown
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomDropdownExample(
                      items: const [
                        "short",
                        "medium",
                        "long",
                      ],
                      errorText: 'select hair length',
                      hintText: 'hair length',
                      jobRoleCtrl: cubit(context).hairPostRequest!,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomDropdownExample(
                      items: const [
                        "low",
                        "medium",
                        "high",
                      ],
                      errorText: 'select care & behavior',
                      hintText: 'care & behavior',
                      jobRoleCtrl: cubit(context).carePostRequest!,
                    ),
                  ),
                ],
              ),
            ),
            // TODO: house trained and color dropdown
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomDropdownExample(
                      items:  const[
                        "yes",
                        "no",
                      ],
                      errorText: 'select house trained',
                      hintText: 'house trained',
                      jobRoleCtrl: cubit(context).houseTrainedPostRequest!,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomDropdownExample(
                      items:  const [
                        "black",
                        "white",
                        "brown",
                        "grey",
                        "other",
                      ],
                      errorText: 'select color',
                      hintText: 'color',
                      jobRoleCtrl: cubit(context).colorPostRequest!,
                    ),
                  ),
                ],
              ),
            ),
            //location
            TitleTFF(
              title: 'detect your current location',
              hint: "location",
              textEditingController: cubit(context).locationPostRequest,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter location';
                }
                return null;
              },
              suffixIcon:
                  const Icon(Icons.location_on, color: MyColors.cMainColor),
            ),
            const SizedBox(height: 20),
            //phone number
            RoundedTextFormFieldPets(
              textEditingFormField: cubit(context).phoneNumberPostRequest,
              hintText: "phone number",
              validator: (value) {
                return validateMobile(value!);
              },
            ),
            const SizedBox(height: 10),
            // description
            RoundedTextFormFieldPets(
              textEditingFormField: cubit(context).descriptionPostRequest,
              hintText: "description",
              maxLine: 6,
            ),
            const SizedBox(height: 10),
            //send button
            SizedBox(
              width: double.infinity,
              height: screenH(context) * 0.08,
              child: OutlinedButtonPets(
                text: 'send'.tr().toCapitalized(),
                onPressed: () {
                  if (cubit(context)
                      .formKeyPostRequest
                      .currentState!
                      .validate()) {
                    if (cubit(context).imagesBase64.isNotEmpty) {
                      cubit(context).postRequestFun();
                    } else {
                      showToast(msg: 'please select images');
                    }
                  }
                },
                backColor: MyColors.cPrimary,
                txtColor: MyColors.cThirdColor,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
