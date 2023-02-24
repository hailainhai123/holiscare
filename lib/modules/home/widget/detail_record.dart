import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:holiscare/modules/home/home_controller.dart';
import 'package:holiscare/widget_custom/app_bar.dart';

import '../../../constant/constants.dart';
import '../../../constant/styles.dart';
import '../../../model/detail_record_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/global_controller.dart';

class DetailRecord extends GetView<HomeController> {
  DetailRecord({Key? key}) : super(key: key);

  // late DetailRecordModel student = DetailRecordModel(
  //   name: '',
  //   canNang: '',
  //   chieuCao: '',
  //   bmi: '',
  //   matPKK: '',
  //   matTKK: '',
  //   matPCK: '',
  //   matTCK: '',
  //   mat: '',
  //   rhm: '',
  //   tmh: '',
  //   noiKhoa: '',
  //   mach: '',
  //   huyetAp: '',
  //   ketLuan: '',
  //   chuY: '',
  // );
  late String index = '0';

  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    if (globalController.isTeacher.value) {
      index = controller.index.value;
    } else {
      index = globalController.index.value;
    }
    var detail = controller.detailRecord.value;
    double roundDouble(double value, int places) {
      num mod = pow(10.0, places);
      return ((value * mod).round().toDouble() / mod);
    }
    if (detail.attributes![0].value != null &&
        detail.attributes![1].value != null &&
        detail.attributes![0].value!.isNotEmpty &&
        detail.attributes![1].value!.isNotEmpty) {
      String weight = detail.attributes![1].value!;
      String height = detail.attributes![0].value!;
      double w = double.parse(weight);
      double h = double.parse(height) / 100;
      double bmi = w / (h * h);
      controller.chiSoBMI.value = roundDouble(bmi, 2).toString();
    }
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dữ liệu sử dụng',
        isBack: true,
        backgroundColor: globalController.colorBackground.value,
      ),
      body: SingleChildScrollView(
        child: Obx(
         () {
            return Container(
              color: globalController.colorBackground.value,
              padding: const EdgeInsets.all(16),
              // width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/calendar_record.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                          DateFormat(DateTimeFormatPattern.dobddMMyyyy)
                              .format(detail.recordTime!),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('I. thông tin học sinh'.toUpperCase(),
                          style: Styles.heading5.copyWith(
                            color: Colors.indigoAccent,
                            fontWeight: FontWeight.bold,
                          )),
                      _renderValueInformation(
                          "Họ và tên: ", detail.studentName ?? '', context),
                      _renderValueInformation(
                          "Lớp: ", detail.className ?? '', context),
                      _renderValueInformation(
                          "Năm học:", detail.yearSchool ?? '', context),
                      Text('II. thông tin sức khoẻ'.toUpperCase(),
                          style: Styles.heading5.copyWith(
                            color: Colors.indigoAccent,
                            fontWeight: FontWeight.bold,
                          )),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _renderValueInformation("Thể lực:", '', context),
                          Column(
                            children: [
                              _renderValueInformation(
                                  "Chiều cao:",
                                  '${detail.attributes![0].value} ${detail.attributes![0].type!.unit}' ??
                                      '',
                                  context),
                              _renderValueInformation(
                                  "Cân nặng:",
                                  '${detail.attributes![1].value} ${detail.attributes![1].type!.unit}' ??
                                      '',
                                  context),
                              _renderValueInformation(
                                  "Chỉ số BMI:",
                                  controller.chiSoBMI.value,
                                  context),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _renderValueInformation("Thị lực:", '', context),
                          Column(
                            children: [
                              _renderValueInformation("Không kính:", '', context),
                              _renderValueInformation("- Mắt phải:",
                                  detail.attributes![2].value ?? '', context),
                              _renderValueInformation("- Mắt trái:",
                                  detail.attributes![3].value ?? '', context),
                              _renderValueInformation("Có kính:", '', context),
                              _renderValueInformation("- Mắt phải:",
                                  detail.attributes![4].value ?? '', context),
                              _renderValueInformation("- Mắt trái:",
                                  detail.attributes![5].value ?? '', context),
                            ],
                          ),
                        ],
                      ),
                      _renderValueInformation(
                          "Mắt:", detail.attributes![6].value ?? '', context),
                      _renderValueInformation("Răng hàm mặt:",
                          detail.attributes![7].value ?? '', context),
                      _renderValueInformation("Tai mũi họng:",
                          detail.attributes![8].value ?? '', context),
                      _renderValueInformation(
                          "Nội khoa:", detail.attributes![9].value ?? '', context),
                      Row(
                        children: [
                          _renderValueInformation(
                              "Mạch:",
                              '${detail.attributes![10].value} ${detail.attributes![10].type!.unit}' ??
                                  '',
                              context),
                          const SizedBox(
                            width: 50,
                          ),
                          _renderValueInformation(
                              "Huyết áp:",
                              '${detail.attributes![11].value} ${detail.attributes![11].type!.unit}' ??
                                  '',
                              context),
                        ],
                      ),
                      _renderValueInformation("- Tuần hoàn:",
                          detail.attributes![12].value ?? '', context),
                      _renderValueInformation(
                          "- Hô hấp:", detail.attributes![13].value ?? '', context),
                      _renderValueInformation("- Tiêu hoá:",
                          detail.attributes![14].value ?? '', context),
                      _renderValueInformation("- Tiết niệu:",
                          detail.attributes![15].value ?? '', context),
                      _renderValueInformation("- Cơ xương khớp:",
                          detail.attributes![16].value ?? '', context),
                      _renderValueInformation("- Thần kinh:",
                          detail.attributes![17].value ?? '', context),
                      _renderValueInformation(
                          "Kết luận:", detail.conclusion ?? '', context),
                      _renderValueInformation("Chú ý:", detail.note ?? '', context),
                    ],
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  Widget _renderValueInformation(
      String title, String value, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width / 6,
                  maxWidth: MediaQuery.of(context).size.width - 50),
              child: Text('$title $value',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            // Text(
            //   value,
            //   // textAlign: TextAlign.end,
            //   style: const TextStyle(
            //     color: Colors.black,
            //     fontSize: 13,
            //     fontWeight: FontWeight.w600,),),
          ],
        ));
  }
}
