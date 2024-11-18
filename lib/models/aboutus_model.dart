class AboutUsModel {
  AboutUsModel({
      this.success, 
      this.message, 
      this.data,});

  AboutUsModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? AboutUsData.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  AboutUsData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class AboutUsData {
  AboutUsData({
      this.text,});

  AboutUsData.fromJson(dynamic json) {
    text = json['text'];
  }
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    return map;
  }

}