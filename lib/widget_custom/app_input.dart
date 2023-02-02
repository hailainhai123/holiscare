import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/styles.dart';
import '../constant/constants.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';

class AppInput extends StatefulWidget {
  final Function(String)? onChangeValue;
  final Function(TextEditingController)? onChanged;
  final Function(String?)? onSavedValue;
  final Function()? onTapIconRight;
  final Function(TextEditingController)? onBlur;
  final List<TextInputFormatter>? listFormat;
  final String? validationError;
  final bool? enableInteractiveSelection;
  final TextEditingController? controller;
  final String title;
  final String? hintText;
  final bool obscureText;
  final int? maxLine;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final String? iconLeft;
  final String? iconRight;
  final String? value;
  final String? textValue;
  final bool? isDense;
  final bool isDisable;
  final TextInputType? keyboardType;
  final bool isDateTimeInput;
  final int? maxLength;
  final bool? enabled; // this filed if true will make disable text error.
  final OutlineInputBorder? enabledBorder;
  final Widget? rightWidget;
  final String? errorText;
  final dynamic iconLeftWidget;
  final TextCapitalization? textCapitalization;
  final bool? autofocus;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final Function()? onTapField;
  final TextStyle? styleField;
  final Color? colorRightIcon;
  final double? sizeIconRight;
  const AppInput(
      {Key? key,
      this.errorText,
      this.onChangeValue,
      this.validator,
      this.title = "",
      this.hintText,
      this.obscureText = false,
      this.iconLeft,
      this.iconRight,
      this.onTapIconRight,
      this.value,
      this.isDisable = false,
      this.validationError,
      this.keyboardType,
      this.isDateTimeInput = false,
      this.maxLength,
      this.enabled,
      this.onSavedValue,
      this.enabledBorder,
      this.rightWidget,
      this.onBlur,
      this.onChanged,
      this.textValue,
      this.listFormat,
      this.enableInteractiveSelection,
      this.textCapitalization,
      this.iconLeftWidget,
      this.autofocus,
      this.controller,
      this.fillColor,
      this.hintStyle,
      this.isDense,
      this.maxLine = 1,
      this.contentPadding,
      this.onTapField,
      this.styleField, this.colorRightIcon, this.sizeIconRight})
      : super(key: key);

  @override
  _AppInputState createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool _hidePass = true;
  TextEditingController textEditController = TextEditingController();
  late FocusNode _focus;
  bool focused = false;
  String inputText = '';

  @override
  void initState() {
    _focus = FocusNode();
    _focus.addListener(() {
      if (_focus.hasFocus) {
        setState(() {
          focused = true;
        });
      } else {
        if (widget.onBlur != null) {
          widget.onBlur!(textEditController);
        }
        setState(() {
          focused = false;
        });
      }
    });
    onChangeValue(widget.value ?? "");
    super.initState();
  }

  @override
  void dispose() {
    textEditController.dispose();
    _focus.dispose();
    super.dispose();
  }

  void toggleShowPass() {
    if (widget.obscureText) {
      _focus.requestFocus();
      setState(() {
        _hidePass = !_hidePass;
      });
    }
  }

  void onChangeValue(String value) {
    if (widget.isDateTimeInput) {}
    textEditController.text = value;
  }

