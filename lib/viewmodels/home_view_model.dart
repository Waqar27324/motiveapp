// // ignore_for_file: avoid_print

// import 'dart:async';
// import 'dart:io';
// import 'dart:math';
// import 'dart:typed_data';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:export_video_frame/export_video_frame.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:path/path.dart' as path;
// import 'package:file_picker/file_picker.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';
// import 'package:schoolphotoapp/models/activity_model.dart';
// import 'package:schoolphotoapp/models/media_file_model.dart';
// import 'package:schoolphotoapp/models/util_progrss_model.dart';
// import 'package:schoolphotoapp/services/base_model.dart';
// import 'package:schoolphotoapp/services/firestore_service.dart';
// import 'package:schoolphotoapp/services/google_drive_api_service.dart';
// import 'package:schoolphotoapp/services/local_db_service.dart';
// import 'package:schoolphotoapp/services/notification_services.dart';
// import 'package:schoolphotoapp/services/photo_api_sevice.dart';
// import 'package:schoolphotoapp/utils/enums/view_state.dart';
// import 'package:schoolphotoapp/utils/exceptions/custom_exception.dart';
// import 'package:schoolphotoapp/viewmodels/auth_view_model.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:schoolphotoapp/views/widgets/custom_dexceptions_dialog.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';

// class HomeViewModel extends BaseModel {
//   List<MediaFileModel> mediaFilesList = [];
//   List<File> files = [];
//   final ImagePicker _picker = ImagePicker();
//   FilePickerResult? result;
//   bool isInProgressStatus = false;
//   int currentUploadIndex = -1;
//   double progressValue = 0;
//   int progressPercentValue = 0;

//   pickAndUploadFile(int fileSourceIndex, context, {bool isFilesSelected = false}) async {
//     var connRes = await Connectivity().checkConnectivity();

//     if (connRes != ConnectivityResult.mobile &&
//         connRes != ConnectivityResult.wifi) {
//       exceptionDialog(
//         context,
//         'No Internet Connection!',
//         'Please check your internet connection and try again.',
//       );
//       return;
//     }

//     files = [];
//     if(!checkFailedMediaFile()){
//       mediaFilesList = []; 
//     }
//     final XFile? photo;
//     PermissionStatus cameraResult;

//     if (fileSourceIndex == 1) {
          
//     // final status = await Permission.camera.request();

//     // if (status == PermissionStatus.granted) {
//         photo = await _picker.pickImage(source: ImageSource.camera);
//       if (photo != null) {
        
//         files.insert(0, File(photo.path));
//         // files[0] = ;
//         print(photo.path);
//         await uploadMediaItemsAndGetListOfTokens(context, false);
//       } else {}
   
//     // } else if (status == PermissionStatus.denied) {
//     //   // await openAppSettings();
//     //   print('Permission denied');
//     // } else if (status == PermissionStatus.permanentlyDenied) {
//     //   print('Permission Permanently Denied');
//     //   await openAppSettings();
//     // }

//     } 
//     else if(fileSourceIndex == 2){
//       final status;
//       if(Platform.isIOS){
//         status = await Permission.photos.request();
              
//             }
//             else{
//         status = await Permission.mediaLibrary.request();

//       }

//     if (status == PermissionStatus.granted) {
//       final List<AssetEntity>? result = await AssetPicker.pickAssets(
//         context,
//         pickerConfig: const AssetPickerConfig(
//           requestType: RequestType.common,
//           maxAssets:100,
//         ),
//       );
//       if (result != null) {
//         for(final assetEntity in result) {
//           File? singlefile = await assetEntity.originFile;
//           if(singlefile != null){
//            files.add(singlefile) ;
//           }
//         }
//         await uploadMediaItemsAndGetListOfTokens(context, false);
//       }
//       else{ }
//     } else if (status == PermissionStatus.denied) {
//       await openAppSettings();
//       print('Permission denied');
//     } else if (status == PermissionStatus.permanentlyDenied) {
//       print('Permission Permanently Denied');
//       await openAppSettings();
//     }
//     }


//     else{
//       final status;
//       // status = await Permission.photos.request();
            
//       status = await Permission.mediaLibrary.request();


//     if (status == PermissionStatus.granted) {
//       // final List<AssetEntity>? result = await AssetPicker.pickAssets(
//       //   context,
//       //   pickerConfig: const AssetPickerConfig(
//       //     requestType: RequestType.all,
//       //     maxAssets:100,
//       //   ),
//       // );
//         FilePickerResult? result = await FilePicker.platform.pickFiles(
//           type: FileType.custom,
//           allowedExtensions: ['zip', 'pdf', 'doc', 'mp3', 'aac', 'gif', 'xis'],
//           allowMultiple: true
//         );

