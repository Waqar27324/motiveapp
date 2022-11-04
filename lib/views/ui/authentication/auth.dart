// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:schoolphotoapp/utils/constants/sizes.dart';
// import 'package:schoolphotoapp/utils/enums/view_state.dart';
// import 'package:schoolphotoapp/utils/my_colors.dart';
// import 'package:schoolphotoapp/viewmodels/auth_view_model.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({Key? key}) : super(key: key);

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   @override
//   final Widget svg = SvgPicture.asset(
//     'assets/svgs/login.svg',
//     // height: 330.h,
//     // width: 295.w,
//   );
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Consumer<FirebaseAuthViewModel>(builder: (context, provider, __) {
//         return Padding(
//           padding: EdgeInsets.only(
//               left: 47.w, right: 47.w, top: 100.h, bottom: 40.h),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 250.h,
//                 width: 295.w,
//                 child: Image.asset('assets/images/school_app_logo.jpeg',
//                     fit: BoxFit.fill),
//               ),
//               SizedBox(height: 190.h),
//               GestureDetector(
//                 onTap: () {
//                   if (provider.state != ViewState.Busy) {
//                     provider.logInWithGoogle(context);
//                   }
//                   // Navigator.pushNamed(context, '/signup');
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => const HomeScreen()
//                   //   ),
//                   // );
//                 },
//                 child: Container(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.h),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(10.r),
//                   ),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         'assets/svgs/google_icon.svg',
//                         height: 20.h,
//                         width: 20.w,
//                       ),
//                       sizeBoxwidth15,
//                       Text(
//                         'SignIn with Google',
//                         style: TextStyle(
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.w500,
//                           color: (provider.state != ViewState.Busy)
//                               ? MyColors.blackTextColor
//                               : MyColors.lightgreyColorText,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               if (provider.state == ViewState.Busy)
//                 Column(
//                   children: [
//                     sizeBoxHeight20,
//                     const SizedBox(
//                       child: Center(
//                         child: CircularProgressIndicator(
//                           color: MyColors.primaryColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               const Spacer(),
//               Center(
//                 child: RichText(
//                   // textAlign: TextAlign.center,
//                   text: TextSpan(
//                     text: 'This app is developed by ',
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       color: MyColors.blackTextColor,
//                     ),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: 'CooKoo',
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600,
//                           color: MyColors.primaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
