// // ignore_for_file: avoid_print


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:paginate_firestore/paginate_firestore.dart';
// import 'package:provider/provider.dart';
// import 'package:schoolphotoapp/models/activity_model.dart';
// import 'package:schoolphotoapp/services/notification_services.dart';
// import 'package:schoolphotoapp/utils/constants/sizes.dart';
// import 'package:schoolphotoapp/utils/constants/text_styles.dart';
// import 'package:schoolphotoapp/utils/mthods/background_service_methods.dart';
// import 'package:schoolphotoapp/utils/my_colors.dart';
// import 'package:schoolphotoapp/viewmodels/auth_view_model.dart';
// import 'package:schoolphotoapp/viewmodels/home_view_model.dart';
// import 'package:schoolphotoapp/views/testingdrive/google_drive.dart';
// import 'package:schoolphotoapp/views/ui/activity/activity.dart';
// import 'package:schoolphotoapp/views/ui/home/local_widgets/select_mediafiles_bottomsheet.dart';
// import 'package:schoolphotoapp/views/ui/home/local_widgets/single_uploaded_album_activity.dart';
// import 'package:schoolphotoapp/views/ui/settings/settings.dart';
// import 'package:schoolphotoapp/views/ui/waitingforadminapproval/waiting_for_admin_approval.dart';
// import 'package:schoolphotoapp/views/widgets/custom_text.dart';
// import 'package:schoolphotoapp/views/widgets/rounded_image_container.dart';
// import 'package:schoolphotoapp/views/widgets/upload_stream_widget.dart';
// import 'package:schoolphotoapp/views/widgets/widget_animator.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver{
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


//   late HomeViewModel viewmodel;
//   late FirebaseAuthViewModel authProvider;


//   @override
//   void initState() {
//     super.initState();
//     viewmodel = Provider.of<HomeViewModel>(context, listen: false);
    
//     WidgetsBinding.instance.addObserver(this);
//     print("InitState");
//   }
// @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     print("DidChangeDependencies");
//      viewmodel = Provider.of<HomeViewModel>(context, listen: false);
//   }
// @override
//   void setState(fn) {
//     print("SetState");
//     super.setState(fn);
//   }
// @override
//   void deactivate() {
//     print("Deactivate");
//     super.deactivate();
//   }
// @override
//   void dispose() {
//     print("Dispose");
//     super.dispose();
//     WidgetsBinding.instance.removeObserver(this);
//   }
// @override
//   void didChangeAppLifecycleState(AppLifecycleState state) async {
//     super.didChangeAppLifecycleState(state);
//     switch (state) {
//       case AppLifecycleState.inactive:
//         print('appLifeCycleState inactive');
//         break;
//       case AppLifecycleState.resumed:
//         print('appLifeCycleState resumed');
//         if (viewmodel.isInProgressStatus) {
//           print('upload is in progress');
//         } else {
//           print('upload is not in progress');
//         }
//         break;
//       case AppLifecycleState.paused:
//         print('appLifeCycleState paused');
//         if (viewmodel.isInProgressStatus) {
//           print('upload is in progress');
//           viewmodel.onPauseOccured();
//         } else {
//           if (viewmodel.mediaFilesList.isNotEmpty) {
//             await viewmodel.updateAndStoreMediaItemsDataIntoLocalDatabase(
//                 viewmodel.mediaFilesList, 'paused',  true);
//           }
//           print('upload is not in progress');
//         }
//         break;
//       case AppLifecycleState.detached:
//         print('appLifeCycleState detached');
//         if (viewmodel.isInProgressStatus) {
//           print('upload is in progress');
//           viewmodel.onDetachedOccured(context);
//         } else {
//           if (viewmodel.mediaFilesList.isNotEmpty) {
//             await viewmodel.updateAndStoreMediaItemsDataIntoLocalDatabase(
//                 viewmodel.mediaFilesList, 'detached',  true);
//           }
//         }
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     viewmodel = Provider.of<HomeViewModel>(context, listen: false);
//     // final provider = Provider.of<FirebaseAuthViewModel>(context, listen: false);
//     //   provider.watchDayNight();
//     authProvider =
//         Provider.of<FirebaseAuthViewModel>(context, listen: false);
//     if(authProvider.studentModel.allowToUpload == false){
//       Future.delayed(const Duration(seconds: 2) , (){
//       Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => const WaitingApproval()),
//         (Route<dynamic> route) => false);
//     });
//     }
    