//       if (result != null) {
//         for(final file in result.files) {
//           File singlefile =File(file.path!);
//            files.add(singlefile) ;
//         }
//         print(files[0].path);
//         await uploadMediaItemsAndGetListOfTokens(context, false);
//       }
//       else{ }
//     } else if (status == PermissionStatus.denied) {
//       await openAppSettings();
//       print('Permission denied');
//     } else if (status == PermissionStatus.permanentlyDenied) {
//       print('Permission Permanently Denied');
//       await openAppSettings();
//     }

//     //////////////// If Doing it by using filePicker ////////////////////////////
//     ///
//     //     FilePickerResult? result = await FilePicker.platform.pickFiles(
//     //   type: FileType.custom,
//     //   allowedExtensions: ['jpg', 'pdf', 'doc'],
//     // );

//     }
//   }
  
//   Future<void> uploadMediaItemsAndGetListOfTokens(
//       context, bool isRetrying) async {
//     var authProvider =
//         Provider.of<FirebaseAuthViewModel>(context, listen: false);
//     if (authProvider.authHeaders == null) {
//       return;
//     }
//     currentUploadIndex = 0;
//     isInProgressStatus = true;
//     try {
//       if (files.isNotEmpty && !isRetrying) {
//         await getImagesModel(files);
//       }
//     } on FileSystemException catch (e) {
//       print(e.toString());
//       exceptionDialog(
//         context,
//         'Upload Failed!',
//         "There's something wrong with selected file. Please try again",
//       );
//       files = [];
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//       setState(ViewState.Idle);
//       return;
//     } catch (e) {
//       print(e.toString());
//     }
//     setState(ViewState.Busy);
//     print(mediaFilesList.length);
//     var connRes = await Connectivity().checkConnectivity();

//     if (connRes != ConnectivityResult.mobile &&
//         connRes != ConnectivityResult.wifi) {
//       exceptionDialog(
//         context,
//         'No Internet Connection!',
//         'Please check your internet connection and try again.',
//       );
//       return;
//     }
//     publishSubject = PublishSubject<int>();
//     for (int i = 0; i < mediaFilesList.length; i++) {
//       try {
        
//         if(mediaFilesList[i].extension.toLowerCase() == '.zip' || mediaFilesList[i].extension.toLowerCase() == '.pdf' || mediaFilesList[i].extension.toLowerCase() == '.doc' ||
//             mediaFilesList[i].extension.toLowerCase() == '.mp3' || mediaFilesList[i].extension.toLowerCase() == '.aac' || mediaFilesList[i].extension.toLowerCase() == '.gif' || mediaFilesList[i].extension.toLowerCase() == '.xis' 
//             ){
//         if (mediaFilesList[i].uploadToken == null && mediaFilesList[i].uploadStatus != 'uploaded') {
//           var result = await GoogleDriveApiService.uploadFileToDrive(
//                       file: mediaFilesList[i].file!,
//                       authHeaders: await authProvider.authHeaders,
//                       filename: mediaFilesList[i].fileName,
//                       callback: setUploadProgress);
//           if (result != null) {
//                     ///////////////////////////////////////////////////////
//                     // just temporary solution for uploading fail image ///
//                     ///////////////////////////////////////////////////////
//                     // if (i != 0) {
//                     mediaFilesList[i].uploadStatus = 'uploaded';
//                     if(!checkIfthereIsAnyMediaFile()){
//                       await uploadMediaItemsDataToFirestore(context, false);
//                     }
//                     await updateAndStoreMediaItemsDataIntoLocalDatabase(
//                         mediaFilesList, 'uploading', true);

//                     // await LocalDatabaseService().addOrUpdateAnActivity(mediaFilesList, 'uploading');
//                     // }
//                     ///////////////////////////////////////////////////////
//                     /// ended ///
//                     ///////////////////////////////////////////////////////
//                     // mediaFilesList[i].uploadToken = tokenResult;
//                     if (i != mediaFilesList.length - 1) {
//                       currentUploadIndex++;
//                     }

//                     setState(ViewState.Idle);
//                   }            

//         }

//     else {
//           if (i != mediaFilesList.length - 1) {
//             currentUploadIndex++;
//             setState(ViewState.Idle);
//           }
//         }

//         }
//         else{
//           if (mediaFilesList[i].uploadToken == null && mediaFilesList[i].uploadStatus != 'uploaded') {
//           var tokenResult = await PhotosApiService.uploadMediaItemDio(
//               image: mediaFilesList[i].file!,
//               authHeaders: await authProvider.authHeaders,
//               filename: mediaFilesList[i].fileName,
//               callback: setUploadProgress);
//           if (tokenResult != null && tokenResult.isNotEmpty) {
//             ///////////////////////////////////////////////////////
//             // just temporary solution for uploading fail image ///
//             ///////////////////////////////////////////////////////
//             // if (i != 0) {
//             mediaFilesList[i].uploadToken = tokenResult;
//             mediaFilesList[i].uploadStatus = 'uploaded';
//             await updateAndStoreMediaItemsDataIntoLocalDatabase(
//                 mediaFilesList, 'uploading', true);
//             // await LocalDatabaseService().addOrUpdateAnActivity(mediaFilesList, 'uploading');
//             // }
//             ///////////////////////////////////////////////////////
//             /// ended ///
//             ///////////////////////////////////////////////////////

