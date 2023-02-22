import 'package:intl/intl.dart';
import '../constant/constants.dart';

class TimeUtil {
  static String DDMMYYYY = 'dd/MM/yyyy';
  static String DDMMYYYYHHMM = 'dd/MM/yyyy HH:mm';
  static String ViewDateFormat = DDMMYYYY;

  static String format(DateTime dateTime, String format) {
    return DateFormat(format).format(dateTime);
  }

  static String toBackendString(DateTime dateTime) {
    return DateFormat(DateTimeFormatPattern.dobddMMyyyy).format(dateTime);
  }

  static String? convertString(
      String source, String sourceFormat, String desFormat) {
    try {
      var time = DateFormat(sourceFormat).parse(source);
      return DateFormat(desFormat).format(time);
    } catch (e) {
      return null;
    }
  }
}
