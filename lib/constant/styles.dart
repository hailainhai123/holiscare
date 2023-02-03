import 'package:flutter/material.dart';
import 'package:holiscare/utils/colors.dart';

class Styles {
  static TextStyle titleTextStyles = const TextStyle(
      color: Color(0xff19191b), fontSize: 18, fontWeight: FontWeight.w600);

  static BoxDecoration shadowDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
        ), // change
      ]);

  static TextStyle defaultTextStyle = const TextStyle(
    fontSize: 15.0,
  );

  static TextStyle heading = const TextStyle(
    fontFamily: 'InterBold',
  );

  // Use for: Feature introductions. top level headers.
  static TextStyle heading2 = heading.copyWith(
    height: 32 / 26,
    fontSize: 26.0,
    color: AppColors.lightPrimary,
  );


  // Use for: Headings that identify key functionality.
  static TextStyle heading4 = heading.copyWith(
    height: 24 / 18,
    fontSize: 16.0,
    color: AppColors.lightPrimary,
  );

  // Use for: Sub-section and field group headings.
  static TextStyle heading5 = heading.copyWith(
    height: 20 / 14,
    fontSize: 14.0,
    color: AppColors.lightPrimary,
  );

  //Use for: content, main typeface for App
  static TextStyle bodyRegular = defaultTextStyle.copyWith(
    height: 20 / 15,
    fontFamily: 'InterRegular',
  );

  static TextStyle desInsurance = defaultTextStyle.copyWith(
      height: 12 / 10, fontFamily: 'Inter', fontSize: 10);

  // Use for: Highligh content, main typeface
  static TextStyle bodyBold = defaultTextStyle.copyWith(
    height: 20 / 15,
    fontFamily: 'InterBold',
  );

  static TextStyle subtitleLarge = const TextStyle(
    fontSize: 13.0,
    height: 16 / 13,
    fontFamily: 'InterRegular',
  );

  static TextStyle descriptionNoti = const TextStyle(
      height: 16 / 13, fontSize: 13.0, color: AppColors.lightPrimary);

  static TextStyle subtitleSmall = const TextStyle(
      fontSize: 12.0, fontFamily: 'InterRegular', height: 14.0 / 12.0);

  static TextStyle subtitleSmallest = const TextStyle(
      fontSize: 12.0, fontFamily: 'InterRegular', height: 13.0 / 11.0);

  //Use for: paragraph content
  static TextStyle paragraph = defaultTextStyle.copyWith(
    height: 24 / 15,
    fontFamily: 'InterRegular',
  );

  //
  static TextStyle typography = heading.copyWith(
    height: 24 / 12,
    fontSize: 12,
  );

  static TextStyle chartX = const TextStyle(
    fontSize: 8.0,
    fontFamily: 'Inter',
    height: 14.0 / 8.0,
    fontWeight: FontWeight.normal,
  );

  // text button
  static TextStyle textButton = const TextStyle(
    fontFamily: 'InterBold',
  );

  static TextStyle buttonLargeUppercase =
  textButton.copyWith(height: 24 / 15, fontSize: 15.0);

  static TextStyle buttonLargeLowercase =
  textButton.copyWith(height: 24 / 15, fontSize: 15.0);

  static TextStyle buttonSmallUppercase =
  textButton.copyWith(height: 24 / 12, fontSize: 12.0);

  static TextStyle buttonSmallLowercase =
  textButton.copyWith(height: 24 / 12, fontSize: 12.0);

  static TextStyle profileTextStyle = TextStyle(
      height: 24 / 12, fontSize: 12.0, color: Colors.black.withOpacity(0.9));

  // Shadow
  static BoxDecoration deepBase = const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.deepBaseShadow,
        spreadRadius: 8,
        blurRadius: 8,
        offset: Offset(0, 8), // changes position of shadow
      ),
    ],
  );

  static BoxDecoration shadowBase = const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.deepBaseShadow,
        spreadRadius: 4,
        blurRadius: 4,
        offset: Offset(0, 4), // changes position of shadow
      ),
    ],
  );

  static BoxDecoration colored = const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.coloredShadow,
        spreadRadius: 8,
        blurRadius: 8,
        offset: Offset(0, 8), // changes position of shadow
      ),
    ],
  );

  static BoxDecoration topBarShadow = const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.topBarShadow,
        spreadRadius: 4,
        blurRadius: 4,
        offset: Offset(0, 4), // changes position of shadow
      ),
    ],
  );
  static BoxDecoration cardShadow = const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.cardShadow,
        spreadRadius: 4,
        blurRadius: 4,
        offset: Offset(0, 4), // changes position of shadow
      ),
    ],
  );

  static BoxDecoration notificationShadow = const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.notificationShadow,
        spreadRadius: 24,
        blurRadius: 24,
        offset: Offset(0, 24), // changes position of shadow
      ),
    ],
  );

  static BoxDecoration cardButtonShadow = const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.cardShadow,
        spreadRadius: 1,
        blurRadius: 0,
        offset: Offset(0, -2), // changes position of shadow
      ),
    ],
  );

  static Gradient textGradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0.1,
      0.4,
      0.6,
      0.9,
    ],
    colors: [
      Color(0xffffffff),
      // Color(0xfffffa8a),
      // Color(0xffddac17),
      // Color(0xffffff95),
    ],
  );

  static LinearGradient backgroundGradient = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [
        0.1,
        0.4,
        0.6,
        0.9,
      ],
      colors: [
        Color(0xfff5c230),
        Color(0xfffffa8a),
        Color(0xffddac17),
        Color(0xffffff95),
      ]);

  static Shader defaultGradientShared = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    // stops: [
    //   0.1,
    //   0.4,
    //   0.6,
    //   0.9,
    // ],
    colors: [
      Color(0xffffffff),
      Color(0xffffffff),
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static Paint defaultGradientPaint = Paint()..shader = defaultGradientShared;

  static TextStyle getStyleByIndex(bool bool) {
    if (bool) {
      return Styles.heading4.copyWith(
        color: AppColors.background,
      );
    } else {
      return Styles.heading4
          .copyWith(color: AppColors.lightPrimary,);
    }
  }

  static EdgeInsets defaultPageMargin =
  const EdgeInsets.symmetric(horizontal: 16);
}


