// class UserModel {
//   String? id;
//   late String fullName;
//   late String email;
//   String? profileUrl;
//   DateTime? lastActivityDateTime;
//   String? fcmToken;
//   bool allowToUpload = false;

//   UserModel(
//       {this.id,
//       required this.fullName,
//       required this.email,
//       this.profileUrl,
//       this.lastActivityDateTime,
//       this.fcmToken,
//       required this.allowToUpload
//       });
//   UserModel.fromMap(Map<String, dynamic> data) {
//     id = data["id"];
//     fullName = data["fullName"];
//     email = data["email"];
//     profileUrl = data["profileUrl"];
//     lastActivityDateTime = data["lastActivityDateTime"].toDate();
//     //price = data[PRICE].toDouble();
//     fcmToken = data["fcmToken"];
//     allowToUpload = data["allowToUpload"];
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'fullName': fullName,
//       'email': email,
//       'profileUrl': profileUrl,
//       'lastActivityDateTime': lastActivityDateTime,
//       'fcmToken': fcmToken,
//       'allowToUpload': allowToUpload,
//     };
//   }
// }

// List<UserModel> dummyStudentsData = [
//   UserModel(
//     id: '1',
//     fullName: 'John Doe',
//     email: 'john@gmail.com',
//     profileUrl:
//         'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg',
//     lastActivityDateTime: DateTime.now(),
//     allowToUpload: false,
//   ),
//   UserModel(
//     id: '2',
//     fullName: 'Jane Doe',
//     email: 'Doe@gmail.com',
//     profileUrl:
//         'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg',
//     lastActivityDateTime: DateTime.now(),
//     allowToUpload: false,
  
//   ),
//   UserModel(
//     id: '3',
//     fullName: 'Miller ',
//     email: 'Miller@gmail.com',
//     profileUrl:
//         'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg',
//     lastActivityDateTime: DateTime.now(),
//     allowToUpload: false,

//   ),
//   UserModel(
//     id: '4',
//     fullName: 'Ali ',
//     email: 'Ali@gmail.com',
//     profileUrl:
//         'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg',
//     lastActivityDateTime: DateTime.now(),
//     allowToUpload: false,

//   ),
// ];
