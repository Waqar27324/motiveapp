import 'dart:io';
import 'dart:typed_data';

class MediaFileModel {
  String? id;
  late String fileName;
  late String extension;
  late int size;
  File? file;
  String? uploadToken;
  late String uploadStatus;
  String? error;
  Uint8List? uint8List;//
  File? thumbNail ;

  MediaFileModel(
      {this.id,
      required this.fileName,
      required this.extension,
      required this.size,
      this.file,
      this.uploadToken,
      this.uploadStatus = 'pending',
      this.error,
      this.thumbNail
      });

  MediaFileModel.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    fileName = data["fileName"];
    extension = data["extension"];
    size = data["size"];
    file = File(data["file"]);
    uploadToken = data["uploadToken"];
    uploadStatus = data["uploadStatus"];
    error = data["error"];
    thumbNail = (data["thumbNail"] == null) ? null : File(data["thumbNail"]);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fileName': fileName,
      'extension': extension,
      'size': size,
      'file': file?.path,
      'uploadToken': uploadToken,
      'uploadStatus': uploadStatus,
      'error': error,
      'thumbNail': thumbNail?.path,
    };
  }
}
