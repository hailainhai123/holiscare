import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:holiscare/constant/routes.dart';

class ViewConstants {
  static const double defaultBorderRadiusBtn = 8;
}

class Constants {
  /// http headers
  static Map<String, String> apiHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static String convertPhone(String phone) {
    if (phone[0] == '0') {
      return '+84' + phone.substring(1);
    } else {
      return phone;
    }
  }

  /// e.t.c.
  static String playerId = "playerId";
  static String userId = "userId";
  static String pass = "pass";
  static String user = "user";
  static String tokenType = "tokenType";
  static String token = "token";
  static String studentId = "studentId";
  static String signedIn = "signedIn";
  static String isTeacher = "teacher";
  static double buttonHeight = 48.0;
  static double buttonHeightSmall = 40.0;

  static List<String> listDiseasesLung = [
    'Viêm phổi',
    'Viêm phế quản',
    'Tắc nghẽn mãn tính',
    'Ung thư phổi',
    'Viêm màng phổi',
    'Phù phổi',
  ];

  static List<String> listDiseasesEye = [
    'Tật khúc xạ',
    'Viêm kết mạc',
    'Viêm bờ mi mắt',
    'Viêm loét giác mạc',
    'Đục thuỷ tinh thể',
    'Tăng nhãn áp',
  ];

  static List<String> listImageDiseases = [
    'assets/human/phoi.png',
    'assets/human/mat.png',
  ];

  static List<String> listImageDetailDiseasesLung = [
    'assets/human/viem_phoi.png',
    'assets/human/viem_phe_quan.png',
    'assets/human/tac_nghen.png',
    'assets/human/ung_thu.png',
    'assets/human/viem_mang_phoi.png',
    'assets/human/phu_phoi.png',
  ];

  static List<String> listImageDetailDiseasesEye = [
    'assets/human/tat_khuc_xa.png',
    'assets/human/viem_ket_mac.png',
    'assets/human/viem_bo_mi_mat.png',
    'assets/human/viem_loet_giac_mac.jpeg',
    'assets/human/duc_thuy_tinh_the.png',
    'assets/human/tang_nhan_ap.png',
  ];

  static String viemPhoi = 'Viêm phổi là hiện tượng viêm nhiễm của nhu mô phổi bao gồm viêm phế nang, túi phế nang, ống phế nang, tổ chức liên kết khe kẽ và viêm tiểu phế quản tận cùng. Các phế nang, đường dẫn khí trong phổi có thể chứa đầy chất lỏng hoặc mủ, gây ho có đờm hoặc mủ, sốt, ớn lạnh và khó thở. Thông thường, có nhiều tác nhân gây ra tình trạng viêm phổi, nhưng thường do vi khuẩn, virus và nấm. Bệnh viêm phổi có nhiều mức độ khác nhau từ viêm nhẹ, đến viêm phổi nặng.';

  static String viemPheQuan = 'Viêm phế quản phổi là tình trạng viêm khu trú thành từng mảng ở phế quản và phế nang phổi, có thể ảnh hưởng đến các thùy phổi, làm suy yếu chức năng phổi.'
      'Bệnh viêm phế quản phổi diễn tiến theo nhiều mức độ, từ giai đoạn khởi phát cho đến giai đoạn tàn phát. '
      'Ở giai đoạn khởi phát đầu tiên, người bệnh có thể ủ bệnh với các triệu chứng gần giống với viêm đường hô hấp hoặc bệnh cũng có thể khởi phát đột ngột với các triệu chứng như chướng bụng, chán ăn, khó thở kèm theo tím tái…'
      'Sau đó, ở giai đoạn tàn phát – giai đoạn nghiêm trọng, người bệnh có thể sốt cao, co giật, hôn mê,… nếu không kịp thời can thiệp và điều trị.';

