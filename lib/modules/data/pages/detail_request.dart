import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/modules/home/widget/list_record.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:holiscare/widget_custom/app_bar.dart';
import 'package:holiscare/widget_custom/app_button.dart';

import '../../../constant/constants.dart';
import '../../../utils/global_controller.dart';
import '../../../utils/icons.dart';
import '../../../utils/time_util.dart';
import '../../../widget_custom/app_input.dart';
import '../data_controller.dart';

class DetailRequest extends StatefulWidget {
  const DetailRequest({Key? key}) : super(key: key);

  @override
  State<DetailRequest> createState() => _DetailRequestState();
}

class _DetailRequestState extends State<DetailRequest> {
  final DataController controller = Get.find();
  final GlobalController globalController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String? nameTeacher;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    reasonController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.id.value = Get.parameters['id'] ?? '';
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
                    if (globalController.isTeacher.value)
                      Text(
                        'HS ${controller.name.value}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    else
                      Text(
                        'HS ${globalController.nameStudent.value}',
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
                    globalController.isTeacher.value
                        ? Text(
                      'GV ${controller.teacher.value}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                        : DropdownButtonFormField2(
                      decoration: const InputDecoration(
                        isDense: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        filled: true,
                        enabledBorder:
                        OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                                ViewConstants.defaultBorderRadiusBtn),
                          ),
                          borderSide: BorderSide(color: AppColors.lightSilver),
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Chọn giáo viên',
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 48,
                      // buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: controller.listNameTeacher.value
                          .map((item) =>
                          DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Chọn giáo viên.';
                        }
                      },
                      onChanged: (value) {
                        //Do something when changing the item if you want.
                        print('1');
                        setState(() {
                          nameTeacher = value.toString();
                        });
                        print('$nameTeacher');
                      },
                      onSaved: (value) {
                        // selectedValue = value.toString();
                        // print('$selectedValue');
                      },
                    ),
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
                            globalController.isTeacher.value
                                ? Text(controller.name.value)
                                : Text(globalController.nameStudent.value),
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
                    globalController.isTeacher.value
                        ? Text(
                      controller.reason.value,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                        : AppInput(
                      controller: reasonController,
                      validator: (classManage) {
                        if (classManage == null || classManage
                            .trim()
                            .isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      // autofocus: true,
                      enabled: true,
                      hintText: 'Lý do',
                      onTapIconRight: () async {
                        reasonController.clear();
                      },
                      enableInteractiveSelection: false,
                      iconRight: IconEnums.close,
                    ),
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
                    globalController.isTeacher.value
                        ? Text(
                      controller.time.value,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                        : AppInput(
                      controller: timeController,
                      validator: (classManage) {
                        if (classManage == null || classManage
                            .trim()
                            .isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      // autofocus: true,
                      enabled: true,
                      hintText: 'Thời gian đi',
                      onTapIconRight: () async {
                        print('1');
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2024, 5, 5, 20, 50),
                            onChanged: (date) {},
                            onConfirm: (date) {
                              setState(() {
                                timeController.text = TimeUtil.format(
                                    date, TimeUtil.DDMMYYYYHHMM);
                              });
                            },
                            locale: LocaleType.en);
                      },
                      enableInteractiveSelection: false,
                      iconRight: IconEnums.calendar,
                      colorRightIcon: AppColors.backgroundButton,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    globalController.isTeacher.value
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AppButton(
                              title: 'Đồng ý',
                              onPressed: () async {
                                await controller.acceptRequest(int.parse(controller.id.value));

                                await controller.getListRequest(teacherId: globalController.idStudent.value);

                                Get.back();
                                Get.snackbar('Thông báo', 'Đã cho phép',
                                    snackPosition: SnackPosition.TOP);
                              }),
                        ),
                        const Spacer(),
                        Expanded(
                          child: AppButton(
                              title: 'Từ chối',
                              onPressed: () async {
                                await controller.declineRequest(int.parse(controller.id.value));

                                await controller.getListRequest(teacherId: globalController.idStudent.value);

                                Get.back();
                                Get.snackbar('Thông báo', 'Không cho phép',
                                    snackPosition: SnackPosition.TOP);
                              }),
                        ),
                      ],
                    )
                        : Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          child: AppButton(
                              title: 'Gửi',
                              onPressed: () async {
                                for (var element in controller.listTeacher) {
                                  if (nameTeacher!.toLowerCase().trim() == element.name!.toLowerCase().trim()) {
                                    controller.teacherId.value = element.id ?? 1;
                                  }
                                }
                                await controller.postRequest(
                                    reasonController.text, timeController.text, controller.teacherId.value);

                                await controller.getListRequest(studentId: globalController.idStudent.value);

                                Get.back();
                                Get.snackbar('Thông báo', 'Gửi thành công',
                                    snackPosition: SnackPosition.TOP);
                              }),
                        ),
                        const Spacer(),
                      ],
                    )
                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}
