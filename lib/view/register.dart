import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.2,
                ),
                Text(
                  'Register User,',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                columnDivider(height: Get.height * 0.1),
                CustomTextField(
                    labelText: 'Enter Your Name',
                    controller: ac.nameController,
                    keyboardType: TextInputType.emailAddress),
                columnDivider(),
                CustomTextField(
                  controller: ac.phoneController,
                  labelText: 'Enter Your Phone Number',
                  keyboardType: TextInputType.phone,
                ),
                columnDivider(),
                Obx(() {
                  return dobButton(
                      selectedDOB: ac.selectedDOB.value,
                      context: context,
                      onTap: () => ac.openDatePicker(context));
                }),
                columnDivider(),
                Obx(() {
                  return dropDown(
                    itemList: ac.genderList,
                    context: context,
                    currentItem: ac.currentGender.value,
                    onChange: ac.onGenderChange,
                  );
                }),
                columnDivider(height: Get.height * 0.25),
                primaryButton(
                  context: context,
                  labelText: 'Submit',
                  onTap: ac.updateUser,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
