class ProfileDetailsModel {
  bool? success;
  String? message;
  Data? data;

  ProfileDetailsModel({this.success, this.message, this.data});

  ProfileDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? affiliateId;
  int? role;
  String? memberNumber;
  String? uniqueIdentifier;
  String? displayName;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? birthday;
  int? gender;
  String? latitude;
  String? longitude;
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
  int? isVip;
  int? acceptsEmails;
  int? acceptsTextMessages;
  int? isUndeletable;
  int? isUneditable;
  int? numberOfTimesLoggedIn;
  String? lastLoginAt;
  int? numberOfEmailsReceived;
  int? numberOfTextMessagesReceived;
  int? numberOfReviewsWritten;
  int? numberOfRatingsGiven;
  String? meta;
  String? createdBy;
  String? deletedBy;
  String? updatedBy;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? avatar;
  List<Media>? media;

  Data(
      {this.id,
        this.affiliateId,
        this.role,
        this.memberNumber,
        this.uniqueIdentifier,
        this.displayName,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.birthday,
        this.gender,
        this.latitude,
        this.longitude,
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
        this.isVip,
        this.acceptsEmails,
        this.acceptsTextMessages,
        this.isUndeletable,
        this.isUneditable,
        this.numberOfTimesLoggedIn,
        this.lastLoginAt,
        this.numberOfEmailsReceived,
        this.numberOfTextMessagesReceived,
        this.numberOfReviewsWritten,
        this.numberOfRatingsGiven,
        this.meta,
        this.createdBy,
        this.deletedBy,
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.avatar,
        this.media});

  Data.fromJson(Map<String, dynamic> json) {
    print("Json Data ======> ${json.toString()}");
    id = json['id'];
    affiliateId = json['affiliate_id'];
    role = json['role'];
    memberNumber = json['member_number'];
    uniqueIdentifier = json['unique_identifier'];
    displayName = json['display_name'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    birthday = json['birthday'];
    gender = json['gender'];
    latitude = json['latitude'];
    longitude = json['longitude'];
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
    isVip = json['is_vip'];
    acceptsEmails = json['accepts_emails'];
    acceptsTextMessages = json['accepts_text_messages'];
    isUndeletable = json['is_undeletable'];
    isUneditable = json['is_uneditable'];
    numberOfTimesLoggedIn = json['number_of_times_logged_in'];
    lastLoginAt = json['last_login_at'];
    numberOfEmailsReceived = json['number_of_emails_received'];
    numberOfTextMessagesReceived = json['number_of_text_messages_received'];
    numberOfReviewsWritten = json['number_of_reviews_written'];
    numberOfRatingsGiven = json['number_of_ratings_given'];
    meta = json['meta'];
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
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['affiliate_id'] = this.affiliateId;
    data['role'] = this.role;
    data['member_number'] = this.memberNumber;
    data['unique_identifier'] = this.uniqueIdentifier;
    data['display_name'] = this.displayName;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['two_factor_enabled'] = this.twoFactorEnabled;
    data['two_factor_secret'] = this.twoFactorSecret;
    data['two_factor_recovery_codes'] = this.twoFactorRecoveryCodes;
    data['account_expires_at'] = this.accountExpiresAt;
    data['premium_expires_at'] = this.premiumExpiresAt;
    data['locale'] = this.locale;
    data['country_code'] = this.countryCode;
    data['currency'] = this.currency;
    data['time_zone'] = this.timeZone;
    data['phone_prefix'] = this.phonePrefix;
    data['phone_country'] = this.phoneCountry;
    data['phone'] = this.phone;
    data['phone_e164'] = this.phoneE164;
    data['is_active'] = this.isActive;
    data['is_vip'] = this.isVip;
    data['accepts_emails'] = this.acceptsEmails;
    data['accepts_text_messages'] = this.acceptsTextMessages;
    data['is_undeletable'] = this.isUndeletable;
    data['is_uneditable'] = this.isUneditable;
    data['number_of_times_logged_in'] = this.numberOfTimesLoggedIn;
    data['last_login_at'] = this.lastLoginAt;
    data['number_of_emails_received'] = this.numberOfEmailsReceived;
    data['number_of_text_messages_received'] =
        this.numberOfTextMessagesReceived;
    data['number_of_reviews_written'] = this.numberOfReviewsWritten;
    data['number_of_ratings_given'] = this.numberOfRatingsGiven;
    data['meta'] = this.meta;
    data['created_by'] = this.createdBy;
    data['deleted_by'] = this.deletedBy;
    data['updated_by'] = this.updatedBy;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['avatar'] = this.avatar;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
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
  List<Null>? manipulations;
  List<Null>? customProperties;
  GeneratedConversions? generatedConversions;
  List<Null>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? originalUrl;
  String? previewUrl;

  Media(
      {this.id,
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
        this.previewUrl});

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
    if (json['manipulations'] != null) {
      manipulations = <Null>[];
      json['manipulations'].forEach((v) {
        // manipulations!.add(new Null.fromJson(v));
      });
    }
    if (json['custom_properties'] != null) {
      customProperties = <Null>[];
      json['custom_properties'].forEach((v) {
        // customProperties!.add(new Null.fromJson(v));
      });
    }
    generatedConversions = json['generated_conversions'] != null
        ? new GeneratedConversions.fromJson(json['generated_conversions'])
        : null;
    if (json['responsive_images'] != null) {
      responsiveImages = <Null>[];
      json['responsive_images'].forEach((v) {
        // responsiveImages!.add(new Null.fromJson(v));
      });
    }
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    originalUrl = json['original_url'];
    previewUrl = json['preview_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model_type'] = this.modelType;
    data['model_id'] = this.modelId;
    data['uuid'] = this.uuid;
    data['collection_name'] = this.collectionName;
    data['name'] = this.name;
    data['file_name'] = this.fileName;
    data['mime_type'] = this.mimeType;
    data['disk'] = this.disk;
    data['conversions_disk'] = this.conversionsDisk;
    data['size'] = this.size;
    if (this.manipulations != null) {
      // data['manipulations'] =
      //     this.manipulations!.map((v) => v.toJson()).toList();
    }
    if (this.customProperties != null) {
      // data['custom_properties'] =
      //     this.customProperties!.map((v) => v.toJson()).toList();
    }
    if (this.generatedConversions != null) {
      data['generated_conversions'] = this.generatedConversions!.toJson();
    }
    if (this.responsiveImages != null) {
      // data['responsive_images'] =
      //     this.responsiveImages!.map((v) => v.toJson()).toList();
    }
    data['order_column'] = this.orderColumn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['original_url'] = this.originalUrl;
    data['preview_url'] = this.previewUrl;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    return data;
  }
}
