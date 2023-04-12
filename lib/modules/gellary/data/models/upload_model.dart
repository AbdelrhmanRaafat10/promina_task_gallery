import 'package:promina_task/modules/gellary/domain/entities/upload_entity.dart';

class UploadModel extends UploadEntity{
  UploadModel({
    required super.status,
    required super.data,
    required super.message,
  });



  factory UploadModel.fromJson(Map<String, dynamic> json) => UploadModel(
    status: json["status"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x)),
    "message": message,
  };
}
