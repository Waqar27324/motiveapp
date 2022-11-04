// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:schoolphotoapp/utils/my_colors.dart';
// import 'package:schoolphotoapp/views/widgets/custom_text.dart';

// class RoundedImage extends StatelessWidget {
//   RoundedImage(
//       {Key? key,
//       required this.height,
//       required this.width,
//       this.isBorderVisible = false,
//       this.isPlusMoreDisplayed = false,
//       this.imageUrl,
//       this.moreStudents = 0})
//       : super(key: key);

//   double height;
//   double width;
//   bool isBorderVisible;
//   bool isPlusMoreDisplayed;
//   int moreStudents;
//   final String? imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     return (!isPlusMoreDisplayed)
//         ? Container(
//             width: height,
//             height: width,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: (isBorderVisible)
//                   ? Border.all(color: MyColors.primaryColor)
//                   : null,
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: CachedNetworkImageProvider(
//                   imageUrl ?? '',
//                 ),
//               ),
//             ),
//           )
//         : Container(
//             width: height,
//             height: width,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: (isBorderVisible)
//                   ? Border.all(color: MyColors.primaryColor)
//                   : null,
//             ),
//             child: CustomText(
//               text: '+$moreStudents',
//               textStyle:
//                   TextStyle(fontSize: 8.sp, color: MyColors.primaryColor),
//             ),
//           );
//   }
// }
