class NotificationsModel {
  NotificationsModel({
      this.success, 
      this.message, 
      this.data,});

  NotificationsModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(NotificationsData.fromJson(v));
      });
    }
  }
  bool? success;
  String? message;
  List<NotificationsData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class NotificationsData {
  NotificationsData({
      this.id, 
      this.title, 
      this.message, 
      this.userId, 
      this.isRead, 
      this.meta, 
      this.isActive, 
      this.isUndeletable, 
      this.isUneditable, 
      this.createdBy, 
      this.deletedBy, 
      this.updatedBy, 
      this.deletedAt, 
      this.createdAt, 
      this.updatedAt,});

  NotificationsData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    userId = json['user_id'];
    isRead = json['is_read'];
    meta = json['meta'];
    isActive = json['is_active'];
    isUndeletable = json['is_undeletable'];
    isUneditable = json['is_uneditable'];
    createdBy = json['created_by'];
    deletedBy = json['deleted_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  String? message;
  int? userId;
  int? isRead;
  dynamic meta;
  int? isActive;
  int? isUndeletable;
  int? isUneditable;
  dynamic createdBy;
  dynamic deletedBy;
  dynamic updatedBy;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['message'] = message;
    map['user_id'] = userId;
    map['is_read'] = isRead;
    map['meta'] = meta;
    map['is_active'] = isActive;
    map['is_undeletable'] = isUndeletable;
    map['is_uneditable'] = isUneditable;
    map['created_by'] = createdBy;
    map['deleted_by'] = deletedBy;
    map['updated_by'] = updatedBy;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}