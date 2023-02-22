import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/modules/home/home_controller.dart';

import '../../../constant/constants.dart';
import '../../../constant/styles.dart';
import '../../../utils/colors.dart';
import '../../../utils/date_time_custom_utils.dart';

const List<String> time = [
  '10/08/2022',
  // '10/08/2021',
  // '10/08/2020',
  // '10/08/2019',
];

const List<String> title = [
  'Thông tin khám sức khoẻ định kì năm học 2023 - 2022',
  // 'Thông tin khám sức khoẻ định kì năm học 2022 - 2021',
  // 'Thông tin khám sức khoẻ định kì năm học 2021 - 2020',
  // 'Thông tin khám sức khoẻ định kì năm học 2020 - 2019',
];

class ListRecord extends GetView<HomeController> {
  const ListRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('haiabc');
    return Obx(() {
      if (controller.listRecord.isNotEmpty) {
        return Expanded(
          child: ListView.separated(
              itemCount: controller.listRecord.length,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(top: 8),
              separatorBuilder: (_, index) {
                return const Divider(
                  color: AppColors.lightSilver,
                );
              },
              itemBuilder: (context, index) {
                return itemRecord(index);
              }));
      } else {
        return const Expanded(child: Text('Không có dữ liệu sức khoẻ của học sinh này'));
      }
    });
  }

  Widget itemRecord(int index) {
    var record = controller.listRecord[index];
    var time = DateFormat(DateTimeFormatPattern.dobddMMyyyy)
        .format(record.recordTime!);
    return InkWell(
      onTap: () async {
        await controller.getDetailRecord(record.id!);
        Get.toNamed(kDetailRecord, parameters: {
          'id': '${record.id!}',
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/calendar_record.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.title ?? "Khám sức khỏe đầu năm",
                      // maxLines: 2,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      record.yearSchool ?? "2022-2023",
                      // maxLines: 2,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
              // const SizedBox(width:4,),
              const Icon(
                Icons.chevron_right,
                color: AppColors.black,
              )
            ],
          ),
          const Divider(
            color: AppColors.black,
          )
        ],
      ),
    );
  }
}