//             // mediaFilesList[i].uploadToken = tokenResult;
//             if (i != mediaFilesList.length - 1) {
//               currentUploadIndex++;
//             }

//             setState(ViewState.Idle);
//           }
//         } 
//         else {
//           if (i != mediaFilesList.length - 1) {
//             currentUploadIndex++;
//             setState(ViewState.Idle);
//           }
//         }
//         }



//       } on ClientExceptions catch (e) {
//         print(e.toString());
//         mediaFilesList[i].uploadStatus = 'failed';
//         mediaFilesList[i].error = e.toString();

//         if (i != mediaFilesList.length - 1) {
//           currentUploadIndex++;
//         }
//         setState(ViewState.Idle);
//       } on ServerExceptions catch (e) {
//         print(e.toString());
//         mediaFilesList[i].uploadStatus = 'failed';
//         mediaFilesList[i].error = e.toString();

//         if (i != mediaFilesList.length - 1) {
//           currentUploadIndex++;
//         }

//         setState(ViewState.Idle);
//       } on SocketException catch (e) {
//         print(e.toString());
//         mediaFilesList[i].uploadStatus = 'failed';
//         mediaFilesList[i].error = e.toString();
//         if (i != mediaFilesList.length - 1) {
//           currentUploadIndex++;
//         }
//         isInProgressStatus = false;
//         currentUploadIndex = -1;
//         setState(ViewState.Idle);
//         // exceptionDialog(
//         //     context,
//         //     'No Internet Connection!',
//         //     'Please check your internet connection and try again.',
//         //   );
//         FcmHelper.showNotification(title: "Upload failed!", body: "Please check your internet connection and try again.",id: 0);

//         return;
//       } on FileSystemException catch (e) {
//         print(e.toString());
//         mediaFilesList[i].uploadStatus = 'failed';
//         mediaFilesList[i].error = e.toString();
//         if (i != mediaFilesList.length - 1) {
//           currentUploadIndex++;
//         }
//         setState(ViewState.Idle);
//       } on DioError catch (e) {
//         var response = e.response;
//         print(e.toString());
//         mediaFilesList[i].uploadStatus = 'failed';
//         mediaFilesList[i].error = response?.data["message"].toString();
//         if (i != mediaFilesList.length - 1) {
//           currentUploadIndex++;
//         }
//         setState(ViewState.Idle);
//       }
//     }
//     // finally{
//     //   isInProgressStatus = false;
//     //   setState(ViewState.Idle);
//     // }
//     // connRes = await Connectivity().checkConnectivity();
//     // if (connRes != ConnectivityResult.mobile &&
//     //     connRes != ConnectivityResult.wifi) {
//     //   exceptionDialog(
//     //     context,
//     //     'No Internet Connection!',
//     //     'Please check your internet connection and try again.',
//     //   );
//     //   // await updateAndStoreMediaItemsDataIntoLocalDatabase();
//     //   files = [];
//     //   isInProgressStatus = false;
//     //   currentUploadIndex = -1;
//     //   progressPercentValue = 0;
//     //   setState(ViewState.Idle);
//     //   return;
//     // }

//     try {
//       if(!checkOnlyoneSuccessfullMediaFile()){
//       files = [];
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//       progressPercentValue = 0;
//       setState(ViewState.Idle);

//       exceptionDialog(
//             context,
//             'Upload Failed!',
//             'Please single file upload first then retry all.',
//           );
//       FcmHelper.showNotification(title: "Upload failed!", body: "Please upload single file first then retry all.",id: 0);

//       return;
//       }
//       connRes = await Connectivity().checkConnectivity();
//       if (connRes != ConnectivityResult.mobile &&
//           connRes != ConnectivityResult.wifi) {
//           exceptionDialog(
//             context,
//             'No Internet Connection!',
//             'Please check your internet connection and try again.',
//           );
//       // await updateAndStoreMediaItemsDataIntoLocalDatabase();
//       files = [];
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//       progressPercentValue = 0;
//       FcmHelper.showNotification(title: "Upload failed!", body: "Please check your internet connection and try again.",id: 0);

//       setState(ViewState.Idle);
//       publishSubject.close();
//       return;
//     }

//       if(checkIfAllAttachmentsAreFiles()){

