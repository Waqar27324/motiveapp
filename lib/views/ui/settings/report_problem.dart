// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:schoolphotoapp/utils/constants/sizes.dart';
// import 'package:schoolphotoapp/utils/my_colors.dart';
// import 'package:schoolphotoapp/viewmodels/report_a_problem_view_model.dart';
// import 'package:schoolphotoapp/views/widgets/custom_text.dart';
// import 'package:schoolphotoapp/views/widgets/custom_textfield.dart';

// class ReportAProblem extends StatefulWidget {
//   const ReportAProblem({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ReportAProblem> createState() => _ReportAProblemState();
// }

// class _ReportAProblemState extends State<ReportAProblem> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ReportAProblemViewModel>(
//         builder: (context, reportProvider, __) {
//       return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           // toolbarHeight: 0,
//           titleSpacing: 8.w,
//           centerTitle: false,
//           leading: InkWell(
//             splashColor: Colors.transparent,
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back_ios_new,
//               color: MyColors.blackTextColor,
//               size: 24.r,
//             ),
//           ),

//           title: CustomText(
//             text: 'Report a problem',
//             textStyle: TextStyle(
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w500,
//               color: MyColors.blackTextColor,
//             ),
//           ),

//           actions: [
//             Container(
//               alignment: Alignment.center,
//               padding: EdgeInsets.only(
//                 right: 24.w,
//               ),
//               child: (reportProvider.isInProgressStatus)
//                   ? SizedBox(
//                       height: 24.h,
//                       width: 24.w,
//                       child: const CircularProgressIndicator(
//                         color: MyColors.primaryColor,
//                       ),
//                     )
//                   : InkWell(
//                       splashColor: Colors.transparent,
//                       onTap: () async {
//                         if (!reportProvider.isInProgressStatus) {
//                           if (_formKey.currentState!.validate()) {
//                             await reportProvider.uploadStudentsReport(context);
//                           }
//                         }
//                       },
//                       child: CustomText(
//                         text: 'Report',
//                         textStyle: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600,
//                           color: (!reportProvider.isInProgressStatus)
//                               ? MyColors.primaryColor
//                               : MyColors.greyColor,
//                         ),
//                       ),
//                     ),
//             ),
//           ],
//           backgroundColor: Colors.white,
//         ),
//         bottomSheet: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (reportProvider.files.isNotEmpty)
//                   SizedBox(
//                     height: 75.h,
//                     child: ListView.builder(
//                         itemCount: reportProvider.files.length,
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemBuilder: (BuildContext ctxt, int index) {
//                           return Container(
//                             width: 56.w,
//                             height: 72.h,
//                             margin: EdgeInsets.only(right: 12.w),
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: FileImage(reportProvider.files[index]),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           );
//                         }),
//                   ),
//                 sizeBoxHeight12,
//                 const Divider(
//                   color: MyColors.greyColor,
//                   thickness: 0.4,
//                   height: 2,
//                 ),
//                 sizeBoxHeight5,
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 6.w),
//                   child: ListTile(
//                     horizontalTitleGap: 5.w,
//                     contentPadding: EdgeInsets.zero,
//                     visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
//                     leading: Container(
//                       height: 20.h,
//                       width: 20.w,
//                       decoration: BoxDecoration(
//                           color: MyColors.greyImageIconBckColor,
//                           borderRadius: BorderRadius.circular(5.r)),
//                       child: Icon(
//                         Icons.photo_library,
//                         color: MyColors.blackTextColor,
//                         size: 11.r,
//                       ),
//                     ),
//                     title: CustomText(
//                         text: 'Select screenshot from gallery',
//                         textAlign: TextAlign.start,
//                         textStyle: TextStyle(
//                           fontSize: 14.sp,
//                           color: MyColors.blackTextColor,
//                         )),
//                     onTap: () {
//                       reportProvider.pickFiles(context);
//                     },
//                   ),
//                 ),
//                 // sizeBoxHeight5,
//               ],
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.only(
//                 left: 24.w, right: 24.w, top: 16.h, bottom: 12.h),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CustomeTextField(
//                     hintText: 'Enter you’re email',
//                     autoValidateMode: AutovalidateMode.onUserInteraction,
//                     controller: reportProvider.emailTextController,
//                     validator: (value) {
//                       if (value == null ||
//                           value.isEmpty ||
//                           !value.contains('@')) {
//                         return 'Please enter correct email.';
//                       }
//                       return null;
//                     },
//                     isTextFieldBorderVisible: false,
//                     hintStyle: TextStyle(
//                       fontSize: 16.sp,
//                       color: MyColors.lightgreyColorText,
//                     ),
//                   ),
//                   sizeBoxHeight10,
//                   CustomeTextField(
//                     height: 200.h,
//                     hintText: 'What went wrong? Explain in detail.',
//                     autoValidateMode: AutovalidateMode.onUserInteraction,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please give some detail.';
//                       }
//                       return null;
//                     },
//                     controller: reportProvider.detailTextController,
//                     isTextFieldBorderVisible: false,
//                     hintStyle: TextStyle(
//                       fontSize: 16.sp,
//                       color: MyColors.lightgreyColorText,
//                     ),
//                     keyboardType: TextInputType.multiline,
//                     maxLines: 15,
//                     minLines: 15,

//                     textAreaHeight: 200.h,
//                     // h: TextInputType.text,
//                   ),
//                   sizeBoxHeight10,
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