  static String tacNghen = 'Bệnh phổi tắc nghẽn mạn tính là tình trạng viêm niêm mạc đường thở mạn tính gây '
      'giảm chức năng thông khí ở phổi. Người bệnh thường cảm thấy khó thở vì đường thở bị hẹp so với '
      'bình thường và có thể dẫn đến suy hô hấp.';

  static String ungThu = 'Ung thư phổi là loại ung thư khởi phát từ phổi hay còn được gọi là khối u '
      'ác tính ở đường hô hấp. Bệnh xảy ra khi một khối u ác tính hình thành trong phổi, '
      'phát triển nhanh về kích cỡ dẫn tới xâm lấn, chèn ép các cơ quan xung quanh. '
      'Hai lá phổi trong lồng ngực có chức năng hấp thụ oxy khi hít vào và thải carbon dioxide (CO2) khi thở ra.';

  static String viemMangPhoi = 'Viêm màng phổi là tình trạng lớp màng bao quanh phổi bị viêm và gây ra các cơn đau nhói ở ngực với tần suất nhanh cho người bệnh.'
      ' Cơn đau thường tăng lên khi bệnh nhân hít thở sâu hoặc ho, làm cho hai lá màng phổi vốn bị viêm lại bị cọ xát lên nhau.';

  static String phuPhoi = 'Phù phổi là một tình trạng phổi chứa đầy dịch. Dịch này đi vào nhiều túi khí trong phổi gây ra khó thở. '
      'Phù phổi còn được gọi là tắc nghẽn phổi hay phù nề phổi. Cơ thể bạn sẽ phải đấu tranh để có được oxy. '
      'Các triệu chứng sẽ thuyên giảm khi bác sĩ loại bỏ dịch trong phổi.'
      'Trong hầu hết các trường hợp, các vấn đề về tim gây ra phù phổi. Tuy nhiên, '
      'dịch được tạo ra có thể vì những lý do khác như viêm phổi, tiếp xúc với độc tố, thuốc men, '
      'chấn thương đến thành ngực hoặc vận động ở cường độ cao.';

  static List<String> listConceptLung = [
    viemPhoi,
    viemPheQuan,
    tacNghen,
    ungThu,
    viemMangPhoi,
    phuPhoi,
  ];

  static List<String> listViemPhoi = [
    '- Đau ngực khi thở hoặc ho',
    '- Ho, ho có đờm',
    '- Mệt mỏi',
    '- Sốt, đổ mồ hôi và ớn lạnh',
    '- Buồn nôn, nôn mửa hoặc tiêu chảy',
    '- Khó thở',
    '- Lú lẫn',
  ];

  static List<String> listViemPheQuan = [
    '- Ho nhiều, ho dai dẳng, có thể ho ra máu hoặc có dịch nhầy',
    '- Cảm thấy buồn nôn và có hiện tượng ói mửa',
    '- Sốt',
    '- Khó thở, thở gấp',
    '- Đau tức ngực, đặc biệt là khi ho hoặc thở sâu',
    '- Đổ mồ hôi',
    '- Cảm thấy ớn lạnh, rùng mình',
    '- Đau cơ',
    '- Mệt mỏi, uể pải, không có năng lực cho những hoạt động thường ngày',
    '- Mất vị giác, không cảm thấy ngon miệng khi ăn',
    '- Đau đầu, chóng mặt',
    '- Lú lẫn hoặc mất phương hướng, đặc biệt là ở người lớn tuổi',
  ];

  static List<String> listTacNghen = [
    '- Cảm thấy khó thở, đặc biệt là trong các hoạt động thể chất',
    '- Thở khò khè',
    '- Tức ngực',
    '- Ho có đờm kéo dài',
    '- Nhiễm trùng đường hô hấp thường xuyên',
    '- Thiếu năng lượng',
    '- Giảm cân ngoài ý muốn (trong giai đoạn sau)',
    '- Sưng phù ở mắt cá chân, bàn chân hoặc chân',
    '- Sốt nhẹ và cảm giác ớn lạnh',
  ];

