import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/utils/global_controller.dart';
import '../../../../../../utils/styles.dart';

class ProfileTextField extends StatelessWidget {
  final Widget? icon;
  final String labelText;
  final String? hintText;
  final String? initValue;

  ProfileTextField(
      {Key? key,
      this.icon,
      required this.labelText,
      this.hintText,
      this.initValue})
      : super(key: key);

  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: icon,
            ),
          Expanded(
            child: TextFormField(
              style: TextStyle(
                  fontSize: 13.0, color: globalController.colorText.value),
              initialValue: initValue,
              enableSuggestions: false,
              autocorrect: false,
              autofocus: false,
              enabled: false,
              onTap: () {},
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(
                    fontSize: 14.0, color: globalController.colorText.value, fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