//     return WillPopScope(
//       onWillPop: () async {
//         final shouldPop = await showDialog<bool>(
//           context: context,
//           builder: (context) {
//             return 
//             // (viewmodel.isInProgressStatus)
//             // ?
//             // AlertDialog(
//             //   title: const Text('Do you want to continue download in background?'),
//             //   actionsAlignment: MainAxisAlignment.spaceBetween,
//             //   actions: [
//             //     TextButton(
//             //       onPressed: () {
//             //         Navigator.pop(context, true);
//             //       },
//             //       child: const Text('Yes'),
//             //     ),
//             //     TextButton(
//             //       onPressed: () {
//             //         Navigator.pop(context, false);
//             //       },
//             //       child: const Text('No'),
//             //     ),
//             //   ],
//             // )
//             // :
//             AlertDialog(
//               title: const Text('Do you want to close the?'),
//               actionsAlignment: MainAxisAlignment.spaceBetween,
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context, true);
//                   },
//                   child: const Text('Yes'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context, false);
//                   },
//                   child: const Text('No'),
//                 ),
//               ],
//             );
//           },
//         );
//         return shouldPop!;
//       },
//       child: Scaffold(
//         key: _scaffoldKey,
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         backgroundColor: Colors.white,
//         floatingActionButton: Consumer<HomeViewModel>(
//                     builder: (context, homeProvider, __) {
//             return FloatingActionButton(
//               onPressed: () {

