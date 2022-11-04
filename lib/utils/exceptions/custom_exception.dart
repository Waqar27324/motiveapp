class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}

///////////////////////////////////////////////////

class RetryUploadException extends CustomException {
  RetryUploadException([message])
      : super(message,
            "Retrying Failed Requests: "); //5XX status code for this error
}

class DelayForRetryUploadException extends CustomException {
  DelayForRetryUploadException([message])
      : super(message,
            "Retrying After 30 Seconds: "); //429 status code for this error
}

class ClientExceptions extends CustomException {
  ClientExceptions([message])
      : super(message,
            "Request error occured: "); //429 status code for this error
}

class ServerExceptions extends CustomException {
  ServerExceptions([message])
      : super(message,
            "Something is wrong on server side: "); //429 status code for this error
}

// showProperErrorMsg(String embeddedMessage) {
//   debugPrint('errorMsg: ' + embeddedMessage);
//   String? errorMsg = errorMessages[embeddedMessage];
//   if (errorMsg != null) {
//     debugPrint('msg: ' + errorMsg);
//     showToastMsg(errorMsg);
//   }
// }
// showToastMsg(String msg) {
//   debugPrint('show toast msg');
//   // Fluttertoast.showToast(
//   //   msg: msg,
//   //   toastLength: Toast.LENGTH_SHORT,
//   //   gravity: ToastGravity.CENTER,
//   //   timeInSecForIosWeb: 1,
//   //   backgroundColor: Colors.red,
//   //   textColor: Colors.white,
//   //   fontSize: 16.0,
//   // );
// }
// Map<String, String> errorMessages = {
//   'Invalid funding source.': invalidFundingSourceMsg,
//   'Sender // Receiver Restricted.': senderReceiverRestricted,
// };