  @override
  void didChangeDependencies() {
    if (widget.textValue != null) {
      textEditController.text = widget.textValue ?? "";
      inputText = widget.textValue!;
    }
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant AppInput oldWidget) {
    if (widget.value != null && widget.value != oldWidget.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onChangeValue(widget.value ?? "");
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.title.isNotEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0.0),
                  child: Text(widget.title,
                      style: Styles.heading4
                          .copyWith(color: AppColors.black)),
                )
              : const SizedBox(),
          TextFormField(
            style: widget.styleField,
            onTap: widget.onTapField,
            maxLines: widget.maxLine,
            autofocus: widget.autofocus ?? false,
            focusNode: _focus,
            keyboardType: widget.keyboardType,
            readOnly: widget.isDisable,
            obscureText: widget.obscureText ? _hidePass : false,
            textAlign: TextAlign.justify,
            controller: widget.controller ?? textEditController,
            autocorrect: false,
            enableSuggestions: false,
            maxLength: widget.maxLength,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            enableInteractiveSelection:
                widget.enableInteractiveSelection ?? true,
            enabled: widget.enabled,
            decoration: InputDecoration(
              labelText: widget.hintText,
              counterText: "",
              fillColor: widget.fillColor ?? Colors.white,
              border: InputBorder.none,
              isDense: widget.isDense,
              filled: true,
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              prefixIcon: widget.iconLeft != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 14),
                      child: widget.iconLeftWidget ??
                          SvgPicture.asset(widget.iconLeft!,
                              width: 10,
                              height: 10,
                              fit: BoxFit.contain,
                              color: focused
                                  ? AppColors.neutral600
                                  : AppColors.grayLight),
                    )
                  : null,
              suffixIcon: widget.iconRight == IconEnums.close
                  ? hidingIcon()
                  : rightIcon(),
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ??
                  Styles.bodyRegular.copyWith(color: AppColors.grayLight),
              enabledBorder: widget.enabledBorder ??
                  const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                          ViewConstants.defaultBorderRadiusBtn),
                    ),
                    borderSide: BorderSide(color: AppColors.lightSilver),
                  ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.neutral300),
                borderRadius: BorderRadius.all(
                  Radius.circular(ViewConstants.defaultBorderRadiusBtn),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(ViewConstants.defaultBorderRadiusBtn),
                ),
                borderSide: BorderSide(color: AppColors.dodgerBlue),
              ),
              errorText: widget.errorText,
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(ViewConstants.defaultBorderRadiusBtn),
                ),
                borderSide: BorderSide(color: AppColors.error700),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(ViewConstants.defaultBorderRadiusBtn),
                ),
                borderSide: BorderSide(color: AppColors.error700),
              ),
            ),
            validator: widget.validator ??
                (value) {
                  String? res;
                  if (widget.errorText != null &&
                      widget.errorText!.isNotEmpty) {
                    res = widget.errorText;
                  }
                  if (widget.validationError != null) {
                    res = widget.validationError;
                  }
                  return res;
                },
            onChanged: (value) {
              setState(
                () {
                  inputText = value;
                },
              );
              if (widget.onChanged != null) {
                widget.onChanged!(textEditController);
                return;
              }
              if (widget.onChangeValue != null) {
                widget.onChangeValue!(value);
              }
            },
            inputFormatters: widget.listFormat,
            onSaved: (value) {
              if (widget.onSavedValue != null) {
                widget.onSavedValue!(value!);
              }
              setState(
                () {
                  inputText = value!;
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget hidingIcon() {
    if (widget.iconRight != null && widget.controller!.text.isNotEmpty) {
      return IconButton(
          icon: SvgPicture.asset(
            IconEnums.close,
            width: 16,
            height: 16,
            fit: BoxFit.contain,
          ),
          onPressed: widget.onTapIconRight ??
              () {
                setState(() {
                  _focus.requestFocus();
                  textEditController.clear();
                  if (widget.onChanged != null) {
                    widget.onChanged!(textEditController);
                    return;
                  }
                  if (widget.onChangeValue != null) {
                    widget.onChangeValue!('');
                  }
                  inputText = "";
                });
              });
    } else {
      return const SizedBox(
        width: 16,
      );
    }
  }

  Widget rightIcon() {
    if (widget.obscureText) {
      return IconButton(
          onPressed: () {
            toggleShowPass();
          },
          icon: _hidePass
              ? SvgPicture.asset(
                  IconEnums.eye,
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                  color: focused ? AppColors.neutral600 : AppColors.grayLight,
                )
              : SvgPicture.asset(
                  IconEnums.eyeOff,
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                  color: focused ? AppColors.dodgerBlue : AppColors.grayLight,
                ));
    }
    if (widget.iconRight != null) {
      return IconButton(
          onPressed: () {
            widget.onTapIconRight!();
          },
          icon: SvgPicture.asset(
            widget.iconRight!,
            width: widget.sizeIconRight??16,
            height: widget.sizeIconRight??16,
            fit: BoxFit.contain,
            color: widget.colorRightIcon,
          ));
    } else {
      return const SizedBox(
        width: 16,
      );
    }
  }
}
