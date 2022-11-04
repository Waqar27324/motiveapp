class VideoModel {
  String? id;
  late String title;
  late String description;
  String? thumbnail;
  DateTime? uploadedAt;
  int totalComments = 0;

  VideoModel(
      {this.id,
      required this.title,
      required this.description,
      this.thumbnail,
      this.uploadedAt,
      required this.totalComments,
      });
  VideoModel.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    title = data["title"];
    description = data["description"];
    thumbnail = data["thumbnail"];
    uploadedAt = data["uploadedAt"].toDate();
    //price = data[PRICE].toDouble();
    totalComments = data["totalComments"];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
      'uploadedAt': uploadedAt,
      'totalComments': totalComments,
    };
  }
}

List<VideoModel> dummyVideosData = [
  VideoModel(
    id: '1',
    title: 'John Doe',
    description: 'john@gmail.com',
    thumbnail:
        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg',
    uploadedAt: DateTime.now(),
    totalComments: 0

  ),
  VideoModel(
    id: '2',
    title: 'Jane Doe',
    description: 'Doe@gmail.com',
    thumbnail:
        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg',
    uploadedAt: DateTime.now(),
    totalComments: 0
  
  ),
  VideoModel(
    id: '3',
    title: 'Miller ',
    description: 'Miller@gmail.com',
    thumbnail:
        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg',
    uploadedAt: DateTime.now(),
    totalComments: 0

  ),
  VideoModel(
    id: '4',
    title: 'Ali ',
    description: 'Ali@gmail.com',
    thumbnail:
        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg',
    uploadedAt: DateTime.now(),
    totalComments: 0

  ),
];