  static List<String> listUngThu = [
    '- Ho kéo dài',
    '- Ho có đờm hoặc máu',
    '- Đau ngực trầm trọng hơn khi thở sâu, cười hoặc ho',
    '- Khàn tiếng',
    '- Hụt hơi',
    '- Thở khò khè',
    '- Suy nhược và mệt mỏi',
    '- Chán ăn dẫn đến sụt cân',
  ];

  static List<String> listViemMangPhoi = [
    '- Người ốm bị sốt, ớn lạnh, cảm lạnh',
    '- Thường xuyên cảm thấy đau, tức ngực khi hít thở',
    '- Mỗi lần thở có nghe tiếng khò khè, nặng nhọc',
    '- Có cảm giác như phần ngực nặng kéo xuống',
    '- Người bệnh xanh xao, mệt mỏi, thiếu sức sống',
    '- Cơ thể mệt mỏi',
    '- Tức ngực râm ran ngay khi ho, hắt hơi và hít thở sâu',
    '- Đau không giảm hay biến mất sau vài ngày',
    '- Đau diễn tiến chậm nhiều ngày đến nhiều tuần',
    '- Ho ra máu',
    '- Thở nhanh hoặc khó thở',
  ];

  static List<String> listPhuPhoi = [
    '- Khó thở hoặc thở gấp đến mức trầm trọng hơn khi hoạt động hoặc khi nằm xuống',
    '- Cảm giác nghẹt thở hoặc chết đuối trầm trọng hơn khi nằm',
    '- Ho tạo ra đờm sủi bọt có thể nhuốm máu',
    '- Thở khò khè hoặc thở hổn hển',
    '- Da lạnh',
    '- Lo lắng bồn chồn hoặc cảm giác sợ hãi',
    '- Môi tái nhợt',
    '- Nhịp tim nhanh bất thường',
  ];

  static List<List<String>> listIndicationLung = [
    listViemPhoi,
    listViemPheQuan,
    listTacNghen,
    listUngThu,
    listViemMangPhoi,
    listPhuPhoi
  ];

  static String  tatKhucXa = 'Tật khúc xạ là một rối loạn mắt rất phổ biến, xảy ra khi mắt không thể tập trung '
      'rõ ràng các hình ảnh từ thế giới bên ngoài. Hệ quả của các tật khúc xạ là mờ tầm nhìn, đôi khi làm thị lực suy yếu.';

  static String  viemKetmac = 'Viêm kết mạc (hay đau mắt đỏ) là tình trạng kết mạc – một lớp màng trong suốt đi dọc '
      'theo mí mắt và bao phủ lên tròng trắng của mắt – bị sưng lên do viêm, gây đỏ và đau nhức. '
      'Bạn có thể bị đau mắt đỏ ở một hoặc cả hai mắt.';

  static String viemBoMiMat = 'Bệnh viêm bờ mi là tình trạng sưng viêm ở khu vực phát triển lông mi và '
      'có thể ảnh hưởng đến toàn bộ mí mắt. Tất cả mọi người ở mọi độ tuổi đều có nguy cơ bị viêm bờ mi mắt dưới hoặc trên. '
      'Mặc dù vậy, một số thống kê cho thấy người trẻ tuổi có xu hướng bắt gặp triệu chứng này cao hơn so với người cao tuổi.';

  static String viemLoatGiacMac = 'Loét giác mạc là một khiếm khuyết biểu mô giác mạc '
      'với tình trạng viêm nhiễm nền thường do sự xâm nhập của vi khuẩn, nấm, vi rút, hoặc Acanthamoeba. '
      'Nó có thể được bắt đầu bởi chấn thương cơ học hoặc thiếu hụt dinh dưỡng, '
      'và tình trạng viêm không kiểm soát được có thể tạo ra hoại tử giác mạc';

