// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:provider/provider.dart';
// import 'package:schoolphotoapp/models/activity_model.dart';
// import 'package:schoolphotoapp/models/auth_user.dart';
// import 'package:schoolphotoapp/models/student_model.dart';
// import 'package:schoolphotoapp/services/base_model.dart';
// import 'package:schoolphotoapp/services/firestore_service.dart';
// import 'package:schoolphotoapp/services/local_db_service.dart';
// import 'package:schoolphotoapp/utils/constants/firebase_constants.dart';
// import 'package:schoolphotoapp/utils/enums/view_state.dart';
// import 'package:schoolphotoapp/viewmodels/home_view_model.dart';
// import 'package:schoolphotoapp/views/ui/authentication/auth.dart';
// import 'package:schoolphotoapp/views/ui/home/home_view.dart';
// import 'package:schoolphotoapp/views/widgets/custom_dexceptions_dialog.dart';

// class FirebaseAuthViewModel extends BaseModel {
//   var googleAccount = GoogleSignInAccount;

//   Future<Map<String, String>>? authHeaders;
//   User? firebaseUser;

//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
//     'profile',
//     'https://www.googleapis.com/auth/photoslibrary',
//     'https://www.googleapis.com/auth/photoslibrary.sharing',
//     'https://www.googleapis.com/auth/photoslibrary.appendonly',
//     'https://www.googleapis.com/auth/drive',
//     'https://www.googleapis.com/auth/drive.file'
//   ]);
//   Future<void> logInWithGoogle(BuildContext context) async {
//     try {
//       setState(ViewState.Busy);
//       final user = await signInWithGoogle();
//       if (user != null) {
//         final userExist = await FirestoreService().checkIfUserDataExists(user);
//         if (userExist) {
//           // ignore: use_build_context_synchronously
//           await getStudentDataFromFirebase(context, user.uid);
//           // ignore: use_build_context_synchronously
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const HomeScreen()),
//           );
//         } else {
//           await FirestoreService().addStudentToFirestore(user);
//           // if (appUser != null) {
//           studentModel.fullName = user.displayName!.trim();
//           studentModel.email = user.email!.trim();
//           studentModel.profileUrl = user.photoURL!.trim();
//           studentModel.id = user.uid.trim();
//           studentModel.fcmToken = '';
//           studentModel.lastActivityDateTime = DateTime.now();
//           firebaseUser = user;
//           // ignore: use_build_context_synchronously
//           Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => const HomeScreen()),
//         (Route<dynamic> route) => false);
//           // Navigator.pushAndRemoveUntil(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => const HomeScreen()),
//           // );
//           // }
//         }
//       } else {
//         // ignore: use_build_context_synchronously
//         exceptionDialog(
//           context,
//           'Signin Failed!',
//           'Something went wrong while google signin either you cancelled the signin or missed to allow some permissions.',
//         );
//         print('object is null');
//       }
//       setState(ViewState.Idle);
//     } on FirebaseAuthException catch (e) {
//       print(e);
//       setState(ViewState.Idle);
//       exceptionDialog(
//         context,
//         'Signin Failed!',
//         'Something went wrong while google signin please try again later.',
//       );

//       print('FirebaseAuthException: ' + e.code);
//     } on PlatformException catch (e) {
//         print(e);
//       if (e.code == 'network_error') {
//         exceptionDialog(
//           context,
//           'Signin Failed!',
//           'Please check your internet connection and try again.',
//         );
//       } else {
//         exceptionDialog(
//           context,
//           'Signin Failed!',
//           'Something went wrong while google signin please try again and allow all permissions.',
//         );
//       }

//       setState(ViewState.Idle);
//     } on SocketException catch (e) {
//         print(e);
//       setState(ViewState.Idle);
//       exceptionDialog(
//         context,
//         'Signin Failed!',
//         'Please check your internet connection and try again.',
//       );
//     } catch (e) {
//         print(e);
//       exceptionDialog(
//         context,
//         'Signin Failed!!',
//         'Something went wrong while google signin please try again later.',
//       );
//       setState(ViewState.Idle);
//       print('Catch Error: ' + e.toString());
//     }
//   }

