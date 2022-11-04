// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:schoolphotoapp/utils/my_colors.dart';
// import 'package:schoolphotoapp/views/widgets/custom_text.dart';

// class SettingSingleTile extends StatelessWidget {
//   const SettingSingleTile({
//     Key? key,
//     required this.title,
//     required this.leadingIcon,
//     required this.onTap,
//   }) : super(key: key);

//   final String title;
//   final IconData leadingIcon;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       minVerticalPadding: 10.h,
//       horizontalTitleGap: 16.w,
//       leading: Container(
//         decoration: BoxDecoration(
//           color: MyColors.lightGreyWidgetBckColor,
//           borderRadius: BorderRadius.circular(10.r),
//         ),
//         padding: EdgeInsets.all(8.r),
//         child: Icon(leadingIcon, color: MyColors.blackTextColor, size: 20.r),
//       ),
//       title: CustomText(
//         textAlign: TextAlign.left,
//         text: title,
//         textStyle: TextStyle(
//           fontSize: 16.sp,
//           color: MyColors.blackTextColor,
//         ),
//       ),
//       trailing: Icon(
//         Icons.arrow_forward_ios,
//         color: MyColors.darkGreyClr,
//         size: 20.r,
//       ),
//       onTap: onTap,
//     );
//   }
// }
