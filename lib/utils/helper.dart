import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double widthConvert(BuildContext context, double width) {
  Size size = MediaQuery.of(context).size;
  return size.width * width / 375;
}

double heightConvert(BuildContext context, double height) {
  Size size = MediaQuery.of(context).size;
  return size.height * height / 812;
}

final oCcy = NumberFormat("#,##0", "vi_VN");

String formatCurrency(dynamic number) {
  if (number == null) {
    return "";
  }
  return oCcy.format(double.parse(number).round()).replaceAll(".", ",");
}

bool isNotEmptyNullString(String? value) {
  return value != null && value.isNotEmpty;
}

/// +84123456789 -> 0123456789
/// 84123456789 -> 0123456789
String replacePhoneCode(String phone) {
  if (phone.startsWith('84')) {
    return phone.replaceFirst('84', '0');
  }
  return phone.replaceAll('+84', '0');
}

enum UserStatus { Checking, Signed, NoData }