//         print("Success and only 1 file type file is uploaded.");
//         if (!checkFailedMediaFile()) {
//           await updateAndStoreMediaItemsDataIntoLocalDatabase(
//               mediaFilesList, 'uploaded', true);
//           await uploadMediaItemsDataToFirestore(context, true);
//           exceptionDialog(
//             context,
//             'Successfully uploaded!',
//             'Selected files has been uploaded successfully.',
//           );
//           final service = FlutterBackgroundService();
//           if(await service.isRunning()){
//              print("stopping service");
//             service.invoke("stopService");
//           }
//             FcmHelper.showNotification(title: "Upload completed!", body: "Your upload has been completed successfully.",id: 0);

//             // FcmHelper.showNotification(title: "Upload in progress!", body: "Your upload is running in foreground please do not kill the app it will pause the upload.",id: 0);


//         } else {
//           await updateAndStoreMediaItemsDataIntoLocalDatabase(
//               mediaFilesList, 'failed',  true);
//         }

//         // await updateAndStoreMediaItemsDataIntoLocalDatabase();
//         files = [];
//         isInProgressStatus = false;
//         currentUploadIndex = -1;
//         progressPercentValue = 0;
//         publishSubject.close();
        
//         setState(ViewState.Idle);
//         return;

//       }

//       final response = await PhotosApiService().uploadMediaFiles(
//           files,
//           mediaFilesList,
//           setUploadProgress,
//           await authProvider.authHeaders,
//           context,
//           null);

//       if (response?.statusCode == 200) {
//         print("Success with 200 status code");
//         if (!checkFailedMediaFile() && mediaFilesList.isNotEmpty) {
//           await updateAndStoreMediaItemsDataIntoLocalDatabase(
//               mediaFilesList, 'uploaded', true);
//           await uploadMediaItemsDataToFirestore(context,  true);
//           exceptionDialog(
//             context,
//             'Successfully uploaded!',
//             'Selected files has been uploaded successfully.',
//           );
//           final service = FlutterBackgroundService();
//           if(await service.isRunning()){
//              print("stopping service");
//             service.invoke("stopService");
//           }
//             FcmHelper.showNotification(title: "Upload completed!", body: "Your upload has been completed successfully.",id: 0);

//             // FcmHelper.showNotification(title: "Upload in progress!", body: "Your upload is running in foreground please do not kill the app it will pause the upload.",id: 0);


//         } else {
//           await updateAndStoreMediaItemsDataIntoLocalDatabase(
//               mediaFilesList, 'failed',  true);
//         }

//         // await updateAndStoreMediaItemsDataIntoLocalDatabase();
//         files = [];
//         isInProgressStatus = false;
//         currentUploadIndex = -1;
//         progressPercentValue = 0;
//           publishSubject.close();

//         setState(ViewState.Idle);
//       } else {
//         print("Success with status code is not = 200");
//         // await updateAndStoreMediaItemsDataIntoLocalDatabase();
//         await updateAndStoreMediaItemsDataIntoLocalDatabase(
//             mediaFilesList, 'uploaded',  true);
//         files = [];
//         isInProgressStatus = false;
//         currentUploadIndex = -1;
//         progressPercentValue = 0;
//           publishSubject.close();

//         setState(ViewState.Idle);
//       }
//     } on ClientExceptions catch (e) {
//       print(e.toString());
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//       progressPercentValue = 0;

//       exceptionDialog(context, 'Upload failed!', 'Upload file path not found please re-attach file.');
//       await updateAndStoreMediaItemsDataIntoLocalDatabase(
//           mediaFilesList, 'failed',  true);
//           publishSubject.close();
//       FcmHelper.showNotification(title: "Upload failed!", body: "Your upload has been failed due to media files path not found. Re-attach files and try again.",id: 0);


//       setState(ViewState.Idle);
//     } on ServerExceptions catch (e) {
//       print(e.toString());
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//       progressPercentValue = 0;

//       exceptionDialog(context, 'Upload failed!', e.toString());
//       await updateAndStoreMediaItemsDataIntoLocalDatabase(
//           mediaFilesList, 'failed',  true);
//           publishSubject.close();
//       FcmHelper.showNotification(title: "Upload failed!", body: "Something went wrong in uploading your media files. please try again later.",id: 0);

//       setState(ViewState.Idle);
//     } on SocketException catch (e) {
//       print(e.toString());
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//       progressPercentValue = 0;

//       exceptionDialog(
//         context,
//         'Upload failed!',
//         'Please check your internet connection and try again.',
//       );
//       await updateAndStoreMediaItemsDataIntoLocalDatabase(
//           mediaFilesList, 'failed',  true);
//           publishSubject.close();
//       FcmHelper.showNotification(title: "Upload failed!", body: "Please check your internet connection and try again..",id: 0);

//       setState(ViewState.Idle);
//     } on DioError catch (e) {
//       print(e.toString());
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//       progressPercentValue = 0;

//       exceptionDialog(context, 'Upload failed!', e.toString());
//       await updateAndStoreMediaItemsDataIntoLocalDatabase(
//           mediaFilesList, 'failed',  true);
//           publishSubject.close();
//             FcmHelper.showNotification(title: "Upload failed!", body: "Something went wrong in uploading your media files. please try again later.",id: 0);


