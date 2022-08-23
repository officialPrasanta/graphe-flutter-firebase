import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphe_firebase_notification/constants/colors.dart';
import 'package:graphe_firebase_notification/constants/measurement.dart';
import 'package:graphe_firebase_notification/controllers/auth_controller.dart';
import 'package:graphe_firebase_notification/view/widgets/buttons.dart';
import 'package:graphe_firebase_notification/view/widgets/custom_text_field.dart';
import 'package:graphe_firebase_notification/view/widgets/dividers.dart';

class RegisterUser extends StatelessWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController ac = Get.find<AuthController>();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          margin: const EdgeInsets.only(
            left: kMargin,
            right: kMargin,
            bottom: kMargin,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.2,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Register User,',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  columnDivider(height: Get.height * 0.1)
                ],
              ),
              Expanded(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                        labelText: 'Enter Your Name',
                        keyboardType: TextInputType.emailAddress),
                    columnDivider(),
                    CustomTextField(
                      labelText: 'Enter Your Phone Number',
                      ishideText: true,
                      keyboardType: TextInputType.phone,
                    ),
                    columnDivider(),
                    Obx(() {
                      return dobButton(
                          selectedDOB: ac.selectedDate.value,
                          context: context,
                          onTap: () => ac.openDatePicker(context));
                    }),
                    columnDivider(),
                    Obx(() {
                      return dropDown(
                          genderList: ac.genderList,
                          context: context,
                          currentGender: ac.currentGender.value,
                          onChange: ac.onGenderChange);
                    })
                  ],
                ),
              ),
              primaryButton(
                context: context,
                labelText: 'Submit',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dropDown(
      {required List<String> genderList,
      required BuildContext context,
      required String currentGender,
      void Function(String?)? onChange}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kTextFieldPadding - 2,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: kBorderColor,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        value: currentGender,
        items: genderList
            .map(
              (String gender) => DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              ),
            )
            .toList(),
        onChanged: onChange,
        iconSize: 0.0,
        underline: const SizedBox(),
        isExpanded: true,
        isDense: true,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
