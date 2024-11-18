import 'dart:convert';

class BannersModel {
  bool? success;
  String? message;
  List<BannersListData>? data;

  BannersModel({this.success, this.message, this.data});

  BannersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BannersListData>[];
      json['data'].forEach((v) {
        data!.add(BannersListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannersListData {
  String? id;
  String? adUrl;
  String? meta;
  int? isActive;
  int? isUndeletable;
  int? isUneditable;
  String? createdBy;
  String? deletedBy;
  dynamic updatedBy;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? partnerId;
  String? banner;
  Partner? partner;
  List<Media>? media;

  BannersListData({
    this.id,
    this.adUrl,
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
    this.partnerId,
    this.banner,
    this.partner,
    this.media,
  });

  BannersListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adUrl = json['ad_url'];
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
    partnerId = json['partner_id']?.toString();
    banner = json['banner'];
    if (json['partner'] != null) {
      partner = Partner.fromJson(json['partner']);
    }
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['ad_url'] = adUrl;
    data['meta'] = meta;
    data['is_active'] = isActive;
    data['is_undeletable'] = isUndeletable;
    data['is_uneditable'] = isUneditable;
    data['created_by'] = createdBy;
    data['deleted_by'] = deletedBy;
    data['updated_by'] = updatedBy;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['partner_id'] = partnerId;
    data['banner'] = banner;
    if (partner != null) {
      data['partner'] = partner!.toJson();
    }
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Partner {
  String? id;
  String? networkId;
  int? role;
  String? displayName;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? shortDescription;
  String? description;
  int? twoFactorEnabled;
  String? twoFactorSecret;
  String? twoFactorRecoveryCodes;
  String? accountExpiresAt;
  String? premiumExpiresAt;
  String? locale;
  String? countryCode;
  String? currency;
  String? timeZone;
  String? phonePrefix;
  String? phoneCountry;
  String? phone;
  String? phoneE164;
  int? isActive;
  String? latitude;
  String? longitude;
  int? isUndeletable;
  int? isUneditable;
  int? numberOfTimesLoggedIn;
  String? lastLoginAt;
  PartnerMeta? meta;
  String? createdBy;
  String? deletedBy;
  dynamic updatedBy;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? avatar;
  List<Media>? media;

  Partner({
    this.id,
    this.networkId,
    this.role,
    this.displayName,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.shortDescription,
    this.description,
    this.twoFactorEnabled,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.accountExpiresAt,
    this.premiumExpiresAt,
    this.locale,
    this.countryCode,
    this.currency,
    this.timeZone,
    this.phonePrefix,
    this.phoneCountry,
    this.phone,
    this.phoneE164,
    this.isActive,
    this.latitude,
    this.longitude,
    this.isUndeletable,
    this.isUneditable,
    this.numberOfTimesLoggedIn,
    this.lastLoginAt,
    this.meta,
    this.createdBy,
    this.deletedBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.avatar,
    this.media,
  });

  Partner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    networkId = json['network_id'];
    role = json['role'];
    displayName = json['display_name'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    shortDescription = json['short_description'];
    description = json['description'];
    twoFactorEnabled = json['two_factor_enabled'];
    twoFactorSecret = json['two_factor_secret'];
    twoFactorRecoveryCodes = json['two_factor_recovery_codes'];
    accountExpiresAt = json['account_expires_at'];
    premiumExpiresAt = json['premium_expires_at'];
    locale = json['locale'];
    countryCode = json['country_code'];
    currency = json['currency'];
    timeZone = json['time_zone'];
    phonePrefix = json['phone_prefix'];
    phoneCountry = json['phone_country'];
    phone = json['phone'];
    phoneE164 = json['phone_e164'];
    isActive = json['is_active'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isUndeletable = json['is_undeletable'];
    isUneditable = json['is_uneditable'];
    numberOfTimesLoggedIn = json['number_of_times_logged_in'];
    lastLoginAt = json['last_login_at'];
    meta = json['meta'] != null ? PartnerMeta.fromJson(json['meta']) : null;
    createdBy = json['created_by'];
    deletedBy = json['deleted_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    avatar = json['avatar'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['network_id'] = networkId;
    data['role'] = role;
    data['display_name'] = displayName;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['two_factor_enabled'] = twoFactorEnabled;
    data['two_factor_secret'] = twoFactorSecret;
    data['two_factor_recovery_codes'] = twoFactorRecoveryCodes;
    data['account_expires_at'] = accountExpiresAt;
    data['premium_expires_at'] = premiumExpiresAt;
    data['locale'] = locale;
    data['country_code'] = countryCode;
    data['currency'] = currency;
    data['time_zone'] = timeZone;
    data['phone_prefix'] = phonePrefix;
    data['phone_country'] = phoneCountry;
    data['phone'] = phone;
    data['phone_e164'] = phoneE164;
    data['is_active'] = isActive;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['is_undeletable'] = isUndeletable;
    data['is_uneditable'] = isUneditable;
    data['number_of_times_logged_in'] = numberOfTimesLoggedIn;
    data['last_login_at'] = lastLoginAt;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['created_by'] = createdBy;
    data['deleted_by'] = deletedBy;
    data['updated_by'] = updatedBy;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['avatar'] = avatar;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnerMeta {
  int? cardsOnHomepage;

  PartnerMeta({this.cardsOnHomepage});

  PartnerMeta.fromJson(Map<String, dynamic> json) {
    cardsOnHomepage = json['cards_on_homepage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['cards_on_homepage'] = cardsOnHomepage;
    return data;
  }
}

class Media {
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
    this.previewUrl,
  });

  Media.fromJson(Map<String, dynamic> json) {
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
    manipulations = json['manipulations'] != null
        ? List<dynamic>.from(json['manipulations'])
        : null;
    customProperties = json['custom_properties'] != null
        ? List<dynamic>.from(json['custom_properties'])
        : null;
    generatedConversions = json['generated_conversions'] != null
        ? GeneratedConversions.fromJson(json['generated_conversions'])
        : null;
    responsiveImages = json['responsive_images'] != null
        ? List<dynamic>.from(json['responsive_images'])
        : null;
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    originalUrl = json['original_url'];
    previewUrl = json['preview_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['model_type'] = modelType;
    data['model_id'] = modelId;
    data['uuid'] = uuid;
    data['collection_name'] = collectionName;
    data['name'] = name;
    data['file_name'] = fileName;
    data['mime_type'] = mimeType;
    data['disk'] = disk;
    data['conversions_disk'] = conversionsDisk;
    data['size'] = size;
    data['manipulations'] = manipulations;
    data['custom_properties'] = customProperties;
    if (generatedConversions != null) {
      data['generated_conversions'] = generatedConversions!.toJson();
    }
    data['responsive_images'] = responsiveImages;
    data['order_column'] = orderColumn;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['original_url'] = originalUrl;
    data['preview_url'] = previewUrl;
    return data;
  }
}

class GeneratedConversions {
  bool? small;
  bool? medium;

  GeneratedConversions({this.small, this.medium});

  GeneratedConversions.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['small'] = small;
    data['medium'] = medium;
    return data;
  }
}
