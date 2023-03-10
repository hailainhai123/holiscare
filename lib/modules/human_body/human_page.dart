import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/constants.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/modules/human_body/human_controller.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:holiscare/utils/global_controller.dart';
import '../../widget_custom/app_bar.dart';
import 'package:flutter_cube/flutter_cube.dart';

import '../../widget_custom/custom_dialog.dart';

class Human3DPage extends StatefulWidget {
  Human3DPage({Key? key}) : super(key: key);

  @override
  State<Human3DPage> createState() => _Human3DPageState();
}

class _Human3DPageState extends State<Human3DPage> {
  final GlobalController globalController = Get.find();
  final HumanController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Mô hình cơ thể',
        isBack: false,
        backgroundColor: globalController.colorBackground.value,
      ),
      body: Container(
        color: globalController.colorBackground.value,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 50),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/human/body.png'),
                  fit: BoxFit.fill,
                )),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.toNamed(kCommingSoonPage);
                            },
                            child: itemPartBodyLeft(
                                'assets/human/nao.png', 'Não')),
                        InkWell(
                            onTap: () {
                              Get.toNamed(kCommingSoonPage);
                            },
                            child: itemPartBodyRight(
                                'assets/human/tim.png', 'Tim')),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.listDiseases.clear();
                            controller.listDiseases.addAll(Constants.listDiseasesEye);
                            controller.imageDiseases.value = Constants.listImageDiseases[1];
                            controller.nameDiseases.value = 'Mắt';
                            Get.toNamed(kDiseasePage);
                          },
                          child: itemPartBodyLeft(
                              'assets/human/mat.png', 'Mắt'),
                        ),
                        InkWell(
                            onTap: () {
                              controller.listDiseases.clear();
                              controller.listDiseases.addAll(Constants.listDiseasesLung);
                              controller.imageDiseases.value = Constants.listImageDiseases[0];
                              controller.nameDiseases.value = 'Phổi';
                              Get.toNamed(kDiseasePage);
                            },
                            child: itemPartBodyRight(
                                'assets/human/phoi.png', 'Phổi')),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(kCommingSoonPage);
                          },
                          child: itemPartBodyLeft(
                              'assets/human/tuyen_uc.png', 'Tuyến ức'),
                        ),
                        InkWell(
                            onTap: () {
                              Get.toNamed(kCommingSoonPage);
                            },
                            child: itemPartBodyRight(
                                'assets/human/gan.png', 'Gan')),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.toNamed(kCommingSoonPage);

                            },
                            child: itemPartBodyLeft(
                                'assets/human/tui_mat.png', 'Túi mật')),
                        InkWell(
                            onTap: () {
                              Get.toNamed(kCommingSoonPage);

                            },
                            child: itemPartBodyRight(
                                'assets/human/bung.png', 'Bụng')),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.toNamed(kCommingSoonPage);

                            },
                            child: itemPartBodyLeft(
                                'assets/human/than.png', 'Thận')),
                        InkWell(
                            onTap: () {
                              Get.toNamed(kCommingSoonPage);

                            },
                            child: itemPartBodyRight(
                                'assets/human/tuy.png', 'Tuỵ')),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.toNamed(kCommingSoonPage);

                            },
                            child: itemPartBodyLeft(
                                'assets/human/ruot.png', 'Ruột')),
                        InkWell(
                          onTap: () {
                            showDialog(
                              barrierColor: Colors.black45,
                              context: context,
                              builder: (context) {
                                return const CustomAlertDialog(
                                  title: "Hệ sinh sản",
                                  description: "",
                                );
                              },
                            );
                          },
                          child: itemPartBodyRight(
                              'assets/human/he_sinh_san.png', 'Hệ sinh sản'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemPartBodyLeft(String image, String part) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Color(0xffF3E2E2),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          part,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget itemPartBodyRight(String image, String part) {
    return Row(
      children: [
        Text(
          part,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Color(0xffF3E2E2),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
