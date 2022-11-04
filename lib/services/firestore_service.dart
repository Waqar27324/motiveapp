// // ignore_for_file: avoid_print

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:schoolphotoapp/models/activity_model.dart';
// import 'package:schoolphotoapp/models/media_file_model.dart';
// import 'package:schoolphotoapp/models/student_model.dart';
// import 'package:schoolphotoapp/utils/constants/firebase_constants.dart';

// class FirestoreService {
//   addStudentToFirestore(User? user) async {
//     try {
//       await firebaseFirestore.collection('students').doc(user!.uid).set({
//         "id": user.uid.trim(),
//         "fullName": user.displayName!.trim(),
//         "email": user.email!.trim(),
//         "profileUrl": user.photoURL ?? '',
//         'lastActivityDateTime': DateTime.now(),
//         "fcmToken": '',
//         "allowToUpload": false,
//       }, SetOptions(merge: true));
//     } catch (e) {
//       print('Here it comes while writing users data into firestore ');
//       print(e);
//     }
//   }

//   Future<StudentModel?> getUserFromFirestore(String userid) async {
//     try {
//       final student =
//           await firebaseFirestore.collection('students').doc(userid).get();
//       return StudentModel.fromMap(student.data()!);
//     } catch (e) {
//       print('Here it comes while getting student data from firestore ');
//       print(e);
//     }
//   }

//   Future<bool> checkIfUserDataExists(User? user) async {
//     try {
//       final student =
//           await firebaseFirestore.collection('students').doc(user!.uid).get();
//       print('oooooo ${student.exists}');
//       return student.exists;
//     } catch (e) {
//       print('Here it comes while checking if user data exists in firestore ');
//       print(e);
//       return false;
//     }
//   }

//   Future<void> uploadNewMediaItemsActivity(
//       context, List<MediaFileModel> mediaFilesList, String uploadStatus) async {
//     // final authProvider =
//     //     Provider.of<FirebaseAuthViewModel>(context, listen: false);
//     try {
//       int totalMbs = 0;
//       List<String> titleList = [];
//       for (var mediaFile in mediaFilesList) {
//         // totalMbs += await mediaFile.file?.length() ?? mediaFile.size ?? 0;
//         totalMbs += mediaFile.size;
//         print(totalMbs.ceil());
//         if(mediaFile.extension.toLowerCase() == '.zip' ||
//             mediaFile.extension.toLowerCase() == '.pdf' ||
//             mediaFile.extension.toLowerCase() == '.doc' ||
//             mediaFile.extension.toLowerCase() == '.mp3' ||
//             mediaFile.extension.toLowerCase() == '.aac' ||
//             mediaFile.extension.toLowerCase() == '.gif' ||
//             mediaFile.extension.toLowerCase() == '.xis' 
//             ){
//               titleList.add('Files');
//             }

//         else if (mediaFile.extension.toLowerCase() != '.mp4' &&
//             mediaFile.extension.toLowerCase() != '.mov') {
//           titleList.add('Images');
//         } else {
//           titleList.add('Videos');
//         }
//       }
//       print(totalMbs);
//       titleList = titleList.toSet().toList();
//       final activity = ActivityModel(
//         id: DateTime.now().millisecondsSinceEpoch,
//         uploadStatus: uploadStatus,
//         mdiaFilesList: mediaFilesList,
//         totalFiles: mediaFilesList.length,
//         uploadSizedInMbs: totalMbs,
//         uploadTitle: titleList.join(', '),
//       );
//       print(activity.uploadSizedInMbs);
//       await firebaseFirestore
//           .collection('all_activities')
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .collection('student_activities')
//           .add(activity.toJson())
//           .then((value) => lastActivity = activity);
//       print(lastActivity.mdiaFilesList?[0].uploadStatus);
//     } catch (e) {
//       print('Here it comes while writing users data into firestore ');
//       print(e);
//     }
//   }

//   uploadStudentsReportToFirestore(
//       String email, String detail, List<String> screenshotsList) async {
//     try {
//       await firebaseFirestore
//           .collection('reports')
//           .add({'email': email, 'detail': detail, 'files': screenshotsList});
//     } on FirebaseException {
//       rethrow;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
