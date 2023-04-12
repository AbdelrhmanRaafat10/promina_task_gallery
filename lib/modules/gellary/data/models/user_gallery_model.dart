import '../../domain/entities/user_galary_entity.dart';

class UserGalleryModel extends UserGalleryEntity{

  UserGalleryModel(
      {required super.status, required super.images, required super.message});

  factory UserGalleryModel.fromJson(Map<String, dynamic> json) {
    return UserGalleryModel(
      status: json['status'],
      images: json['data']["images"] == null
          ? null
          : List<String>.from(json['data']["images"].map((x) => x)),
      message: json['message'],
    );
  }


}

