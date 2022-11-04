import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motiveapp/utils/my_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final double borderRadiusValue;
  final double? width;
  final double? height;
  final bool selected;
  final bool disableBorder;
  final VoidCallback? onTap;
  const CustomButton({
    required this.text,
    this.onTap,
    this.color: Colors.transparent,
    this.gradient,
    this.textColor: Colors.white,
    this.fontSize: 14,
    this.fontWeight: FontWeight.normal,
    this.borderRadiusValue: 10,
    this.width,
    this.height,
    this.selected: false,
    this.padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
    this.disableBorder: false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: gradient == null
              ? !selected
                  ? color
                  : MyColors.whiteTextColor
              : null,
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadiusValue.r),
          // border: disableBorder ? null : Border.all(color: Colors.red),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: !selected ? textColor : Colors.white,
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
