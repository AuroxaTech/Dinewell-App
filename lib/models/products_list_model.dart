class ProductsListModel {
  ProductsListModel({
      this.success, 
      this.message, 
      this.data,});

  ProductsListModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductsListData.fromJson(v));
      });
    }
  }
  bool? success;
  String? message;
  List<ProductsListData>? data;

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

class ProductsListData {
  ProductsListData({
      this.id, 
      this.name, 
      this.description, 
      this.pointValue, 
      this.meta, 
      this.isActive, 
      this.isUndeletable, 
      this.isUneditable, 
      this.createdBy, 
      this.deletedBy, 
      this.updatedBy, 
      this.deletedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.productimage, 
      this.media,});

  ProductsListData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pointValue = json['point_value'];
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
    productimage = json['productimage'];
    if (json['media'] != null) {
      media = [];
      json['media'].forEach((v) {
        media?.add(Media.fromJson(v));
      });
    }
  }
  String? id;
  String? name;
  String? description;
  String? pointValue;
  dynamic meta;
  int? isActive;
  int? isUndeletable;
  int? isUneditable;
  String? createdBy;
  dynamic deletedBy;
  dynamic updatedBy;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  dynamic productimage;
  List<Media>? media;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['point_value'] = pointValue;
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
    map['productimage'] = productimage;
    if (media != null) {
      map['media'] = media?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Media {
  Media({
      this.id, 
      this.modelType, 
      this.modelId, 
      this.uuid, 
      this.collectionName, 
      this.name, 
      this.fileName, 
      this.mimeType, 
      this.disk, 
      this.conversionsDisk, 
      this.size, 
      this.manipulations, 
      this.customProperties, 
      this.generatedConversions, 
      this.responsiveImages, 
      this.orderColumn, 
      this.createdAt, 
      this.updatedAt, 
      this.originalUrl, 
      this.previewUrl,});

  Media.fromJson(dynamic json) {
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    uuid = json['uuid'];
    collectionName = json['collection_name'];
    name = json['name'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    disk = json['disk'];
    conversionsDisk = json['conversions_disk'];
    size = json['size'];
    if (json['manipulations'] != null) {
      manipulations = [];
      json['manipulations'].forEach((v) {
        // manipulations?.add(Dynamic.fromJson(v));
      });
    }
    if (json['custom_properties'] != null) {
      customProperties = [];
      json['custom_properties'].forEach((v) {
        // customProperties?.add(Dynamic.fromJson(v));
      });
    }
    generatedConversions = json['generated_conversions'] != null ? GeneratedConversions.fromJson(json['generated_conversions']) : null;
    if (json['responsive_images'] != null) {
      responsiveImages = [];
      json['responsive_images'].forEach((v) {
        // responsiveImages?.add(Dynamic.fromJson(v));
      });
    }
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    originalUrl = json['original_url'];
    previewUrl = json['preview_url'];
  }
  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  List<dynamic>? manipulations;
  List<dynamic>? customProperties;
  GeneratedConversions? generatedConversions;
  List<dynamic>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? originalUrl;
  String? previewUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['model_type'] = modelType;
    map['model_id'] = modelId;
    map['uuid'] = uuid;
    map['collection_name'] = collectionName;
    map['name'] = name;
    map['file_name'] = fileName;
    map['mime_type'] = mimeType;
    map['disk'] = disk;
    map['conversions_disk'] = conversionsDisk;
    map['size'] = size;
    if (manipulations != null) {
      map['manipulations'] = manipulations?.map((v) => v.toJson()).toList();
    }
    if (customProperties != null) {
      map['custom_properties'] = customProperties?.map((v) => v.toJson()).toList();
    }
    if (generatedConversions != null) {
      map['generated_conversions'] = generatedConversions?.toJson();
    }
    if (responsiveImages != null) {
      map['responsive_images'] = responsiveImages?.map((v) => v.toJson()).toList();
    }
    map['order_column'] = orderColumn;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['original_url'] = originalUrl;
    map['preview_url'] = previewUrl;
    return map;
  }

}

class GeneratedConversions {
  GeneratedConversions({
      this.small, 
      this.medium,});

  GeneratedConversions.fromJson(dynamic json) {
    small = json['small'];
    medium = json['medium'];
  }
  bool? small;
  bool? medium;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['small'] = small;
    map['medium'] = medium;
    return map;
  }

}