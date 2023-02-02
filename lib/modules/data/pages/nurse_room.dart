import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/widget_custom/app_bar.dart';

import '../../../utils/colors.dart';

class NurseRoom extends StatelessWidget {
  const NurseRoom({Key? key}) : super(key: key);
  static const List<String> students = <String>[
    'Lê Vũ Đức Anh',
    'Phan Hà Anh',
    'PHẠM TRÂM ANH',
    'HÀ VIỆT LINH',
    'Nguyễn ngọc trường phúc',
    'Nguyễn Hoàng Bảo Anh',
    'Đỗ Cao Bảo Châu',
    'Đỗ Bảo Châu',
    'Lê Hà Chi',
    'Nguyễn Minh Chi',
    'Đặng Minh Dương',
    'NAKANISHI MEI',
    'NGUYỄN ĐỨC MINH',
    'LÊ TRÍ MINH',
    'NGUYỄN MINH',
    'ĐẶNG TÚ MINH',
    'PHẠM SĨ NGUYÊN',
    'NGUYỄN HOÀI NGUYÊN',
    'Dương Mạc GIA NHI',
    'NGUYỄN HOÀNG SƠN',
    'LÊ BÌNH SƠN',
    'VŨ THU THẢO',
    'LA QUỲNH TRÂM',
    'VŨ NAM TRUNG',
    'PHẠM ĐỖ MINH TÂM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Phòng y tế',
        isBack: true,
      ),
      body: Container(
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
            const Text(
              '16/02/2023',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Yêu cầu từ:',
                style: TextStyle(color: Colors.indigoAccent)),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: ListView.separated(
                    itemCount: students.length,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 8),
                    separatorBuilder: (_, index) {
                      return const Divider(
                        color: AppColors.lightSilver,
                      );
                    },
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(
                            kDetailRequest,
                            parameters: {'name': students[index]},
                          );
                        },
                        child: itemRequest(students[index]),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  Widget itemRequest(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('HS ${name.toUpperCase()}'),
            const Icon(
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
