import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/modules/home/home_controller.dart';

import '../../../constant/styles.dart';
import '../../../utils/colors.dart';

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
    return Expanded(
        child: ListView.separated(
            itemCount: 1,
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
  }

  Widget itemRecord(int index) {
    return InkWell(
      onTap: () {
        if (index == 0) {
          Get.toNamed(kDetailRecord);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(time[index],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                child: Text(
                    title[index],
                    maxLines: 2,
                    style: const TextStyle(fontSize: 14, color: Colors.black)),
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
