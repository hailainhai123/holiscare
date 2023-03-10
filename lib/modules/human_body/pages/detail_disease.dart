import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/modules/human_body/human_controller.dart';

import '../../../utils/colors.dart';
import '../../../utils/global_controller.dart';
import '../../../widget_custom/app_bar.dart';

class DetailDiseasePage extends StatefulWidget {
  DetailDiseasePage({Key? key}) : super(key: key);

  @override
  State<DetailDiseasePage> createState() => _DetailDiseasePageState();
}

class _DetailDiseasePageState extends State<DetailDiseasePage> {
  final GlobalController globalController = Get.find();

  final HumanController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    // controller.getDetailDiseases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: CustomAppBar(
            title: controller.nameDetailDiseases.value,
            isBack: true,
            backgroundColor: globalController.colorBackground.value,
          ),
          body: Container(
            height: Get.height,
            color: globalController.colorBackground.value,
            padding: const EdgeInsets.all(16.0,),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(controller.imageDetailDiseases.value),
                  const SizedBox(height: 16.0,),
                  Row(
                    children: const [
                      Text('I. Khái niệm', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                    ],
                  ),
                  const SizedBox(height: 8.0,),
                  Text(controller.concept.value),
                  const SizedBox(height: 8.0,),
                  Row(
                    children: const [
                      Text('II. Triệu chứng', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                    ],
                  ),
                  ListView.separated(
                      itemCount: controller.listIndication.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 8),
                      separatorBuilder: (_, index) {
                        return const Divider(
                          color: AppColors.lightSilver,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Text(controller.listIndication[index]);
                      }),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
