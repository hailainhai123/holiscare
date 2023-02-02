import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:holiscare/widget_custom/app_bar.dart';

class NurseRoomStudent extends StatelessWidget {
  const NurseRoomStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Phòng y tế',
        isBack: true,
      ),
      body: Container(
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const Spacer(),
            InkWell(
              onTap: (){
                Get.toNamed(kMedicalHistory);
              },
              child: itemClass(
                'Lịch sử sức khoẻ',
                "assets/images/ls_sk_hs.png",
                    () {},
              ),
            ),
            const Divider(
              color: AppColors.black,
            ),
            InkWell(
              onTap: (){
                Get.toNamed(kDetailRequest);
              },
              child: itemClass(
                'Gửi yêu cầu đi y tế',
                "assets/images/gui_yc_yte.png",
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
