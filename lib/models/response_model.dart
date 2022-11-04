class ResponseModel {
  String? message;
  int? code;
  String token;

  ResponseModel({this.message, this.code, required this.token});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['status']['message'],
      code: json['status']['code'] ?? 200,
      token: json['uploadToken'] ?? '',
    );
  }
}
