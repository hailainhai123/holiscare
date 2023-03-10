import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/constants.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/modules/human_body/human_controller.dart';
import 'package:holiscare/utils/colors.dart';

import '../../../utils/global_controller.dart';
import '../../../widget_custom/app_bar.dart';

class DiseasePage extends GetView<HumanController> {
  DiseasePage({Key? key}) : super(key: key);

  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Chi tiết',
        isBack: true,
        backgroundColor: globalController.colorBackground.value,
      ),
      body: Obx(
        () {
          return Container(
            color: globalController.colorBackground.value,
            padding: const EdgeInsets.all(16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      controller.imageDiseases.value,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      controller.nameDiseases.value,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/human/icon_benh.png',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Các bệnh phổ biến',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const Divider(
                  color: AppColors.black,
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.separated(
                      itemCount: controller.listDiseases.length,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 8),
                      separatorBuilder: (_, index) {
                        return const Divider(
                          color: AppColors.lightSilver,
                        );
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              controller.nameDetailDiseases.value = controller.listDiseases[index];
                              if (controller.nameDiseases.value == 'Phổi') {
                                controller.imageDetailDiseases.value = Constants.listImageDetailDiseasesLung[index];
                                controller.concept.value = Constants.listConceptLung[index];
                                controller.listIndication.clear();
                                controller.listIndication.addAll(Constants.listIndicationLung[index]);
                              } else if (controller.nameDiseases.value == 'Mắt') {
                                controller.imageDetailDiseases.value = Constants.listImageDetailDiseasesEye[index];
                                controller.concept.value = Constants.listConceptEye[index];
                                controller.listIndication.clear();
                                controller.listIndication.addAll(Constants.listIndicationEye[index]);
                              }
                              Get.toNamed(kDetailDisease);
                            },
                            child: itemDiseases(controller.listDiseases[index]));
                      }),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  Widget itemDiseases(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              const Icon(
                Icons.chevron_right,
                color: AppColors.black,
              )
            ],
          ),
          const Divider(
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
