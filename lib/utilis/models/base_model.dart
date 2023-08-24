class RemoteBaseModel {
  RemoteBaseModel({
    this.status,
    this.message,
  });
  String? status;
  String? message;

  factory RemoteBaseModel.fromJson(Map<String, dynamic> json) {
    return RemoteBaseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
