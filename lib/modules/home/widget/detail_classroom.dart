import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/modules/home/home_controller.dart';

import '../../../utils/colors.dart';
import '../../../widget_custom/app_bar.dart';

class DetailClassroom extends GetView<HomeController> {
  const DetailClassroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.title.value = Get.parameters['title'] ?? '';
    controller.index.value = Get.parameters['index'] ?? '';
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Lớp học',
          isBack: true,
        ),
        body: Container(
          color: AppColors.primary,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                controller.title.value.toUpperCase(),
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: AppColors.black,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // const Spacer(),
                    InkWell(
                      onTap: (){
                        Get.toNamed(kHealthRecord);
                      },
                      child: itemClass(
                        'Dữ liệu sức khoẻ',
                        "assets/images/du_lieu_sk.png",
                        () {},
                      ),
                    ),
                    const Divider(
                      color: AppColors.black,
                    ),
                    InkWell(
                      onTap: (){
                        Get.toNamed(kMedicalHistory);
                      },
                      child: itemClass(
                        'Lịch sử sức khoẻ',
                        "assets/images/record.png",
                        () {},
                      ),
                    ),
                    // const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget itemClass(String title, String image, Function() onTap) {
    return Container(
      height: 180,
      width: 250,
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: AppColors.primary500,
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                    )),
              ],
            ),
            // const Icon(Icons.arrow_forward, color: AppColors.arrowBtn,)
          ],
        ),
      ),
    );
  }
}
