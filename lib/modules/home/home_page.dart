import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/model/student_model.dart';
import 'package:holiscare/utils/global_controller.dart';
import '../../utils/colors.dart';
import '../../widget_custom/app_bar.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.find();
  final GlobalController globalController = Get.find();
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Lớp học',
          isBack: false,
          backgroundColor: globalController.colorBackground.value,
        ),
        body: Obx(
          () {
            return Container(
              color: globalController.colorBackground.value,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    '10AB4',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    color: AppColors.black,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  if (controller.listStudent.isNotEmpty) Obx(() {
                    return Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.7,
                        children:
                            List.generate(controller.listStudent.length, (index) {
                          var student = controller.listStudent[index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed(kDetailClassroomPage, parameters: {
                                'title': student.name!,
                                'index': '${student.id!}',
                              });
                            },
                            child: Center(
                              child: SelectCard(
                                student: student,
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  }) else const Center(child: Text('Hệ thống lỗi. Vui lòng quay lại sau.')),
                ],
              ),
            );
          }
        ));
  }
}

class Choice {
  const Choice({required this.title, required this.image});

  final String title;
  final String image;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Lê Vũ Đức Anh', image: 'assets/students/l.v.d.anh.jpeg'),
  Choice(title: 'Phan Hà Anh', image: 'assets/students/p.h.anh.jpeg'),
  Choice(title: 'PHẠM TRÂM ANH', image: 'assets/students/p.t.anh.jpeg'),
  Choice(title: 'HÀ VIỆT LINH', image: 'assets/students/h.v.linh.jpeg'),
  Choice(
      title: 'Nguyễn ngọc trường phúc', image: 'assets/students/l.t.minh.jpeg'),
  Choice(title: 'Nguyễn Hoàng Bảo Anh', image: 'assets/students/l.q.tram.jpeg'),
  Choice(title: 'Đỗ Cao Bảo Châu', image: 'assets/students/d.c.b.chau.jpeg'),
  Choice(title: 'Đỗ Bảo Châu', image: 'assets/students/d.b.chau.jpeg'),
  Choice(title: 'Lê Hà Chi', image: 'assets/students/l.h.chi.jpeg'),
  Choice(title: 'Nguyễn Minh Chi', image: 'assets/students/n.m.chi.jpeg'),
  Choice(title: 'Đặng Minh Dương', image: 'assets/students/d.m.duong.jpeg'),
  Choice(title: 'NAKANISHI MEI', image: 'assets/students/nakanishimei.jpeg'),
  Choice(title: 'NGUYỄN ĐỨC MINH', image: 'assets/students/h.v.linh.jpeg'),
  Choice(title: 'LÊ TRÍ MINH', image: 'assets/students/l.v.d.anh.jpeg'),
  Choice(title: 'NGUYỄN MINH', image: 'assets/students/l.t.minh.jpeg'),
  Choice(title: 'ĐẶNG TÚ MINH', image: 'assets/students/d.c.b.chau.jpeg'),
  Choice(title: 'PHẠM SĨ NGUYÊN', image: 'assets/students/p.h.anh.jpeg'),
  Choice(title: 'NGUYỄN HOÀI NGUYÊN', image: 'assets/students/n.m.chi.jpeg'),
  Choice(title: 'Dương Mạc GIA NHI', image: 'assets/students/l.h.chi.jpeg'),
  Choice(title: 'NGUYỄN HOÀNG SƠN', image: 'assets/students/p.t.anh.jpeg'),
  Choice(title: 'LÊ BÌNH SƠN', image: 'assets/students/p.h.anh.jpeg'),
  Choice(title: 'VŨ THU THẢO', image: 'assets/students/p.t.anh.jpeg'),
  Choice(title: 'LA QUỲNH TRÂM', image: 'assets/students/l.q.tram.jpeg'),
  Choice(title: 'VŨ NAM TRUNG', image: 'assets/students/l.v.d.anh.jpeg'),
  Choice(title: 'PHẠM ĐỖ MINH TÂM', image: 'assets/students/d.m.duong.jpeg'),
];

class SelectCard extends StatelessWidget {
  final StudentModel student;

  const SelectCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              // child: Image.asset(
              //   student.avatarUrl ?? "",
              //   fit: BoxFit.fill,
              //   width: Get.width / 3 - 20,
              // ),
              child: CachedNetworkImage(
                width: Get.width / 3 - 20,
                imageUrl: student.avatarUrl ?? '',
                placeholder: (context, url) => const SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(
                      child: CircularProgressIndicator(
                    value: 10,
                    strokeWidth: 2.0,
                  )),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/avatar_default.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            student.name!.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ]);
  }
}
