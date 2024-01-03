class MetaModel {
  int? code;
  String? message;

  MetaModel({this.code, this.message});

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
      code: json['meta']['code'] ?? json['code'],
      message: json['meta']['message'] ?? json['message']);
}
