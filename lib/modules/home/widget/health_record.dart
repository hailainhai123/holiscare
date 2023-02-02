import 'package:flutter/material.dart';
import 'package:holiscare/modules/home/widget/list_record.dart';

import '../../../utils/colors.dart';
import '../../../widget_custom/app_bar.dart';
import 'autocomplete_record.dart';

class HealThRecord extends StatelessWidget {
  const HealThRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dữ liệu sức khoẻ',
        isBack: true,
      ),
      body: Container(
        color: AppColors.primary,
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
