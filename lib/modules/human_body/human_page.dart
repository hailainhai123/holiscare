import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/utils/colors.dart';
import 'package:holiscare/utils/global_controller.dart';
import '../../widget_custom/app_bar.dart';
import 'package:flutter_cube/flutter_cube.dart';

class Human3DPage extends StatefulWidget {
  Human3DPage({Key? key}) : super(key: key);

  @override
  State<Human3DPage> createState() => _Human3DPageState();
}

class _Human3DPageState extends State<Human3DPage> {
  final GlobalController globalController = Get.find();
  late Object humanBody;

  @override
  void initState() {
    // TODO: implement initState
    humanBody = Object(fileName: "assets/human/FinalBaseMesh.obj");
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
        decoration: BoxDecoration(
            color: globalController.colorBackground.value,
            image: const DecorationImage(
              image: AssetImage('assets/human/human.png'),
              fit: BoxFit.fill,
            )),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: size.width / 2 - 35,
              child: InkWell(
                onTap: () {
                  Get.toNamed(kDetailRecord);
                },
                child: Container(
                  height: 70,
                  width: 70,
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                    'Đầu',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  )),
                ),
              ),
            ),
            Positioned(
              top: 160,
              left: size.width / 2 - 60,
              child: InkWell(
                onTap: () {
                  Get.toNamed(kDetailRecord);
                },
                child: Container(
                  height: 70,
                  width: 120,
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                    'Ngực',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  )),
                ),
              ),
            ),
            Positioned(
              top: 260,
              left: size.width / 2 - 60,
              child: InkWell(
                onTap: () {
                  Get.toNamed(kDetailRecord);
                },
                child: Container(
                  height: 70,
                  width: 120,
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                    'Bụng',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  )),
                ),
              ),
            ),
            Positioned(
              top: 370,
              left: size.width / 2 - 140,
              child: InkWell(
                onTap: () {
                  Get.toNamed(kDetailRecord);
                },
                child: Container(
                  height: 70,
                  width: 70,
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                    'Tay trái',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  )),
                ),
              ),
            ),
            Positioned(
              top: 370,
              right: size.width / 2 - 140,
              child: InkWell(
                onTap: () {
                  Get.toNamed(kDetailRecord);
                },
                child: Container(
                  height: 70,
                  width: 70,
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                    'Tay phải',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  )),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: size.width / 2 - 80,
              child: InkWell(
                onTap: () {
                  Get.toNamed(kDetailRecord);
                },
                child: Container(
                  height: 70,
                  width: 70,
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                        'Chân trái',
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      )),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: size.width / 2 - 80,
              child: InkWell(
                onTap: () {
                  Get.toNamed(kDetailRecord);
                },
                child: Container(
                  height: 70,
                  width: 70,
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                        'Chân phải',
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
