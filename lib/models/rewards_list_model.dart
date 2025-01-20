class RewardsListModel {
  RewardsListModel({
      this.success, 
      this.message, 
      this.data,});
  RewardsListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null && json['data'] is List) {
      data = [];
      json['data'].forEach((v) {
        data?.add(RewardsListData.fromJson(v));
      });
    }
  }

  bool? success;
  String? message;
  List<RewardsListData>? data;

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

class RewardsListData {
  RewardsListData({
    this.id,
    this.name,
    this.title,
    this.description,
    this.maxNumberToRedeem,
    this.points,
    this.activeFrom,
    this.expirationDate,
    this.isActive,
    this.numberOfTimesRedeemed,
    this.views,
    this.lastView,
    this.isUndeletable,
    this.isUneditable,
    this.meta,
    this.createdBy,
    this.deletedBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.image1,
    this.pivot,
    this.media,
  });

  RewardsListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'] != null
        ? Title.fromJson(json['title'] as Map<String, dynamic>)
        : null;
    description = json['description'] != null
        ? Description.fromJson(json['description'] as Map<String, dynamic>)
        : null;
    maxNumberToRedeem = json['max_number_to_redeem'];
    points = json['points'];
    activeFrom = json['active_from'];
    expirationDate = json['expiration_date'];
    isActive = json['is_active'];
    numberOfTimesRedeemed = json['number_of_times_redeemed'];
    views = json['views'];
    lastView = json['last_view'];
    isUndeletable = json['is_undeletable'];
    isUneditable = json['is_uneditable'];
    meta = json['meta'];
    createdBy = json['created_by'];
    deletedBy = json['deleted_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image1 = json['image1'];
    pivot = json['pivot'] != null
        ? Pivot.fromJson(json['pivot'] as Map<String, dynamic>)
        : null;
    if (json['media'] != null && json['media'] is List) {
      media = [];
      json['media'].forEach((v) {
        media?.add(Media.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  String? id;
  String? name;
  Title? title;
  Description? description;
  int? maxNumberToRedeem;
  int? points;
  String? activeFrom;
  String? expirationDate;
  int? isActive;
  int? numberOfTimesRedeemed;
  int? views;
  String? lastView;
  int? isUndeletable;
  int? isUneditable;
  dynamic meta;
  String? createdBy;
  dynamic deletedBy;
  dynamic updatedBy;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? image1;
  Pivot? pivot;
  List<Media>? media;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (title != null) {
      map['title'] = title?.toJson();
    }
    if (description != null) {
      map['description'] = description?.toJson();
    }
    map['max_number_to_redeem'] = maxNumberToRedeem;
    map['points'] = points;
    map['active_from'] = activeFrom;
    map['expiration_date'] = expirationDate;
    map['is_active'] = isActive;
    map['number_of_times_redeemed'] = numberOfTimesRedeemed;
    map['views'] = views;
    map['last_view'] = lastView;
    map['is_undeletable'] = isUndeletable;
    map['is_uneditable'] = isUneditable;
    map['meta'] = meta;
    map['created_by'] = createdBy;
    map['deleted_by'] = deletedBy;
    map['updated_by'] = updatedBy;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['image1'] = image1;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
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
      this.md, 
      this.sm, 
      this.xs,});

  GeneratedConversions.fromJson(dynamic json) {
    md = json['md'];
    sm = json['sm'];
    xs = json['xs'];
  }
  bool? md;
  bool? sm;
  bool? xs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['md'] = md;
    map['sm'] = sm;
    map['xs'] = xs;
    return map;
  }

}

class Pivot {
  Pivot({
      this.cardId, 
      this.rewardId,});

  Pivot.fromJson(dynamic json) {
    cardId = json['card_id'];
    rewardId = json['reward_id'];
  }
  int? cardId;
  int? rewardId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['card_id'] = cardId;
    map['reward_id'] = rewardId;
    return map;
  }

}

class Description {
  Description({
      this.deDE, 
      this.enUS, 
      this.esES, 
      this.frFR, 
      this.nlNL, 
      this.ptBR,});

  Description.fromJson(dynamic json) {
    deDE = json['de_DE'];
    enUS = json['en_US'];
    esES = json['es_ES'];
    frFR = json['fr_FR'];
    nlNL = json['nl_NL'];
    ptBR = json['pt_BR'];
  }
  String? deDE;
  String? enUS;
  String? esES;
  String? frFR;
  String? nlNL;
  String? ptBR;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['de_DE'] = deDE;
    map['en_US'] = enUS;
    map['es_ES'] = esES;
    map['fr_FR'] = frFR;
    map['nl_NL'] = nlNL;
    map['pt_BR'] = ptBR;
    return map;
  }

}

class Title {
  Title({
      this.deDE, 
      this.enUS, 
      this.esES, 
      this.frFR, 
      this.nlNL, 
      this.ptBR,});

  Title.fromJson(dynamic json) {
    deDE = json['de_DE'];
    enUS = json['en_US'];
    esES = json['es_ES'];
    frFR = json['fr_FR'];
    nlNL = json['nl_NL'];
    ptBR = json['pt_BR'];
  }
  String? deDE;
  String? enUS;
  String? esES;
  String? frFR;
  String? nlNL;
  String? ptBR;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['de_DE'] = deDE;
    map['en_US'] = enUS;
    map['es_ES'] = esES;
    map['fr_FR'] = frFR;
    map['nl_NL'] = nlNL;
    map['pt_BR'] = ptBR;
    return map;
  }

}