  static String ducThuyTinhThe = 'Đục thủy tinh thể (hay đục nhân mắt, bệnh cườm đá, cườm khô) là tình trạng rối '
      'loạn thị lực do cấu trúc protein của thủy tinh thể '
      'bị thay đổi dưới tác động của các chất gây hại sinh ra từ bên trong cơ thể hoặc từ môi trường bên ngoài';

  static String tangNhanAp = 'Tăng nhãn áp là tình trạng áp lực nội nhãn tăng do thủy dịch trong mắt '
      'không thoát được ra ngoài hoặc sản xuất quá nhiều, có thể làm hỏng các dây thần kinh thị giác. '
      'Thế nên, nếu không được điều trị đúng cách, bệnh tăng nhãn áp có khả năng gây mù vĩnh viễn.';

  static List<String> listConceptEye = [
    tatKhucXa,
    viemKetmac,
    viemBoMiMat,
    viemLoatGiacMac,
    ducThuyTinhThe,
    tangNhanAp,
  ];

  static List<String> listTatKhucXa = [
    '- Nhìn đôi',
    '- Tầm nhìn bị mờ',
    '- Nhìn thấy ánh sáng chói hoặc quầng sáng xung quanh ánh đèn',
    '- Nheo mắt',
    '- Nhức đầu',
    '- Mỏi mắt, nhức mắt',
    '- Khó tập trung khi đọc hoặc nhìn vào máy tính',
  ];

  static List<String> listViemKetMac = [
    '- Ngứa ở một hoặc cả hai mắt',
    '- Cảm thấy khó chịu ở mắt',
    '- Tiết nhiều dịch ở mắt và có thể đóng thành màng/ ghèn trong lúc ngủ khiến bạn khó mở mắt ra vào buổi sáng',
    '- Chảy nước mắt nhiều',
  ];

  static List<String> listViemBoMiMat = [
    '- Cảm giác sưng nhức và nóng rát ở mắt',
    '- Khô mắt',
    '- Ghèn tích tụ ở lông mi và khoé mắt',
    '- Chảy nước mắt nhiều',
    '- Cảm giác có dị vật trong mắt',
    '- Có phần nhảy cảm với ánh sáng',
  ];

  static List<String> listViemLoetGiacMac = [
    '- Cảm thấy khó chịu, mỏi mắt, có cảm giác dị vật trong mắt.',
    '- Mắt nóng rát, đau nhức âm ỉ trong mắt.',
    '- Chói mắt, nhạy cảm với ánh sáng.',
    '- Chảy nước mắt',
    '- Mờ mắt',
    '- Đỏ mắt',
    '- Đục giác mạc, xuất hiện đốm trắng trên giác mạc, thường ở vùng trung tâm giác mạc.',
    '- Sưng mi mắt, khó mở mắt',
    '- Chảy mủ từ mắt',
  ];

  static List<String> listDucThuyTinhThe = [
    '- Mắt mờ như có màng sương che phủ trước mắt',
    '- Cảm giác khó nhìn vào ban đêm',
    '- Nhìn loá và chói mắt, nhạy cảm với ánh sáng',
    '- Người bệnh xuất hiện quầng sáng ở mọi nơi',
    '- Phải thay kính mới liên tục',
    '- Mọi vật khi nhìn đều có màu vàng',
    '- Nhìn sự vật thành hai, thành ba',
  ];

  static List<String> listTangNhanAp = [
    '- Mắt đau nhức đột ngột, dữ dội, đau lan lên đỉnh đầu.',
    '- Nhãn cầu căng cứng như hòn bi.',
    '- Mắt đỏ, mi nề, chảy nước mắt, sợ ánh sáng.',
    '- Thị lực bệnh nhân giảm nhanh thậm chí mất hẳn, nhìn mờ như qua màn sương, nhìn vào các vật phát sáng thấy có quầng xanh đỏ.',
    '- Những dấu hiệu toàn thân có thể có: đau bụng, nôn, buồn nôn, ỉa chảy, vã mồ hôi.... '
        'khiến người bệnh lầm t­ưởng là cảm sốt, chủ quan tự chữa trị, khi tới viện thì đã mù hoàn toàn.',
  ];

