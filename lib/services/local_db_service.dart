// import 'dart:io';

// import 'package:provider/provider.dart';
// import 'package:schoolphotoapp/models/activity_model.dart';
// import 'package:schoolphotoapp/models/media_file_model.dart';
// import 'package:schoolphotoapp/utils/constants/firebase_constants.dart';
// import 'package:schoolphotoapp/viewmodels/auth_view_model.dart';

// class LocalDatabaseService {
//   Future<void> addOrUpdateAnActivity(
//       List<MediaFileModel> mediaFilesList, String status) async {
//     final activity = ActivityModel(
//       // id: DateTime.now().millisecondsSinceEpoch,
//       uploadStatus: status,
//       mdiaFilesList: mediaFilesList,
//     );
//     await localdb
//         .collection('lastActivity')
//         .doc(auth.currentUser!.uid)
//         .set(
//           activity.toJson(),
//         )
//         .then((value) => lastActivity = activity);
//     print(lastActivity.mdiaFilesList?[0].uploadStatus);
//   }

//   Future<void> clearUploadActivity() async {

//     await localdb
//         .collection('lastActivity')
//         .doc(auth.currentUser!.uid)
//         .delete()
//         .then((value) => print('deleted'));
    
//   }

//   Future<ActivityModel?> getAnActivity(context) async {
//     final authProvider =
//         Provider.of<FirebaseAuthViewModel>(context, listen: false);
//     var result = await localdb
//         .collection('lastActivity')
//         .doc(authProvider.firebaseUser?.uid)
//         .get();
//     if (result != null) {
//       print(result);
//       ActivityModel activity = ActivityModel.fromMap(result);
//       lastActivity = activity;
//       return activity;
//     }
//   }

//   Future<ActivityModel?> fetchActivityOnAppStart(String userId) async {
//     try {
//       var result = await localdb.collection('lastActivity').doc(userId).get();
//       if (result != null) {
//         print(result);
//         ActivityModel activity = ActivityModel.fromMap(result);
// //         activity.mdiaFilesList?.forEach((file) async{
// // String filepath = file.file?.path.replaceAll("/private", "") ?? "";
// // String thumbnailPath = file.thumbNail?.path.replaceAll("/private","") ?? "";
// // try{
// //   file.file =  File(filepath);
// //   file.thumbNail = File(thumbnailPath);
// // }catch(e){
// //   print("catched $e");
// // }

// // // // file.file  = File(filepath);
// // // file.thumbNail  = File(filepath);
// // print("after changes ${filepath}");
// // print("after thumbnail changes ${thumbnailPath}");
// // print(await file.thumbNail?.exists() ??false);
// // print("does it exist ˆˆˆˆˆˆ");
// //         });
//         lastActivity = activity;

//         return activity;
//       }
//       lastActivity = ActivityModel();
//       print("last activity :=> ${lastActivity.toJson()}");
      
//       return null;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   Future<void> deleteActivity() async {}
// }
