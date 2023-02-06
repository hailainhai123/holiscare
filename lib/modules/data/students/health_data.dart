import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:holiscare/widget_custom/app_bar.dart';

import '../../../utils/global_controller.dart';

class HealthData extends StatelessWidget {
  HealthData({Key? key}) : super(key: key);
  final GlobalController globalController = Get.find();

  static const List<String> title = <String>[
    'Dữ liệu sức khoẻ',
    'Phòng y tế',
  ];

  static const List<int> color = <int>[
    0xFFA6B4E4,
    0xFF7181BB,
  ];

  static const List<String> image = <String>[
    'assets/images/record.png',
    'assets/images/room.png',
    'assets/images/guide.png',
    'assets/images/planner.png',
    'assets/images/check.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dữ liệu chung',
        isBack: false,
        backgroundColor: globalController.colorBackground.value,
      ),
      body: Container(
        color: globalController.colorBackground.value,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(kHealthWebview);
              },
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    color: const Color(0xFF7181BB),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(100), blurRadius: 10.0),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Báo sức khoẻ',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                'assets/images/medical_news.png',
                                fit: BoxFit.contain,
                              )),
                        ],
                      ),
                      // const Icon(Icons.arrow_forward, color: AppColors.arrowBtn,)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32,),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 36.0,
                mainAxisSpacing: 40.0,
                children: List.generate(2, (index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Get.toNamed(kHealthRecord);
                      }
                      if (index == 1) {
                        Get.toNamed(kNurseRoomStudent);
                      }
                    },
                    child: itemClass(title[index], image[index], color[index]),
                  );
                }),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(height: 16,),
            const Text('Sắp ra mắt', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            const SizedBox(height: 16,),
            itemRow('Cẩm nang sức khoẻ'),
            const SizedBox(height: 16,),
            itemRow('Dinh dưỡng'),
            const SizedBox(height: 16,),
            itemRow('Nhật ký sức khoẻ'),
            const SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }

  Widget itemClass(String title, String image, int value) {
    return Container(
      // height: 200,
      // width: 160,
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: Color(value),
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: 100,
                    height: 100,
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

  Widget itemRow(
      String title,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: Get.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(1, 2),
              spreadRadius: 1,
              blurRadius: 5)
        ],
        borderRadius: BorderRadius.circular(8),
        color: globalController.colorBackground500.value,
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              )),
          const SizedBox(
            width: 8.0,
          ),
          const Icon(
            Icons.lock,
          ),
        ],
      ),
    );
  }
}
