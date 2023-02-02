import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Mô hình cơ thể',
        isBack: false,
      ),
      body: Container(
        color: AppColors.primary,
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(humanBody);
            scene.camera.zoom = 10;
          },
        ),
      ),
    );
  }
}
