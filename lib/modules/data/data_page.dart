import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:holiscare/utils/global_controller.dart';
import '../../widget_custom/app_bar.dart';
import '../home/home_controller.dart';
import 'data_controller.dart';

class DataPage extends GetView<DataController> {
  DataPage({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dữ liệu chung',
        isBack: false,
      ),
      body: Container(
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const Spacer(),
            InkWell(
              onTap: (){
                Get.toNamed(kNurseRoom);
              },
              child: itemClass(
                'Phòng y tế',
                "assets/images/nurse_room.png",
                    () {},
              ),
            ),
            const Divider(
              color: AppColors.black,
            ),
            InkWell(
              onTap: (){
                Get.toNamed(kCommingSoonPage);
              },
              child: itemClass(
                'Báo sức khoẻ',
                "assets/images/medical_news.png",
                    () {
                    },
              ),
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
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