//       setState(ViewState.Idle);
//     }
//   }
  
  


//   Future<void> getImagesModel(List<File> files) async {
//     try {
//       // mediaFilesList = [];

//       for (var file in files) {
//         if (file.existsSync() == false) {
//           await file.create(recursive: true);
//         }
//         File? thumbNail;
//         // Uint8List? uint8List;
//         if(path.extension(file.path).toLowerCase() == '.mp4' || path.extension(file.path).toLowerCase() == '.mov'){
//           File? thumbNailss = await getVideoThumbnailUint8list(file);
//           if(thumbNailss != null){
//           thumbNail = thumbNailss;

//           }
//           print(thumbNail);
//         }
//         mediaFilesList.add(MediaFileModel(
//           id: DateTime.now().millisecondsSinceEpoch.toString(),
//           file: file,
//           fileName: path.basename(file.path),
//           size: await file.length(),
//           extension: path.extension(file.path),
//           thumbNail: thumbNail,
//           // uint8List: uint8List
//         ));
        
//       }
//     } on FileSystemException {
//       rethrow;
//     } catch (e) {
//       rethrow;
//     }
//   }
//   Future<void> setLocalActivityData(ActivityModel? lastActivity) async {
//     mediaFilesList = lastActivity?.mdiaFilesList ?? [];
//     setState(ViewState.Idle);
//   }

//   PublishSubject<int> publishSubject = PublishSubject<int>();
//   void setUploadProgress(int sentBytes, int totalBytes) {

    
//     double progressValue =
//         Util.remap(sentBytes.toDouble(), 0, totalBytes.toDouble(), 0, 1);

//     progressValue = double.parse(progressValue.toStringAsFixed(2));

//     if (progressValue != progressValue) progressValue = progressValue;

//     progressPercentValue = (progressValue * 100.0).toInt();
//     publishSubject.add(progressPercentValue);
//     if (progressPercentValue == 100) {
//       // print("IM COMPLE|TEDDDDDDDDDDDD");
//       progressPercentValue = 100;
//     }
//   }

//   uploadMediaItemsDataToFirestore(context, bool isPhotoApiStorage ) async {
//     final result = await FirestoreService()
//         .uploadNewMediaItemsActivity(context, mediaFilesList, 'uploaded');
//   }

//   updateAndStoreMediaItemsDataIntoLocalDatabase(
//       List<MediaFileModel> mediaFilesList, String status,  bool isPhotoApiStorage) async {
//     await LocalDatabaseService().addOrUpdateAnActivity(mediaFilesList, status);
//   }
//     clearDataIntoLocalDatabase() async {
//     await LocalDatabaseService().clearUploadActivity();
//   }

//   bool checkFailedMediaFile() {
//     if (mediaFilesList.isNotEmpty) {
//       int index =
//           mediaFilesList.indexWhere((element) => element.uploadToken == null && element.uploadStatus != 'uploaded');
//       if (index != -1) {
//         return true;
//       } else {
//         return false;
//       }
//     }
//     return false;
//   }
  
// bool checkIfAllAttachmentsAreFiles(){
//   if (mediaFilesList.isNotEmpty) {
//       int index =
//           mediaFilesList.indexWhere((element) => element.uploadToken != null );
//       if (index != -1) {
//         return false;
//       } else {
//         return true;
//       }
//     }
//     return false;
// }
//   bool checkOnlyoneSuccessfullMediaFile() {
//     if (mediaFilesList.isNotEmpty) {
//       int index =
//           mediaFilesList.indexWhere((element) => element.uploadToken != null || element.uploadStatus == 'uploaded');
//       if (index != -1) {
//         return true;
//       } else {
//         return false;
//       }
//     }
//     return false;
//   }
//   String getSuccessUploads() {
//     int uploadedItems = 0;
//     if (mediaFilesList.isNotEmpty) {
//       for (final item in mediaFilesList) {
//         if (item.uploadToken != null || item.uploadStatus == 'uploaded') {
//           uploadedItems++;
//         }
//       }
//       return uploadedItems.toString();
//     }
//     return '0';
//   }

//   List<MediaFileModel> failedMediaFilesList = [];

//   startRetryProcessForSingleFile(
//       context, MediaFileModel selectedMediaFile, int selectedIndex) async {
//     var connRes = await Connectivity().checkConnectivity();

//     if (connRes != ConnectivityResult.mobile &&
//         connRes != ConnectivityResult.wifi) {
//       exceptionDialog(
//         context,
//         'No Internet Connection!',
//         'Please check your internet connection and try again.',
//       );
//       return;
//     }
//     await copyFailedMediaFilesToFailedList();
//     await retrySelectedMediaFile(context, selectedMediaFile, selectedIndex);
//   }

