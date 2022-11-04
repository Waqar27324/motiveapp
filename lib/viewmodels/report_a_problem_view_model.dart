// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:schoolphotoapp/services/base_model.dart';
// import 'package:schoolphotoapp/services/firebase_storage_service.dart';
// import 'package:schoolphotoapp/services/firestore_service.dart';
// import 'package:schoolphotoapp/utils/enums/view_state.dart';
// import 'package:schoolphotoapp/views/widgets/custom_dexceptions_dialog.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';

// class ReportAProblemViewModel extends BaseModel {
//   List<File> files = [];
//   FilePickerResult? result;
//   bool isInProgressStatus = false;
//   final emailTextController = TextEditingController();
//   final detailTextController = TextEditingController();
//   List<String> screenshotsList = [];

//   pickFiles(context) async {
//     files = [];
// //      final List<AssetEntity>? result = await AssetPicker.pickAssets(
// //         context,
// //         pickerConfig: const AssetPickerConfig(
// //           requestType: RequestType.image,
// //           maxAssets:10,
// //         ),
// //       );
// //       if (result != null) {
// //         for(final assetEntity in result) {
// //           File? singlefile = await assetEntity.originFile;
// //           if(singlefile != null){
// //            files.add(singlefile) ;
// //           }
// //         }
// //         setState(ViewState.Idle);
// // }
// //       else{ }




//             final status;
//       if(Platform.isIOS){
//   status = await Permission.photos.request();
        
//       }
//       else{
//   status = await Permission.mediaLibrary.request();

//       }

//     if (status == PermissionStatus.granted) {
//      final List<AssetEntity>? result = await AssetPicker.pickAssets(
//         context,
//         pickerConfig: const AssetPickerConfig(
//           requestType: RequestType.image,
//           maxAssets:10,
//         ),
//       );
//       if (result != null) {
//         for(final assetEntity in result) {
//           File? singlefile = await assetEntity.originFile;
//           if(singlefile != null){
//            files.add(singlefile) ;
//           }
//         }
//         setState(ViewState.Idle);
// }
//       else{ }
//     } else if (status == PermissionStatus.denied) {
//       await openAppSettings();
//       print('Permission denied');
//     } else if (status == PermissionStatus.permanentlyDenied) {
//       print('Permission Permanently Denied');
//       await openAppSettings();
//     }


//   }

//   uploadStudentsReport(context) async {
//     isInProgressStatus = true;
//     setState(ViewState.Busy);
//     try {
//       var connRes = await Connectivity().checkConnectivity();
//       if (connRes != ConnectivityResult.mobile &&
//           connRes != ConnectivityResult.wifi) {
//         exceptionDialog(
//           context,
//           'No Internet Connection!',
//           'Please check your internet connection and try again.',
//         );
//         return;
//       }
//       if (files.isNotEmpty) {
//         await uploadScreenshotsToFirebaseStorage();
//       }

//       await FirestoreService().uploadStudentsReportToFirestore(
//           emailTextController.text, detailTextController.text, screenshotsList);
//       await clearAllFields();
//       isInProgressStatus = false;
//       setState(ViewState.Idle);
//     } on FirebaseException{
//       exceptionDialog(context, 'Upload Failed!',
//           'Upload failed to database. Please try again later.');
//       isInProgressStatus = false;
//       setState(ViewState.Idle);
//     } catch (e) {
//       exceptionDialog(context, 'Upload Failed!',
//           'Something went wrong while upload. Please try again later.');
//       isInProgressStatus = false;
//       setState(ViewState.Idle);
//     }
//   }

//   uploadScreenshotsToFirebaseStorage() async {
//     try {
//       screenshotsList = [];
//       for (final singleImage in files) {
//         String downloadLink = await FirestoreStorageService()
//             .uplioadReportScreenshot(singleImage);
//         // if (downloadLink != null) {}
//         screenshotsList.add(downloadLink);
//       }
//     } on FirebaseException {
//       rethrow;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> clearAllFields() async {
//     emailTextController.clear();
//     detailTextController.clear();
//     files = [];
//   }
// }
