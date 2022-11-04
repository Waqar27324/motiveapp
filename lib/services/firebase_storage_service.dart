// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:schoolphotoapp/utils/constants/firebase_constants.dart';

// class FirestoreStorageService {
//   Future<String> uplioadReportScreenshot(File singleImage) async {
//     try {
//       String downloadLink = '';
//       final reference =
//           firebaseStorage.ref().child(singleImage.path.split('/').last);
//       final uploadTask = reference.putFile(singleImage);
//       downloadLink = await (await uploadTask).ref.getDownloadURL();
//       return downloadLink;
//     } on FirebaseException {
//       rethrow;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
