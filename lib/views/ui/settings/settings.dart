// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:schoolphotoapp/utils/constants/sizes.dart';
// import 'package:schoolphotoapp/utils/my_colors.dart';
// import 'package:schoolphotoapp/viewmodels/auth_view_model.dart';
// import 'package:schoolphotoapp/views/ui/authentication/auth.dart';
// import 'package:schoolphotoapp/views/ui/settings/local_widgets/setting_single_tile.dart';
// import 'package:schoolphotoapp/views/ui/settings/report_problem.dart';
// import 'package:schoolphotoapp/views/widgets/custom_text.dart';
// import 'package:schoolphotoapp/views/widgets/rounded_image_container.dart';

// class SettingsScreen extends StatelessWidget {
//   SettingsScreen({
//     Key? key,
//   }) : super(key: key);
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         toolbarHeight: 0,
//         elevation: 0,
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: Colors.white,
//       body:
//           Consumer<FirebaseAuthViewModel>(builder: (context, authProvider, __) {
//         return Column(
//           // mainAxisAlignment: MainAxisAlignment.start,
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             sizeBoxHeight10,
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
//                   Container(
//                     width: 60.w,
//                     height: 60.h,
//                     padding: EdgeInsets.all(4.r),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                       border: Border.all(color: MyColors.primaryColor),
//                     ),
//                     child: RoundedImage(
//                       height: 52.h,
//                       width: 52.w,
//                       isBorderVisible: false,
//                       imageUrl: authProvider.studentModel.profileUrl ??
//                           'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg',
//                     ),
//                   ),
//                   sizeBoxwidth15,
//                   Flexible(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomText(
//                           text: authProvider.studentModel.fullName != ''
//                               ? authProvider.studentModel.fullName
//                               : 'Jason Ronald',
//                           textStyle: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600,
//                             color: MyColors.blackTextColor,
//                           ),
//                           textOverflow: TextOverflow.clip,
//                           maxLines: 1,
//                         ),
//                         CustomText(
//                           text: authProvider.studentModel.email != ''
//                               ? authProvider.studentModel.email
//                               : 'jason@gmail.com',
//                           textStyle: TextStyle(
//                             fontSize: 14.sp,
//                             color: MyColors.lightgreyColorText,
//                           ),
//                           textOverflow: TextOverflow.clip,
//                           maxLines: 1,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             sizeBoxHeight5,
//             const Divider(
//               color: MyColors.greyColor,
//               thickness: 0.3,
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                   left: 24.w, right: 30.w, top: 15.h, bottom: 12.h),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   // SettingSingleTile(
//                   //   title: 'Profile',
//                   //   leadingIcon: Icons.bug_report,
//                   //   onTap: () {
//                   //     // showMyDialog(context);
//                   //   },
//                   // ),
//                   SettingSingleTile(
//                     title: 'Report a problem',
//                     leadingIcon: Icons.bug_report,
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ReportAProblem()),
//                       );
//                     },
//                   ),
//                   SettingSingleTile(
//                     title: 'Delete account',
//                     leadingIcon: Icons.delete,
//                     onTap: () {
//                       showMyDialog(context);
//                     },
//                   ),
//                   SettingSingleTile(
//                     title: 'Signout',
//                     leadingIcon: Icons.login,
//                     onTap: () {
//                       signoutDialog(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }

//   Future<void> showMyDialog(
//     BuildContext context,
//   ) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: true, // user must tap button!
//       builder: (BuildContext ctx) {
//         return AlertDialog(
//           title: const Text('Do you want to delete your account?'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: const <Widget>[
//                 Text(
//                     'You will not be able to recover your account once confired'),
//               ],
//             ),
//           ),
//           actionsAlignment: MainAxisAlignment.end,
//           actionsPadding: EdgeInsets.only(right: 15.w, left: 12.w),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
//               onPressed: () {
//                 Navigator.of(ctx).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Confirm', style: TextStyle(color: Colors.red)),
//               onPressed: () async {
//                 var provider =
//                     Provider.of<FirebaseAuthViewModel>(context, listen: false);
//                 Navigator.of(ctx).pop();
//                 bool isUserDeleted = await provider.deleteMyAccount(context);
//                 if (isUserDeleted) {
//                   Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(
//                           builder: (context) => const AuthScreen()),
//                       (Route<dynamic> route) => false);
//                 } else {
//                   print('not deleted');
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }


// }
//    Future<void> signoutDialog(
//     BuildContext context,
//   ) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: true, // user must tap button!
//       builder: (BuildContext ctx) {
//         return AlertDialog(
//           title: const Text('Do you want Signout?'),
//           actionsAlignment: MainAxisAlignment.end,
//           actionsPadding: EdgeInsets.only(right: 15.w, left: 12.w),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
//               onPressed: () {
//                 Navigator.of(ctx).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Confirm', style: TextStyle(color: Colors.red)),
//               onPressed: () {
//                 Navigator.of(ctx).pop();
//                 Provider.of<FirebaseAuthViewModel>(context, listen: false)
//                     .signOut(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }