import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motiveapp/utils/my_colors.dart';

class CustomeTextField extends StatelessWidget {
  final String? title;
  final hintText;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final bool visible;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? trailingWidget;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final bool isEditable;
  final bool isTextFieldBorderVisible;
  final bool isSizedBoxGiven;
  final double? height;
  final double? width;
  final double? textAreaHeight;
  final AutovalidateMode? autoValidateMode;

  const CustomeTextField({
    this.title,
    this.hintText,
    this.titleStyle,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.trailingWidget,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.visible = true,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.hintStyle,
    this.isEditable = false,
    this.isTextFieldBorderVisible = false,
    this.isSizedBoxGiven = false,
    this.height,
    this.width,
    this.textAreaHeight,
    this.autoValidateMode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: textAreaHeight ?? 61.h,
      // padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(title!,
                textAlign: TextAlign.left,
                style: titleStyle ?? const TextStyle(color: Colors.black)),
          if (isSizedBoxGiven)
            SizedBox(
              height: 12.h,
            ),
          SizedBox(
            height: height ?? 60.h,
            child: TextFormField(
              autovalidateMode: autoValidateMode,
              cursorColor: MyColors.blackTextColor,
              cursorHeight: 10.h,
              cursorRadius: Radius.zero,
              controller: controller,
              validator: validator,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              textCapitalization: textCapitalization,
              readOnly: readOnly,
              maxLines: maxLines ?? 1,
              minLines: minLines ?? 1,
              textInputAction: TextInputAction.newline,
              style: TextStyle(color: MyColors.blackTextColor, fontSize: 18.sp),
              decoration: (!isTextFieldBorderVisible)
                  ? InputDecoration(
                      // border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: hintStyle,

                      // contentPadding: EdgeInsets.symmetric(vertical: -10.h)
                    )
                  : InputDecoration(
                      // contentPadding: EdgeInsets.symmetric(vertical: -10.h),
                      hintText: hintText,
                      hintStyle: hintStyle,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                              color: MyColors.greyColor, width: 0.8)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: MyColors.greyColor, width: 0.8)),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
