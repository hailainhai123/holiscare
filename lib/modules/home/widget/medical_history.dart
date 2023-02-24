import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:holiscare/model/request_model.dart';
import 'package:holiscare/modules/home/home_controller.dart';
import 'package:holiscare/modules/home/widget/utils_calendar.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:holiscare/widget_custom/app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../constant/routes.dart';
import '../../../utils/global_controller.dart';
import '../../data/data_controller.dart';

class MedicalHistory extends StatefulWidget {
  @override
  _MedicalHistoryState createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  final GlobalController globalController = Get.find();
  final HomeController homeController = Get.find();
  final DataController controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Lịch sử yêu cầu đi y tế',
        isBack: true,
        backgroundColor: globalController.colorBackground.value,
      ),
      body: Obx(() {
        return Container(
          width: Get.width,
          height: Get.height,
          color: globalController.colorBackground.value,
          padding: const EdgeInsets.all(16),
          child: controller.listRequest.isNotEmpty
              ? RefreshIndicator(
                onRefresh: () async {
                  if (globalController.isTeacher.value) {
                    var idStudent = int.parse(homeController.index.value);
                    await controller.getListRequest(studentId: idStudent);
                  } else {
                    await controller.getListRequest(studentId: globalController.idStudent.value);
                  }
                },
                child: ListView.separated(
                    itemCount: controller.listRequest.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 8),
                    separatorBuilder: (_, index) {
                      return const Divider(
                        color: AppColors.lightSilver,
                      );
                    },
                    itemBuilder: (context, index) {
                      var request = controller.listRequest.value[index];
                      return InkWell(
                        onTap: () {
                          var name = ''.obs;
                          for (var element in controller.listTeacher) {
                            if (request.teacherId == element.id!) {
                              name.value = element.name ?? '';
                            }
                          }
                          print('$name');
                          Get.toNamed(kDetailRequestStudent,
                            parameters: {
                              'name': request.studentName!,
                              'teacher': name.value,
                              'reason': request.reason!,
                              'time': request.requestTime!,
                            },);
                        },
                        child: itemRequestStudent(request),
                      );
                    },
                  ),
              )
              : const Text('Không có yêu cầu của học sinh nào.'),
        );
      }),
      floatingActionButton: globalController.isTeacher.value
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                Get.toNamed(kDetailRequest);
              },
              label: const Text('Thêm yêu cầu'),
            ),
    );
  }

  Widget itemRequestStudent(RequestModel request) {
    var status = ''.obs;
    var color = Colors.black.obs;
    switch (request.status!) {
      case 0:
        status.value = 'Yêu cầu mới';
        break;
      case 1:
        status.value = 'Đồng ý';
        color.value = Colors.greenAccent;
        break;
      case 2:
        status.value = 'Từ chối';
        color.value = Colors.redAccent;
        break;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Thời gian: ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(text: request.requestTime!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Trạng thái: ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(text: status.value, style: TextStyle(fontWeight: FontWeight.bold, color: color.value)),
                    ],
                  ),
                ),
                // Text('Thời gian: ${request.requestTime!}'),
              ],
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.black,
            )
          ],
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
