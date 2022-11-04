// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:schoolphotoapp/models/album_model.dart';
// import 'package:schoolphotoapp/utils/constants/sizes.dart';
// import 'package:schoolphotoapp/utils/my_colors.dart';
// import 'package:schoolphotoapp/views/widgets/custom_button.dart';
// import 'package:schoolphotoapp/views/widgets/custom_text.dart';
// import 'package:schoolphotoapp/views/widgets/custom_textfield.dart';

// class ShareScreen extends StatefulWidget {
//   const ShareScreen({Key? key, required this.albumModel}) : super(key: key);

//   final AlbumModel albumModel;

//   @override
//   State<ShareScreen> createState() => _ShareScreenState();
// }

// class _ShareScreenState extends State<ShareScreen> {
//   // Initial Selected Value
//   bool _value = true;
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 0,
//         elevation: 0,
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.start,
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             sizeBoxHeight15,
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//               child: Row(
//                 children: [
//                   InkWell(
//                     splashColor: Colors.transparent,
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(
//                       Icons.arrow_back_ios_new,
//                       color: MyColors.blackTextColor,
//                       size: 24.r,
//                     ),
//                   ),
//                   sizeBoxwidth20,
//                   CustomText(
//                     text: 'Share',
//                     textStyle: TextStyle(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w500,
//                       color: MyColors.blackTextColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             sizeBoxHeight5,
//             const Divider(
//               color: MyColors.greyColor,
//               thickness: 0.6,
//               height: 2,
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                   left: 24.w, right: 24.w, top: 15.h, bottom: 12.h),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CustomeTextField(
//                     hintText: 'Enter email',
//                     isTextFieldBorderVisible: true,
//                     hintStyle: TextStyle(
//                       fontSize: 18.sp,
//                       color: MyColors.lightgreyColorText,
//                     ),
//                     // h: TextInputType.text,
//                   ),
//                   sizeBoxHeight25,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       CustomButton(
//                         text: 'Add To List',
//                         height: 40.h,
//                         onTap: () {},
//                         color: MyColors.primaryColor,
//                         textColor: MyColors.whiteTextColor,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                         borderRadiusValue: 10.r,
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 16.w, vertical: 8.h),
//                       ),
//                       sizeBoxwidth15,
//                       CustomButton(
//                         text: 'Share',
//                         onTap: () {},
//                         color: MyColors.primaryColor,
//                         textColor: MyColors.whiteTextColor,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                         borderRadiusValue: 10.r,
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 16.w, vertical: 8.h),
//                         height: 40.h,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             sizeBoxHeight5,
//             const Divider(
//               color: MyColors.greyColor,
//               thickness: 0.6,
//               height: 2,
//             ),
//             sizeBoxHeight5,
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   CustomText(
//                     text: 'Select all',
//                     textStyle: TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600,
//                       color: MyColors.primaryColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w),
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustomText(
//                         text: 'abdullah123ktk@gmail.com',
//                         textStyle: TextStyle(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w500,
//                           color: MyColors.blackTextColor,
//                         ),
//                       ),
//                       Checkbox(
//                         value: _value,
//                         onChanged: (bool? newValue) {
//                           setState(() {
//                             _value = newValue!;
//                           });
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
