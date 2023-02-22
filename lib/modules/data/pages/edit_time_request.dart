import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';
import '../../../utils/time_util.dart';

class EditTimeRequest extends StatelessWidget {

  EditTimeRequest({Key? key}) : super(key: key);

  void buildMaterialDatePicker(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;
    // _controller
    //     .onChangeBirthday(TimeUtil.format(picked, TimeUtil.ViewDateFormat));
  }

  void buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                // _controller.onChangeBirthday(
                //     TimeUtil.format(picked, TimeUtil.ViewDateFormat));
              },
              initialDateTime: DateTime.now(),
              minimumYear: 1900,
              maximumYear: DateTime.now().year,
            ),
          );
        });
  }

  void handleDatePicker(BuildContext context) {
    FocusScope.of(context).unfocus();
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
        return buildMaterialDatePicker(context);
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      case TargetPlatform.iOS:
        return buildCupertinoDatePicker(context);
      case TargetPlatform.macOS:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: TextField(
        // onChanged: _controller.onChangeBirthday,
        // controller: _controller.dobController,
        inputFormatters: [
          MaskTextInputFormatter(
              mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')})
        ],
        decoration: InputDecoration(
          labelText: 'Thời gian đi',
          hintStyle:
          const TextStyle(color: AppColors.black, fontSize: 14),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)),
          suffixIcon: IconButton(
              onPressed: () {
                DatePicker.showDateTimePicker(context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    maxTime: DateTime(2024, 5, 5, 20, 50), onChanged: (date) {
                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                    }, onConfirm: (date) {
                      print('confirm $date');
                    }, locale: LocaleType.en);},
              icon: SvgPicture.asset(
                IconEnums.calendar,
                width: 16,
                height: 16,
                color: AppColors.backgroundButton,
                fit: BoxFit.contain,
              )),
        ),
      ),
    );
  }
}
