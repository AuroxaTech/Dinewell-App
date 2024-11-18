class ContactsUsModel {
  ContactsUsModel({
      this.success, 
      this.message, 
      this.data,});

  ContactsUsModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ContactsUsData.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  ContactsUsData? data;

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

class ContactsUsData {
  ContactsUsData({
      this.name, 
      this.phone, 
      this.email, 
      this.subject, 
      this.message, 
      this.id, 
      this.updatedAt, 
      this.createdAt,});

  ContactsUsData.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    subject = json['subject'];
    message = json['message'];
    id = json['id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }
  String? name;
  String? phone;
  String? email;
  String? subject;
  String? message;
  int? id;
  String? updatedAt;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['subject'] = subject;
    map['message'] = message;
    map['id'] = id;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    return map;
  }

}