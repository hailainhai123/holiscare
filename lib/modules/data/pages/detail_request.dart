import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:holiscare/widget_custom/app_bar.dart';
import 'package:holiscare/widget_custom/app_button.dart';

import '../../../utils/global_controller.dart';
import '../../../utils/icons.dart';
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
    controller.name.value = Get.parameters['name'] ?? '';
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Chi tiết',
        isBack: true,
      ),
      body: Container(
        height: Get.height,
        color: AppColors.primary,
        padding: const EdgeInsets.all(16),
        child: Column(
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
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
            if (globalController.isTeacher.value) Text(
              'HS ${controller.name.value}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ) else Text(
              'HS ${globalController.nameStudent.value}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Kính gửi:',
                style: TextStyle(color: Colors.indigoAccent)),
            const SizedBox(
              height: 16,
            ),
            AppInput(
              controller: nameController,
              validator: (classManage) {
                if (classManage == null || classManage.trim().isEmpty) {
                  return '';
                }
                return null;
              },
              // autofocus: true,
              enabled: true,
              hintText: 'Giáo viên',
              onTapIconRight: () async {
                nameController.clear();
              },
              enableInteractiveSelection: false,
              iconRight: IconEnums.close,
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
                    globalController.isTeacher.value ? Text(controller.name.value) : Text(globalController.nameStudent.value),
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
            AppInput(
              controller: reasonController,
              validator: (classManage) {
                if (classManage == null || classManage.trim().isEmpty) {
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
            AppInput(
              controller: timeController,
              validator: (classManage) {
                if (classManage == null || classManage.trim().isEmpty) {
                  return '';
                }
                return null;
              },
              // autofocus: true,
              enabled: true,
              hintText: 'Thời gian đi',
              onTapIconRight: () async {
                timeController.clear();
              },
              enableInteractiveSelection: false,
              iconRight: IconEnums.close,
            ),
            const SizedBox(
              height: 16,
            ),
            globalController.isTeacher.value ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppButton(
                      title: 'Đồng ý',
                      onPressed: () {
                        print('1');
                        Get.back();
                        Get.snackbar('Thông báo', 'Đã cho phép',
                            snackPosition: SnackPosition.TOP);
                      }),
                ),
                const Spacer(),
                Expanded(
                  child: AppButton(
                      title: 'Từ chối',
                      onPressed: () {
                        print('1');
                        Get.back();
                        Get.snackbar('Thông báo', 'Không cho phép',
                            snackPosition: SnackPosition.TOP);
                      }),
                ),
              ],
            ) : Row(
              children: [
                const Spacer(),
                Expanded(
                  child: AppButton(
                      title: 'Gửi',
                      onPressed: () {
                        print('1');
                        Get.back();
                        Get.snackbar('Thông báo', 'Gửi thành công',
                            snackPosition: SnackPosition.TOP);
                      }),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
