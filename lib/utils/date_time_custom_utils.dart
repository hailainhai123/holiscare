import 'package:intl/intl.dart';

class DateTimeCustomUtils {
  static String parseStringEhr({String? dateTime, String? parseTime}) {
    final dateFormat =
        DateFormat(parseTime ?? 'hh:mm dd/MM/yy').parse(dateTime ?? '');
    return '${DateFormat('dd').format(dateFormat)} Tháng ${DateFormat('MM/yyyy').format(dateFormat)}';
  }

  static DateTime parseDateTimeEhr({String? dateTime}) {
    return DateTime.parse(dateTime ?? '');
  }

  static String parseDateTimeIso({String? dateTime}) {
    final dateFormat = DateTime.parse(dateTime ?? '');
    return '${DateFormat('dd').format(dateFormat)} Tháng ${DateFormat('MM/yyyy').format(dateFormat)}';
  }

  static DateTime parseDatetime({String? dateTime, String? parseTime}) {
    final dateFormat =
    DateFormat(parseTime ?? 'hh:mm dd/MM/yy').parse(dateTime ?? '');
    return dateFormat;
  }
}