import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holiscare/widget_custom/touchable_opacity.dart';

import '../constant/styles.dart';
import '../utils/colors.dart';
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final TextStyle? textStyle;
  final Icon? icon;
  final Color? backgroundColor;
  final Widget? actionIcon;
  final Function()? actionFunc;
  final bool? isBack;
  final Function()? onBack;
  final Widget? flexibleSpaceImage;
  final Widget? leading;
  @override
  final Size preferredSize;

  CustomAppBar({
    Key? key,
    this.title = "",
    this.icon,
    this.textStyle,
    this.backgroundColor = AppColors.lightPrimary,
    this.actionIcon,
    this.actionFunc,
    this.flexibleSpaceImage,
    this.onBack,
    this.isBack = true,
    //leading active when [is back = false]
    this.leading,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? '', style: Styles.heading4.copyWith(
        color: AppColors.black,
            fontSize: 24,
      ),),
      backgroundColor: backgroundColor,
      elevation: 0,
      flexibleSpace: flexibleSpaceImage,
      centerTitle: true,
      leading: isBack ?? false
          ? TouchableOpacity(
              onTap: () {
                if (onBack != null) {
                  onBack!();
                } else {
                  Get.back();
                }
              },
              child: const Icon(
                Icons.chevron_left,
                size: 36,
                color: AppColors.black,
              ),
            )
          : leading ?? const SizedBox(),
      actions: actionFunc != null
          ? <Widget>[
              actionIcon != null
                  ? IconButton(icon: actionIcon!, onPressed: actionFunc)
                  : Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: TouchableOpacity(
                          child: const Text('Lưu', style: TextStyle(color: Colors.black),),
                          onTap: () {
                            if (actionFunc == null) return;
                            actionFunc!();
                          }),
                    ),
            ]
          : null,
    );
  }
}
