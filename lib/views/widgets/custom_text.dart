import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motiveapp/utils/my_colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  const CustomText(
      {Key? key,
      @required this.text,
      @required this.textStyle,
      this.maxLines,
      this.textOverflow,
      this.textAlign})
      : super(key: key);

  // const CustomText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: textStyle ??
          TextStyle(fontSize: 18.sp, color: MyColors.blackTextColor),
      maxLines: maxLines ?? 1,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