//   copyFailedMediaFilesToFailedList() {
//     if (checkFailedMediaFile()) {
//       for (int i = 0; i < mediaFilesList.length; i++) {
//         if (mediaFilesList[i].uploadToken == null && mediaFilesList[i].uploadStatus != 'uploaded') {
//           failedMediaFilesList.add(mediaFilesList[i]);
//         }
//       }
//     }
//   }

//   // Future<void> retryToUploadFailedMediaFiles(context);
//   bool isRetryingSingleFile = false;

//   Future<void> retrySelectedMediaFile(
//       context, MediaFileModel selectedMediaFile, int selectedIndex) async {
//     var authProvider =
//         Provider.of<FirebaseAuthViewModel>(context, listen: false);
//     if (authProvider.authHeaders == null) {
//       return;
//     }
//     isRetryingSingleFile = true;
//     currentUploadIndex = selectedIndex;
//     isInProgressStatus = true;
//     setState(ViewState.Busy);
//     publishSubject = PublishSubject<int>();

//     try {

//       if(selectedMediaFile.extension.toLowerCase() == '.zip' || selectedMediaFile.extension.toLowerCase() == '.pdf' || selectedMediaFile.extension.toLowerCase() == '.doc' ||
//             selectedMediaFile.extension.toLowerCase() == '.mp3' || selectedMediaFile.extension.toLowerCase() == '.aac' || selectedMediaFile.extension.toLowerCase() == '.gif' || selectedMediaFile.extension.toLowerCase() == '.xis' 
//         ){
//           var result = await GoogleDriveApiService.uploadFileToDrive(
//                       file: selectedMediaFile.file!,
//                       authHeaders: await authProvider.authHeaders,
//                       filename: selectedMediaFile.fileName,
//                       callback: setUploadProgress);
//                     if (result != null) {
//                   selectedMediaFile.uploadStatus = 'uploaded';
//                   mediaFilesList[selectedIndex].uploadStatus == 'uploaded';
//                    if(!checkIfthereIsAnyMediaFile()){
//                       await uploadMediaItemsDataToFirestore(context, false);
//                     }
//                   await updateAndStoreMediaItemsDataIntoLocalDatabase(
//                         mediaFilesList, 'uploading', true);

                    
// files = []; // remove single failed media item from failed list
//         isInProgressStatus = false;
//         isRetryingSingleFile = false;
//         currentUploadIndex = -1;
//         progressPercentValue = 0;
//           publishSubject.close();
//                     setState(ViewState.Idle);
//                     return;
//                   } 
//                   else{
//                     files = []; // remove single failed media item from failed list
//         isInProgressStatus = false;
//         isRetryingSingleFile = false;
//         currentUploadIndex = -1;
//         progressPercentValue = 0;
//           publishSubject.close();
//                     setState(ViewState.Idle);
//                   }
//         }
//       else{
//       var tokenResult = await PhotosApiService.uploadMediaItemDio(
//           image: selectedMediaFile.file,
//           authHeaders: await authProvider.authHeaders,
//           filename: selectedMediaFile.fileName,
//           callback: setUploadProgress);
//       if (tokenResult != null && tokenResult.isNotEmpty) {
//         selectedMediaFile.uploadToken = tokenResult;
//         selectedMediaFile.uploadStatus == 'uploaded';
//         //
//         mediaFilesList[selectedIndex].uploadToken = tokenResult;
//         mediaFilesList[selectedIndex].uploadStatus == 'uploaded';
//         await updateAndStoreMediaItemsDataIntoLocalDatabase(
//             mediaFilesList, 'uploading',  true);
//         //
//       }
//       }      




//     } on ClientExceptions catch (e) {
//       print(e.toString());
//       mediaFilesList[selectedIndex].uploadStatus = 'failed';
//       mediaFilesList[selectedIndex].error = e.toString();
//       isRetryingSingleFile = false;
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//       await updateAndStoreMediaItemsDataIntoLocalDatabase(
//           mediaFilesList, 'failed',  true);
//           publishSubject.close();
//       setState(ViewState.Idle);
//       return;
//     } on ServerExceptions catch (e) {
//       print(e.toString());
//       mediaFilesList[selectedIndex].uploadStatus = 'failed';
//       mediaFilesList[selectedIndex].error = e.toString();
//       isRetryingSingleFile = false;
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//       await updateAndStoreMediaItemsDataIntoLocalDatabase(
//           mediaFilesList, 'failed',  true);
//       setState(ViewState.Idle);
//       return;
//     } on SocketException catch (e) {
//       print(e.toString());
//       mediaFilesList[selectedIndex].uploadStatus = 'failed';
//       mediaFilesList[selectedIndex].error = e.toString();
//       isRetryingSingleFile = false;
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//       await updateAndStoreMediaItemsDataIntoLocalDatabase(
//           mediaFilesList, 'failed',  true);
//           publishSubject.close();