//                 if(!homeProvider.isInProgressStatus){
//                   selectMediaFilesBottomSheet(context, //(){}
//                 () {
//                   homeProvider.pickAndUploadFile(2, context, isFilesSelected: false);
//                 }
//                 );
//                 }


                
//               },
//               backgroundColor: (homeProvider.isInProgressStatus) ? MyColors.lightgreyColorText :  MyColors.primaryColor,
//               child: Icon(
//                 Icons.add,
//                 size: 30.r,
//               ),
//             );
//           }
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.w),
//             child: Column(
//               children: [
//                 sizeBoxHeight5,
//                 Consumer<FirebaseAuthViewModel>(
//                     builder: (context, authProvider, __) {
//                   return MyWidgetsAnimator(
//                     errorWidget: () => Center(
//                       child: CustomText(
//                         text: authProvider.getDayNight(),
//                         textStyle: goodMorningStyle,
//                         maxLines: 1,
//                         textOverflow: TextOverflow.clip,
//                       ),
//                     ),
//                     apiCallStatus: authProvider.state,
//                     loadingWidget: () => Center(
//                       child: CustomText(
//                         text: authProvider.getDayNight(),
//                         textStyle: goodMorningStyle,
//                         maxLines: 1,
//                         textOverflow: TextOverflow.clip,
//                       ),
//                     ),
//                     // successWidget: () => Text("scces"),
//                     successWidget: () => Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Flexible(
//                           child: CustomText(
//                             textAlign: TextAlign.left,
//                             text: (authProvider.studentModel.fullName == '')
//                                 ? authProvider.getDayNight()
//                                 : '${authProvider.getDayNight()} ${authProvider.studentModel.fullName}',
//                             textStyle: goodMorningStyle,
//                             maxLines: 1,
//                             textOverflow: TextOverflow.clip,
//                           ),
//                         ),
//                         sizeBoxwidth5,
//                         Row(children: [
//                           InkWell(
//                             onTap: () async {
//                               // ActivityModel? activity =
//                               //     await LocalDatabaseService()
//                               //         .getAnActivity(context);
//                               // print(lastActivity.mdiaFilesList?.length);
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => GoogleDriveTesting()),
//                               );
//                             },
//                             child: SvgPicture.asset(
//                               'assets/svgs/sunrise.svg',
//                               height: 26.h,
//                               width: 26.w,
//                             ),
//                           ),
//                           sizeBoxwidth5,
//                           InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => SettingsScreen()),
//                               );
//                             },
//                             splashColor: Colors.transparent,
//                             radius: 45.r,
//                             child: Container(
//                               width: 45.w,
//                               height: 45.h,
//                               padding: EdgeInsets.all(3.w),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.white,
//                                 border: Border.all(color: MyColors.primaryColor),
//                               ),
//                               child: RoundedImage(
//                                 height: 35.h,
//                                 width: 35.w,
//                                 isBorderVisible: false,
//                                 imageUrl: authProvider.studentModel.profileUrl ??
//                                     'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg',
//                               ),
//                             ),
//                           ),
//                         ])
//                       ],
//                     ),
//                   );
//                 }),
//                 sizeBoxHeight35,
//                 Consumer<HomeViewModel>(builder: (context, homeProvider, __) {
//                   return Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           CustomText(
//                             text: 'Last Activity',
//                             textStyle: subHeading,
//                           ),
//                           InkWell(
//                             splashColor: Colors.transparent,
//                             highlightColor: Colors.transparent,
//                             onTap: () {
//                               // homeProvider
//                               //     .uploadMediaItemsAndGetListOfTokens(context);
//                             },
//                             child: CustomText(
//                               text: homeProvider.isInProgressStatus
//                                   ? 'InProgress'
//                                   : (homeProvider.checkFailedMediaFile())
//                                       ? 'InComplete'
//                                       : 'Completed',
//                               textStyle: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w500,
//                                 color: homeProvider.isInProgressStatus
//                                     ? MyColors.greenColorText
//                                     : (homeProvider.checkFailedMediaFile())
//                                         ? MyColors.orangeColor
//                                         : MyColors.primaryColor,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       sizeBoxHeight15,
//                       GestureDetector(
//                         onTap: (){
//                           Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const ActivityScreen()),
//                                     );
//                         },
//                         child: Container(
//                           height: 83.h,
//                           padding: EdgeInsets.all(16.r),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: MyColors.lightGreyWidgetBckColor),
//                               borderRadius: BorderRadius.circular(15.r)),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               UploadStreamWidget(
//                                 lineHeight: 16.h,
//                                 radius: 3.r,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   CustomText(
//                                     text: (homeProvider.isInProgressStatus)
//                                         ? '${homeProvider.currentUploadIndex} of ${homeProvider.mediaFilesList.length} uploaded'
//                                         : '${homeProvider.getSuccessUploads()} of ${homeProvider.mediaFilesList.length} uploaded',
//                                     textStyle: TextStyle(
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.w500,
//                                         color: MyColors.lightgreyColorText),
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const ActivityScreen()),
//                                       );
//                                       },
//                                     child: CustomText(
//                                       text: 'See Detail >',
//                                       textStyle: TextStyle(
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.w500,
//                                         color: MyColors.blackTextColor,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//                 sizeBoxHeight25,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     CustomText(
//                       text: 'Recent Activity',
//                       textStyle: subHeading,
//                     ),
//                   ],
//                 ),
//                 sizeBoxHeight15,
//                 Expanded(
//                   child: Consumer<FirebaseAuthViewModel>(
//                       builder: (context, authProvider, __) {
//                     return ScrollConfiguration(
//                       behavior: const ScrollBehavior(
//                           androidOverscrollIndicator:
//                               AndroidOverscrollIndicator.glow),
//                       child: PaginateFirestore(
//                         // shrinkWrap: true,
//                         itemBuilder: (context, documentSnapshots, index) {
//                           final singleActivity = ActivityModel.fromMap(
//                               documentSnapshots[index].data()
//                                   as Map<String, dynamic>);
//                           return Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Visibility(
//             visible: getChatDateHeaderVisibility(documentSnapshots, index),
//             child: Padding(
//               padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
//               child: Text(getChatDateHeaderText(singleActivity.id),
//                   style: TextStyle(color: MyColors.greyColor, fontSize: 14.sp)),
//             ),
//           ),
//                               Padding(
//                                 padding: EdgeInsets.only(bottom: 16.h),
//                                 child: SingleUploadedAlbumActivity(
//                                   activity: singleActivity, //singleActivity
//                                   uploadedDate: DateTime.fromMillisecondsSinceEpoch(singleActivity.id! ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                         // orderBy is compulsory to enable pagination
//                         query: FirebaseFirestore.instance
//                             .collection('all_activities')
//                             .doc(FirebaseAuth.instance.currentUser!.uid)
//                             .collection('student_activities')
//                             .orderBy('id', descending: true),
//                         //Change types accordingly
//                         itemBuilderType: PaginateBuilderType.listView,
//                         // to fetch real-time data
//                         isLive: true,
//                         // itemsPerPage from firestore
//                         itemsPerPage: 10,
//                         // initial loader
//                         initialLoader: const Center(
//                           child: CircularProgressIndicator(
//                             color: MyColors.primaryColor,
//                           ),
//                         ),
//                         // bottom loader
//                         bottomLoader: const Center(
//                           child: CircularProgressIndicator(
//                             color: MyColors.primaryColor,
//                           ),
//                         ),
//                         onEmpty: Align(
//                           alignment: Alignment.topCenter,
//                           child: Text(
//                             'Not Found',
//                             style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: MyColors.blackTextColor,
//                             ),
//                           ),
//                         ),
//                         onError: (Exception e) {
//                           return Center(
//                             child: Text(
//                               'Error occured',
//                               style: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w500,
//                                 color: MyColors.blackTextColor,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