//   Future<User?> signInWithGoogle() async {
//     try {
//       GoogleSignInAccount? _signInAccnt = await _googleSignIn.signIn();

//       if (_signInAccnt != null) {
//         authHeaders = _signInAccnt.authHeaders;
//         GoogleSignInAuthentication? _googleAuth =
//             await _signInAccnt.authentication;
//         final AuthCredential credentials = GoogleAuthProvider.credential(
//             accessToken: _googleAuth.accessToken, idToken: _googleAuth.idToken);
//         final userData = await auth.signInWithCredential(credentials);
//         return userData.user;
//       } else {
//         return null;
//       }
//     } on SocketException {
//       rethrow;
//     } on PlatformException {
//       rethrow;
//     } on FirebaseAuthException {
//       rethrow;
//     } catch (error) {
//       print(error);
//       rethrow;
//     }
//   }

//   Future<User?> getStudentDataFromFirebase(context, String userId,
//       [User? user]) async {
//     // if (user == null) return null;
//     try {
//       if (user != null) {
//         firebaseUser = user;
//         // setState(ViewState.Idle);
//       }
//       if (true) {
//         print('aaa');
//         GoogleSignInAccount? _signInAccnt =
//             await _googleSignIn.signInSilently();
//         authHeaders = _signInAccnt!.authHeaders;
//         print(authHeaders.toString());
//       }
//       // local store need to be done here
//       // final data = await localdb.collection('lastActivity').doc(userId).get();
//       // print(data.toString());
//       // lastActivity = data ?? {};
//       ActivityModel? activity =
//           await LocalDatabaseService().fetchActivityOnAppStart(userId);
//       var homeProvider = Provider.of<HomeViewModel>(context, listen: false);
//       await homeProvider.setLocalActivityData(activity);

//       final studentData = await FirestoreService().getUserFromFirestore(userId);
//       if (studentData != null) {
//         studentModel = studentData;
//       }
//       setState(ViewState.Idle);
//       return firebaseUser;
//     } catch (e) {
//       print('getStudentDataFromFirebase: ' + e.toString());
//     }
//   }

//   final _firebaseAuth = FirebaseAuth.instance;
//   UserAuth _userAuth = UserAuth(authStatus: null, error: null, user: null);

//   StudentModel studentModel = StudentModel(email: '', fullName: '', 
//     allowToUpload: false,
  
//   );
//   UserAuth get userAuth => _userAuth;

//   Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

//   Future<void> sendPasswordResetEmail(String email) async {
//     await _firebaseAuth.sendPasswordResetEmail(email: email);
//   }

//   // User? currentUser() {
//   //   final User? user = _firebaseAuth.currentUser;
//   //   return user;
//   // }

//   signOut(context) async {
//     // final GoogleSignIn googleSignIn = GoogleSignIn();
//     await _googleSignIn.signOut();
//     firebaseUser = null;
//     // final FacebookLogin facebookLogin = FacebookLogin();
//     // await facebookLogin.logOut();
//     _firebaseAuth.signOut();
//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => const AuthScreen()),
//         (Route<dynamic> route) => false);
//   }

//   bool isUserLoggedIn() {
//     return _firebaseAuth.currentUser != null;
//   }

//   Future<bool> deleteMyAccount(context) async {
//     try {
//       if (studentModel.id!.isNotEmpty) {
//         // delete user data
//         await firebaseFirestore
//             .collection('students')
//             .doc(studentModel.id!)
//             .delete()
//             .onError((error, stackTrace) =>
//                 print('user data deletion error' + error.toString()));
//         // delete user from authentication
//         await auth.currentUser!.delete().onError((error, stackTrace) =>
//             print('user deletion error' + error.toString()));
//         return true;
//       } else {
//         debugPrint('user is not valid: ');
//         return false;
//       }
//     } catch (e) {
//       debugPrint('delete catch error: ' + e.toString());
//       return false;
//     }
//   }

//   String getDayNight() {
//     int hour = DateTime.now().hour;
//     if (hour >= 1 && hour <= 12) {
//       return 'Good Morning';
//     }
//     return 'Good Afternoon';
//   }
// }