//       setState(ViewState.Idle);
//       FcmHelper.showNotification(title: "Upload failed!", body: "Please check your internet connection and try again.",id: 0);

//       return;
//     } on DioError catch (e) {
//       var response = e.response;

//       print(e.toString());
//       mediaFilesList[selectedIndex].uploadStatus = 'failed';
//       mediaFilesList[selectedIndex].error =
//           response?.data["message"].toString();
//       isRetryingSingleFile = false;
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//       await updateAndStoreMediaItemsDataIntoLocalDatabase(
//           mediaFilesList, 'failed',  true);
//           publishSubject.close();
        

//       setState(ViewState.Idle);
//       return;
//     }
//     try {
//       final response = await PhotosApiService().uploadMediaFiles(
//           files,
//           null,
//           setUploadProgress,
//           await authProvider.authHeaders,
//           context,
//           selectedMediaFile);

//       if (response?.statusCode == 200) {
//         print("Success with 200 status code");
//         if (!checkFailedMediaFile() && mediaFilesList.isNotEmpty) {
//           await updateAndStoreMediaItemsDataIntoLocalDatabase(
//               mediaFilesList, 'uploaded',  true);
//           await uploadMediaItemsDataToFirestore(context,  true);
//         } else {
//           await updateAndStoreMediaItemsDataIntoLocalDatabase(
//               mediaFilesList, 'failed',  true);
//           await removeMediaFileFromFailedList(selectedMediaFile);
//         }

//         files = []; // remove single failed media item from failed list
//         isInProgressStatus = false;
//         isRetryingSingleFile = false;
//         currentUploadIndex = -1;
//         progressPercentValue = 0;
//           publishSubject.close();
//         FcmHelper.showNotification(title: "Upload completed!", body: "Your upload has been completed successfully.",id: 0);
//         setState(ViewState.Idle);
//       } else {
//         print("Success with status code is not = 200");
//         // await removeMediaFileFromFailedList(selectedMediaFile);
//         await updateAndStoreMediaItemsDataIntoLocalDatabase(
//             mediaFilesList, 'uploaded',  true);
//         files = []; // remove single failed media item from failed list
//         currentUploadIndex = -1;
//         isRetryingSingleFile = false;
//         progressPercentValue = 0;
//         isInProgressStatus = false;
//           publishSubject.close();

//         setState(ViewState.Idle);
//       }
//     } on ClientExceptions catch (e) {
//       print(e.toString());
//       isInProgressStatus = false;
//       currentUploadIndex = -1;
//         files = [];
//         isRetryingSingleFile = false;
//         progressPercentValue = 0;
//       exceptionDialog(context, 'Upload failed!', e.toString());
//       // localStore it to local storage
//       // await updateAndStoreMediaItemsDataIntoLocalDatabase();
//           publishSubject.close();
//     FcmHelper.showNotification(title: "Upload failed!", body: "Your upload has been failed due to media files path not found. Re-attach files and try again.",id: 0);
//           setState(ViewState.Idle);
//     } on ServerExceptions catch (e) {
//       print(e.toString());
//         files = []; // remove single failed media item from failed list
//         currentUploadIndex = -1;
//         isRetryingSingleFile = false;
//         progressPercentValue = 0;
//         isInProgressStatus = false;
//       exceptionDialog(context, 'Upload failed!', e.toString());
//       // localStore it to local storage
//       // await updateAndStoreMediaItemsDataIntoLocalDatabase();
//           publishSubject.close();
//     FcmHelper.showNotification(title: "Upload failed!", body: "Something went wrong in uploading your media files. please try again later.",id: 0);

//       setState(ViewState.Idle);
//     } on SocketException catch (e) {
//       print(e.toString());
//         files = []; // remove single failed media item from failed list
//         currentUploadIndex = -1;
//         isRetryingSingleFile = false;
//         progressPercentValue = 0;
//         isInProgressStatus = false;
//       exceptionDialog(
//         context,
//         'Upload failed!',
//         'Please check your internet connection and try again.',
//       );
//       // localStore it to local storage
//       // await updateAndStoreMediaItemsDataIntoLocalDatabase();
//           publishSubject.close();
//       FcmHelper.showNotification(title: "Upload failed!", body: "Please check your internet connection and try again.",id: 0);

//       setState(ViewState.Idle);
//     } on DioError catch (e) {
//       print(e.toString());
//         files = []; // remove single failed media item from failed list
//         currentUploadIndex = -1;
//         isRetryingSingleFile = false;
//         progressPercentValue = 0;
//         isInProgressStatus = false;
//       exceptionDialog(context, 'Upload failed!', e.toString());
//       // localStore it to local storage
//       // await updateAndStoreMediaItemsDataIntoLocalDatabase();
//           publishSubject.close();
//       FcmHelper.showNotification(title: "Upload failed!", body: "Something went wrong in uploading your media files. please try again later.",id: 0);
//             setState(ViewState.Idle);
//     }
//   }

