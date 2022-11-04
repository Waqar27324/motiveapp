// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:dio/dio.dart' as dio;
// import 'dart:io';
// import 'package:schoolphotoapp/utils/exceptions/custom_exception.dart';

// typedef OnUploadProgressCallback = void Function(int sentBytes, int totalBytes);

// class GoogleDriveApiService {


//    static Future uploadFileToDrive(
//       {required OnUploadProgressCallback callback,
//       File? file,
//       authHeaders,
//       String? filename}) async {
//     dio.Response response;
//     var client = dio.Dio();
//     // var authProvider =
//     //     Provider.of<FirebaseAuthViewModel>(context, listen: false);
//     // final authHeaders  = await authProvider.authHeaders;
//     try {
//       if (file?.existsSync() == false) {
//         await file?.create(recursive: true);
//       }
//       // int? imageLength = await image?.length();
//       Uint8List img = file!.readAsBytesSync();
//       var data = file.readAsBytesSync();

//       final headers = <String, String>{};
//       headers.addAll( authHeaders!);
//       headers['Content-type'] = 'application/octet-stream';
//       // headers['X-Goog-Upload-Protocol'] = 'raw';
//       // headers['X-Goog-Upload-File-Name'] =  "filename"; //filename ?? "";
//       headers['Content-Length'] = file.lengthSync().toString();
//        headers['Connection'] = "keep-alive";
//       // headers['Accept'] = "*/*";
// //  'Accept': "*/*",
// //     'Content-Length': image.length,
// //     'Connection': 'keep-alive',
//       final response = await client.post(
//         'https://www.googleapis.com/upload/drive/v3/files',
//         //data: data,ß
//       data: Stream.fromIterable(img.map((e) => [e])),
//         // data: {
//         //   "uploadType": "multipart",
//         //   "file": Stream.fromIterable(img.map((e) => [e])),
//         // },
//         options: dio.Options(method: 'POST', headers: headers),
// onSendProgress: callback,
//        // "uploadType": "multipart"
//         // onSendProgress: callback,
//       );
      
//       //  int code = response.statusCode?.toInt() ?? 0;
//       // if (code >= 400 && code < 500) {
//       //   var jsonBody = jsonDecode(response.data);
//       //   throw ClientExceptions([jsonBody["message"]]);
//       // }
//       // if (code >= 500 && code < 600) {
//       //   var jsonBody = jsonDecode(response.data);
//       //   throw ServerExceptions([jsonBody["message"]]);
//       // }
//       // if (code == 0) {
//       //   throw SocketException(
//       //       response.statusMessage ?? "Check your internet connectivity.");
//       // }


//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print(response.data);
//         return response.data;
//         //return jsonDecode(responseBody);
//       } else {
//         print("ITS NULLLL");
//         print("ITS NULLLL");

//         return response.data;
//       }
//     } on dio.DioError catch (e) {
    
//       if (e.type == dio.DioErrorType.other) {
//         throw const SocketException('Either the upload is cancelled by user or an internet interuption has been occured please retry in a while.');
//       }
//       var response = e.response;
//       int code = response?.statusCode?.toInt() ?? 0;
//       if (code >= 400 && code < 500) {
//            var jsonBody = jsonDecode(e.response?.data.toString() ?? '');
//         throw ClientExceptions([jsonBody["message"]]);
//       }
//       if (code >= 500 && code < 600) {
//            var jsonBody = jsonDecode(e.response?.data.toString() ?? '');
//         throw ServerExceptions([jsonBody["message"]]);
//       }
//       if (code == 0) {
//         throw SocketException(
//             response?.statusMessage ?? "Check your internet connectivity.");
//       }
//       if (e is FileSystemException) {
//         rethrow;
//       } else {
//         rethrow;
//       }
//     }
  
//   }


// }
