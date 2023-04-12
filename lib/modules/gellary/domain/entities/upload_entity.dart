class UploadEntity {
  UploadEntity({
    required this.status,
    required this.data,
    required this.message,
  });

  final String status;
  final List<dynamic> data;
  final String message;

  factory UploadEntity.fromJson(Map<String, dynamic> json) => UploadEntity(
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