//   bool checkIfthereIsAnyMediaFile() {
//     if (mediaFilesList.isNotEmpty) {
    
//       int index =
//           mediaFilesList.indexWhere((element) => 
//           element.extension.toLowerCase() != '.zip' &&  element.extension.toLowerCase() != '.pdf' &&  element.extension.toLowerCase() != '.doc' &&
//              element.extension.toLowerCase() != '.mp3' &&  element.extension.toLowerCase() != '.aac' &&  element.extension.toLowerCase() != '.gif' &&  element.extension.toLowerCase() != '.xis' 
//           );  
//       if (index != -1) {
//         return true;
//       } else {
//         return false;
//       }
//     }
//     return false;
//   }
  

//   bool isClearing = false;

//   clearAllUploads() async {
//     // if(isClearing){
//     //   return;
//     // }
//         isClearing = true;
//         setState(ViewState.Idle);
//         await clearDataIntoLocalDatabase();
          
//         final service = FlutterBackgroundService();
//           if(await service.isRunning()){
//              print("stopping service");
//             service.invoke("stopService");
//           }

//         publishSubject.close();        
//         files = [];
//         isInProgressStatus = false;
//         isRetryingSingleFile = false;
//         currentUploadIndex = -1;
//         progressPercentValue = 0;
//         mediaFilesList = [];
//         isClearing = false;
//         setState(ViewState.Idle);
//   }

//   Future removeMediaFileFromFailedList(selectedMediaFile) async {
//     if (failedMediaFilesList.isEmpty) {
//       return;
//     }
//     int index = failedMediaFilesList.indexWhere((element) =>
//         element.fileName == selectedMediaFile.fileName &&
//         element.size == selectedMediaFile.size &&
//         element.extension == selectedMediaFile.extension);
//     if (index != -1) {
//       failedMediaFilesList.removeAt(index);
//     }
//   }

//   // Future<File?> getVideoThumbnail(File? videoFile) async {
//   //   try{
//   //     // await ExportVideoFrame.cleanImageCache();
//   //    var duration = const Duration(seconds: 1);
//   //   var image = await ExportVideoFrame.exportImageBySeconds(videoFile!, duration, 0);
//   //   return image;
//   //   }
//   //   catch(e){
//   //       print(e.toString());
//   //     }
//   // }

//   Future<File?> getVideoThumbnailUint8list(File? videoFile) async {
//     try{
//       print("paaaath1");
//       print(videoFile?.path);
//       final uint8list = await VideoThumbnail.thumbnailData(
//       video: videoFile!.path,
//       imageFormat: ImageFormat.PNG,
//       maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
//       quality: 25,
//     );
//     if(uint8list != null){
//       final tempDir = await getTemporaryDirectory();
//       final file = await  File('${tempDir.path}/${videoFile.path.split("/").last}.png').create();
//       file.writeAsBytesSync(uint8list);
//       print("paaaath2");
//       print(file.path);
//     return file;

//     }
//     return null;
    
//     }
//     catch(e){
//         print(e.toString());
//       }
//   }

//   cancelUpload(context) async {

//      await updateAndStoreMediaItemsDataIntoLocalDatabase(
//        mediaFilesList, 'cancelled',  true);
          
//           final service = FlutterBackgroundService();
//           if(await service.isRunning()){
//              print("stopping service");
//             service.invoke("stopService");
//           }

//         exceptionDialog(
//                   context,
//                   'Upload cancelled!',
//                   'your upload has been cancelled.',
//                 );
//         publishSubject.close();        
//         files = [];
//         isInProgressStatus = false;
//         currentUploadIndex = -1;
//         progressPercentValue = 0;
//         setState(ViewState.Idle);
//   }


//   //////////////////////////////////////////////////////////////////////////////
//   /// Controlling AppLifeCycles///
//   //////////////////////////////////////////////////////////////////////////////
//   onPauseOccured() async {
//     if (mediaFilesList.isEmpty) {
//       return;
//     }
//     await updateAndStoreMediaItemsDataIntoLocalDatabase(
//         mediaFilesList, 'goingToForeground',  true);
//     if (!isInProgressStatus) {
//       return;
//     } else {
//       // await initializeService();
//       FlutterBackgroundService().invoke("setAsForeground");
//     }
//   }
//   onDetachedOccured(context) async {
//     // if (mediaFilesList.isEmpty) {
//     //   return;
//     // }
//     // await updateAndStoreMediaItemsDataIntoLocalDatabase(
//     //     mediaFilesList, 'goingToBackground');
//     if (!isInProgressStatus) {
//       return;
//     } else {
//       // await initializeService();
//       FlutterBackgroundService().invoke("setAsBackground");
//       cancelUpload(context);
//     }
//   }
// }
