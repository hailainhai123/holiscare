import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:holiscare/modules/home/home_controller.dart';
import 'package:holiscare/widget_custom/app_bar.dart';

import '../../../constant/styles.dart';
import '../../../model/student.dart';
import '../../../utils/colors.dart';
import '../../../utils/global_controller.dart';

class DetailRecord extends GetView<HomeController> {
  DetailRecord({Key? key}) : super(key: key);

  late Student student = Student(
    name: '',
    canNang: '',
    chieuCao: '',
    bmi: '',
    matPKK: '',
    matTKK: '',
    matPCK: '',
    matTCK: '',
    mat: '',
    rhm: '',
    tmh: '',
    noiKhoa: '',
    mach: '',
    huyetAp: '',
    ketLuan: '',
    chuY: '',
  );
  late String index = '0';

  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    if (globalController.isTeacher.value) {
      index = controller.index.value;
    } else {
      index = globalController.index.value;
    }
    if (index == '0') {
      student = Student(
        name: 'Lê Vũ Đức Anh',
        canNang: '53kg',
        chieuCao: '162cm',
        bmi: '16,4',
        matPKK: '1/10',
        matTKK: '1/10',
        matPCK: '7/10',
        matTCK: '7/10',
        mat: '2M: Tật khúc xạ',
        rhm: 'Bình thường',
        tmh: 'Bình thường',
        noiKhoa: 'Bình thường',
        mach: '98 lần/phút',
        huyetAp: '104/68mmHg',
        ketLuan: 'Hai mặt tật khúc xạ',
        chuY: 'Hạn chế tiếp xúc với ánh sáng xanh (tivi, điện thoại, máy tính…). Khám chuyên khoa mắt để được mang kính phù hợp. Khám sức khỏe định kỳ hàng năm.',
      );
    } else if (index == '1') {
      student = Student(
        name: 'Phan Hà Anh',
        canNang: '49,5kg',
        chieuCao: '159cm',
        bmi: '15,5',
        matPKK: 'ĐNT5M',
        matTKK: '1/10',
        matPCK: '7/10',
        matTCK: '7/10',
        mat: '2M: Cận thị',
        rhm: 'Đang chỉnh răng 2 hàm',
        tmh: 'Bình thường',
        noiKhoa: 'Bình thường',
        mach: '69 lần/phút',
        huyetAp: '100/70mmHg',
        ketLuan: 'Hai mắt cận thị. Đang chỉnh răng 2 hàm.',
        chuY: 'Hạn chế tiếp xúc với ánh sáng xanh (tivi, điện thoại, máy tính…). Khám mắt định kỳ. Khám sức khỏe định kỳ hàng năm.',
      );
    } else if (index == '2') {
      student = Student(
        name: 'Phạm Trâm Anh',
        canNang: '40kg',
        chieuCao: '161cm',
        bmi: '15,4',
        matPKK: '8/10',
        matTKK: '10/10',
        matPCK: '',
        matTCK: '',
        mat: 'Bình thường',
        rhm: 'Đang chỉnh răng 2 hàm',
        tmh: 'Bình thường',
        noiKhoa: 'Bình thường',
        mach: '103 lần/phút',
        huyetAp: '110/60mmHg',
        ketLuan: 'Bệnh răng miệng',
        chuY: 'Khám sức khỏe định kỳ hàng năm.',
      );
    } else if (index == '3') {
      student = Student(
        name: 'Hà Việt Linh',
        canNang: '67,5kg',
        chieuCao: '752cm',
        bmi: '19,3',
        matPKK: '',
        matTKK: '',
        matPCK: '8/10',
        matTCK: '7/10',
        mat: '2M: Tật khúc xạ(Đang điều trị phương pháp Ortho-K)',
        rhm: 'Bình thường',
        tmh: 'Viêm mũi họng xuất tiết',
        noiKhoa: 'Bình thường',
        mach: '62 lần/phút',
        huyetAp: '110/60mmHg',
        ketLuan: 'Hai mắt tật khúc xạ ( Đang điều trị phương pháp Ortho - K). Viêm mũi họng xuất tiết.',
        chuY: 'Hạn chế tiếp xúc với ánh sáng xanh (tivi, điện thoại, máy tính…). Khám mắt định kỳ. Rửa mũi, súc họng bằng nước muối sinh lý hàng ngày, tránh bụi, khói, giữ ấm khi lạnh. Hạn chế đồ ăn, đồ uống lạnh. Khám sức khỏe định kỳ hàng năm. ',
      );
    } else if (index == '4') {
      student = Student(
        name: 'Nguyễn Ngọc Trường Phúc',
        canNang: '45kg',
        chieuCao: '177cm',
        bmi: '14,4',
        matPKK: '3/10',
        matTKK: '2/10',
        matPCK: '10/10',
        matTCK: '10/10',
        mat: '2M: Cận thị',
        rhm: 'Bình thường',
        tmh: 'Viêm mũi dị ứng',
        noiKhoa: 'Bình thường',
        mach: '91 lần/phút',
        huyetAp: '100/65mmHg',
        ketLuan: 'Hai mắt cận thị. Viêm mũi dị ứng. Thiếu cân.',
        chuY: 'Hạn chế tiếp xúc với ánh sáng xanh (tivi, điện thoại, máy tính…). Giữ gìn vệ sinh mũi họng, tránh các tác nhân gây dị ứng. Bổ sung các chất dinh dưỡng để nâng cao thể trạng. Khám sức khỏe định kỳ hàng năm.',
      );
    }
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dữ liệu sử dụng',
        isBack: true,
        backgroundColor: globalController.colorBackground.value,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: globalController.colorBackground.value,
          padding: const EdgeInsets.all(16),
          // width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/calendar_record.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('10/08/2022',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('I. thông tin học sinh'.toUpperCase(),
                      style: Styles.heading5.copyWith(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.bold,
                      )),
                  _renderValueInformation(
                      "Họ và tên: ", student.name ?? '', context),
                  _renderValueInformation("Lớp: ", '10AB4', context),
                  _renderValueInformation("Năm học:", '2022-2023', context),
                  Text('II. thông tin sức khoẻ'.toUpperCase(),
                      style: Styles.heading5.copyWith(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.bold,
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _renderValueInformation("Thể lực:", '', context),
                      Column(
                        children: [
                          _renderValueInformation("Chiều cao:", student.chieuCao ?? '', context),
                          _renderValueInformation("Cân nặng:", student.canNang ?? '', context),
                          _renderValueInformation("Chỉ số BMI:", student.bmi ?? '', context),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _renderValueInformation("Thị lực:", '', context),
                      Column(
                        children: [
                          _renderValueInformation("Không kính:", '', context),
                          _renderValueInformation("- Mắt phải:", student.matPKK ?? '', context),
                          _renderValueInformation("- Mắt trái:", student.matTKK ?? '', context),
                          _renderValueInformation("Có kính:", '', context),
                          _renderValueInformation("- Mắt phải:", student.matPCK ?? '', context),
                          _renderValueInformation("- Mắt trái:", student.matTCK ?? '', context),
                        ],
                      ),
                    ],
                  ),
                  _renderValueInformation("Mắt:", student.mat ?? '', context),
                  _renderValueInformation("Răng hàm mặt:", student.rhm ?? '', context),
                  _renderValueInformation("Tai mũi họng:", student.tmh ?? '', context),
                  _renderValueInformation("Nội khoa:", student.noiKhoa ?? '', context),
                  Row(
                    children: [
                      _renderValueInformation("Mạch:", student.mach ?? '', context),
                      const SizedBox(
                        width: 50,
                      ),
                      _renderValueInformation("Huyết áp:", student.huyetAp ?? '', context),
                    ],
                  ),
                  _renderValueInformation("- Tuần hoàn:", 'Bình thường', context),
                  _renderValueInformation("- Hô hấp:", 'Bình thường', context),
                  _renderValueInformation("- Tiêu hoá:", 'Bình thường', context),
                  _renderValueInformation("- Tiết niệu:", 'Bình thường', context),
                  _renderValueInformation("- Cơ xương khớp:", 'Bình thường', context),
                  _renderValueInformation("- Thần kinh:", 'Bình thường', context),
                  _renderValueInformation("Kết luận:", student.ketLuan ?? '', context),
                  _renderValueInformation("Chú ý:", student.chuY ?? '', context),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderValueInformation(
      String title, String value, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width / 6,
              maxWidth: MediaQuery.of(context).size.width - 50),
              child: Text('$title $value',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            // Text(
            //   value,
            //   // textAlign: TextAlign.end,
            //   style: const TextStyle(
            //     color: Colors.black,
            //     fontSize: 13,
            //     fontWeight: FontWeight.w600,),),
          ],
        ));
  }
}
