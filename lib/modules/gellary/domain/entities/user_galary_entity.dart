class UserGalleryEntity {
  final String status;
  final List<String>? images;
  final String message;

  UserGalleryEntity(
      {required this.status, required this.images, required this.message});

  factory UserGalleryEntity.fromJson(Map<String, dynamic> json) {
    return UserGalleryEntity(
      status: json['status'],
      images: json['data']["images"] == null
          ? null
          : List<String>.from(json["images"].map((x) => x)),
      message: json['message'],
    );
  }


}

