import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/global_controller.dart';
import '../../../widget_custom/app_bar.dart';
import '../data_controller.dart';

class RequestStudentDetail extends StatelessWidget {
  RequestStudentDetail({Key? key}) : super(key: key);

  final DataController controller = Get.find();
  final GlobalController globalController = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.name.value = Get.parameters['name'] ?? '';
    controller.teacher.value = Get.parameters['teacher'] ?? '';
    controller.reason.value = Get.parameters['reason'] ?? '';
    controller.time.value = Get.parameters['time'] ?? '';
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Chi tiết',
        isBack: true,
        backgroundColor: globalController.colorBackground.value,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          color: globalController.colorBackground.value,
          padding: const EdgeInsets.all(16),
          child: Obx(
                  () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icon_sos.png',
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('Yêu cầu đi y tế',
                            style:
                            TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'HS ${controller.name.value}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Kính gửi:',
                        style: TextStyle(color: Colors.indigoAccent)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                    'GV ${controller.teacher.value}',
                    style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Học sinh: ',
                              style: TextStyle(color: Colors.indigoAccent),
                            ),
                            Text(controller.name.value),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              'Lớp: ',
                              style: TextStyle(color: Colors.indigoAccent),
                            ),
                            Text('10AB4')
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Có nguyện vọng: ',
                      style: TextStyle(color: Colors.indigoAccent),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: true,
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            onChanged: (bool? value) {}),
                        const SizedBox(
                          width: 16,
                        ),
                        const Text('Xuống phòng y tế')
                      ],
                    ),
                    const Text(
                      'Lý do:',
                      style: TextStyle(color: Colors.indigoAccent),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      controller.reason.value,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Thời gian đi:',
                      style: TextStyle(color: Colors.indigoAccent),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      controller.time.value,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}
