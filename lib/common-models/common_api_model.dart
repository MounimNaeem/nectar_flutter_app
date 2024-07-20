import 'dart:convert';

ApiResponseModel commonApiModelFromJson(String str) =>
    ApiResponseModel.fromJson(json.decode(str));

String commonApiModelToJson(ApiResponseModel data) => json.encode(data.toJson());

class ApiResponseModel {
  bool? success;
  int? statusCode;
  String? message;
  dynamic data;

  ApiResponseModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) => ApiResponseModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}


