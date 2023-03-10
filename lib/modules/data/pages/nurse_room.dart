import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/widget_custom/app_bar.dart';

import '../../../model/request_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/global_controller.dart';
import '../data_controller.dart';

class NurseRoom extends StatefulWidget {
  NurseRoom({Key? key}) : super(key: key);

  @override
  State<NurseRoom> createState() => _NurseRoomState();
}

class _NurseRoomState extends State<NurseRoom> {
  final GlobalController globalController = Get.find();

  final DataController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Phòng y tế',
        isBack: true,
        backgroundColor: globalController.colorBackground.value,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getListRequest(teacherId: globalController.idStudent.value);
        },
        child: Obx(() {
          return Container(
            color: globalController.colorBackground.value,
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
                        style: TextStyle(
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
                const Text('Yêu cầu từ:',
                    style: TextStyle(color: Colors.indigoAccent)),
                const SizedBox(
                  height: 16,
                ),
                if (controller.listRequest.isNotEmpty)
                  Expanded(
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
                            Get.toNamed(kDetailRequest,
                              parameters: {
                                'id': request.id!.toString(),
                                'name': request.studentName!,
                                'teacher': name.value,
                                'reason': request.reason!,
                                'time': request.requestTime!,
                              },);
                          },
                          child: itemRequest(request),
                        );
                      },
                    ),
                  )
                else
                  const Text('Không có yêu cầu của học sinh.'),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget itemRequest(RequestModel request) {
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
                    text: 'Học sinh: ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(text: request.studentName!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
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
            ),            const Icon(
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
