


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:provider/provider.dart';
// import 'package:schoolphotoapp/utils/my_colors.dart';
// import 'package:schoolphotoapp/viewmodels/home_view_model.dart';

// class UploadStreamWidget extends StatelessWidget {
//   const UploadStreamWidget({
//     Key? key,
//     this.lineHeight,
//     this.radius
//   }) : super(key: key);

//   final double? lineHeight;
//   final double? radius;


//   @override
//   Widget build(BuildContext context) {
//     return  Consumer<HomeViewModel>(builder: (context, homeProvider, __) {
//         return StreamBuilder<int>(
//             initialData: homeProvider.progressPercentValue,
//             stream: homeProvider.publishSubject,
//             builder: (builder, snap) {
//               return LinearPercentIndicator(
//                   padding: EdgeInsets.zero,
//                   alignment: MainAxisAlignment.start,
//                   lineHeight: lineHeight ?? 16.h,
//                   percent: (!homeProvider.isInProgressStatus)
//                       ? 1
//                       : snap.data! / 100,
//                   barRadius: Radius.circular(radius ?? 3.r),
//                   progressColor: (homeProvider
//                           .isInProgressStatus)
//                       ? MyColors.greenColorText
//                       : (homeProvider.checkFailedMediaFile())
//                           ? MyColors.orangeColor
//                           : MyColors.primaryColor);
//             });
//       }
//     );
//   }
// }