  static List<List<String>> listIndicationEye = [
    listTatKhucXa,
    listViemKetMac,
    listViemBoMiMat,
    listViemLoetGiacMac,
    listDucThuyTinhThe,
    listTangNhanAp
  ];

  static const List<String> listNameStudent = [
    'Lê Vũ Anh Đức',
    'Phan Hà Anh',
    'Phạm Trâm Anh',
    'Hà Việt Linh',
    'Nguyễn Ngọc Trường Phúc',
  ];

  static const List<String> listSexStudent = [
    'Nam',
    'Nữ',
    'Nữ',
    'Nam',
    'Nam',
  ];

  static const List<String> listIndexStudent = [
    '0',
    '1',
    '2',
    '3',
    '4',
  ];

  static const List<String> listGmailStudent = [
    'wsduc.le.60229@wellspring.edu.vn',
    'wsAnh.Phan.60619@wellspring.edu.vn',
    'wsanh.pham.50563@wellspring.edu.vn',
    'wsLinh.Ha.80318@wellspring.edu.vn',
    'wsphuc.nguyen.a0525@wellspring.edu.vn',
    // 'wsChau.Do.A0417@wellspring.edu.vn',
    // 'wsChau.Do.10019@wellspring.edu.vn',
    // 'wsChi.Le.20351@wellspring.edu.vn',
    // 'wschi.nguyen.80618@wellspring.edu.vn',
    // 'wsDuong.Dang.A0397@wellspring.edu.vn',
    // 'wshoang.lam.90582@wellspring.edu.vn',
    // 'WsHung.Pham.90422@wellspring.edu.vn',
    // 'wsMei.Nakanishi.10080@wellspring.edu.vn',
    // 'wsMinh.Nguyen.10406@wellspring.edu.vn',
    // 'wsminh.le.61065@wellspring.edu.vn',
    // 'wsminh.nguyen.90385@wellspring.edu.vn',
    // 'wsMinh.Dang.A0359@wellspring.edu.vn',
    // 'wsNguyen.Pham.10072@wellspring.edu.vn',
    // 'wsNguyen.Nguyen.A0295@wellspring.edu.vn',
    // 'wsNhi.Duong.10255@wellspring.edu.vn',
    // 'wsSon.Le.60836@wellspring.edu.vn',
    // 'wsThao.Vu.A0289@wellspring.edu.vn',
    // 'wsTram.La.A0268@wellspring.edu.vn',
    // 'wsTrung.Vu.20296@wellspring.edu.vn',
    // 'wsTam.Pham.10060@wellspring.edu.vn',
  ];

  static const List<String> listPasswordStudent = ['123456'];
}

class DateTimeFormatPattern {
  static const String dateFlowServer = 'yyyy-MM-dd';
  static const String mmyy = 'MM/YY';
  static const String mmyyyyy = 'MM/yyyy';
  static const String dd = 'dd';
  static const String formatDefault = 'dd-MM-yyyy HH:mm:ss';
  static const String formatddMMyyyy = 'dd-MM-yyyy';
  static const String formatyyyyMMdd = 'yyyy-MM-dd';
  static const String dobddMMyyyy = 'dd/MM/yyyy';
  static const String formatddMM = 'dd/MM';
  static const String formatHHmm = 'HH:mm';
  static const String commonDateFormat = "dd/MMM/yyyy";
  static const String dateFormatPayment = "HH:mm 'ngày' MM/dd";
  static const String hh_mm_NGAY_dd_MM = "HH:mm 'ngày' dd/MM";
  static const String hh_mm_NGAY_dd_MM_yyyy = "HH:mm 'ngày' dd/MM/yyyy";
  static const String backendTimeFormat = "dd/MM/yyyy HH:mm";

  static DateTime startOfDay(DateTime date) {
    return (DateTime(date.year, date.month, date.day));
  }
}

