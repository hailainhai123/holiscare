import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:holiscare/constant/routes.dart';
import 'package:holiscare/widget_custom/touchable_opacity.dart';

import '../constant/styles.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';

class ComingSoonPage extends StatelessWidget{
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: TouchableOpacity(
        onTap: () => Get.toNamed(kRouteIndex),
        child: Container(
          color: AppColors.lightPrimary,
          padding:const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.lightPrimary,
                maxRadius: 64,
                child: Image.asset(
                  'assets/images/icon_holiscare.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8,),
              Text(
                'Sắp ra mắt'
                    .toUpperCase(),
                style: Styles.heading4.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Chức năng đang phát triển, vui lòng quay lại ở bản update sau !',
                style: Styles.heading4.copyWith(
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(194, 198, 201, 0.3),
                                offset: Offset(0, 5),
                              ),
                            ],
                            color: AppColors.backgroundButton,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          IconEnums.yellowArrow,
                          color: AppColors.yellow,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.lightPrimary,
                          boxShadow: [
                             BoxShadow(
                              color: Color.fromRGBO(194, 198, 201, 0.3),
                              offset: Offset(4, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'QUAY LẠI TRANG CHỦ',
                          style: Styles.bodyBold
                              .copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
