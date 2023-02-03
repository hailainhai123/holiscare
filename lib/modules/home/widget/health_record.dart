import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/modules/home/widget/list_record.dart';

import '../../../utils/colors.dart';
import '../../../utils/global_controller.dart';
import '../../../widget_custom/app_bar.dart';
import 'autocomplete_record.dart';

class HealThRecord extends StatelessWidget {
  HealThRecord({Key? key}) : super(key: key);
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dữ liệu sức khoẻ',
        isBack: true,
        backgroundColor: globalController.colorBackground.value,
      ),
      body: Container(
        color: globalController.colorBackground.value,
        padding: const EdgeInsets.all(16.0,),
        child: Column(
          children: const [
            AutocompleteRecord(),
            SizedBox(height: 32,),
            ListRecord(),
          ],
        ),
      ),
    );
  }
}
