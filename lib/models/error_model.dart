class ErrorModel {
  int? status;
  bool? success;
  String? message;
  dynamic result;

  ErrorModel(
      {this.status,
        this.success,
        this.message,
        this.result});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    result = null;
  }
}