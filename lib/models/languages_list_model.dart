class LanguagesListModel {
  bool? success;
  String? message;
  Data? data;

  LanguagesListModel({this.success, this.message, this.data});

  LanguagesListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<LanguagesListData>? languages;

  Data({this.languages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['languages'] != null) {
      languages = <LanguagesListData>[];
      json['languages'].forEach((v) {
        languages!.add(new LanguagesListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.languages != null) {
      data['languages'] = this.languages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LanguagesListData {
  String? enUS;

  LanguagesListData({this.enUS});

  LanguagesListData.fromJson(Map<String, dynamic> json) {
    enUS = json['en_US'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en_US'] = this.enUS;
    return data;
  }
}