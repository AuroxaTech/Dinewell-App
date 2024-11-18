class AllCardsListModel {
  bool? success;
  String? message;
  List<CardListData>? data;

  AllCardsListModel({this.success, this.message, this.data});

  AllCardsListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CardListData>[];
      json['data'].forEach((v) {
        data!.add(CardListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CardListData {
  String? id;
  String? clubId;
  String? name;
  String? type;
  String? icon;
  Head? head;
  Head? title;
  Head? description;
  String? uniqueIdentifier;
  String? issueDate;
  String? expirationDate;
  String? bgColor;
  int? bgColorOpacity;
  String? textColor;
  String? textLabelColor;
  String? qrColorLight;
  String? qrColorDark;
  String? currency;
  int? initialBonusPoints;
  int? pointsExpirationMonths;
  int? currencyUnitAmount;
  int? pointsPerCurrency;
  String? pointValue;
  int? minPointsPerPurchase;
  int? maxPointsPerPurchase;
  int? minPointsPerRedemption;
  int? maxPointsPerRedemption;
  String? customRule1;
  String? customRule2;
  String? customRule3;
  int? isActive;
  int? isVisibleByDefault;
  int? isVisibleWhenLoggedIn;
  int? isUndeletable;
  int? isUneditable;
  int? totalAmountPurchased;
  int? numberOfPointsIssued;
  String? lastPointsIssuedAt;
  int? numberOfPointsRedeemed;
  int? numberOfRewardsRedeemed;
  String? lastRewardRedeemedAt;
  int? views;
  String? lastView;
  Meta? meta;
  String? createdBy;
  String? deletedBy;
  int? updatedBy;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  int? balance;
  int? points;

  CardListData(
      {this.id,
      this.clubId,
      this.name,
      this.type,
      this.icon,
      this.head,
      this.title,
      this.description,
      this.uniqueIdentifier,
      this.issueDate,
      this.expirationDate,
      this.bgColor,
      this.bgColorOpacity,
      this.textColor,
      this.textLabelColor,
      this.qrColorLight,
      this.qrColorDark,
      this.currency,
      this.initialBonusPoints,
      this.pointsExpirationMonths,
      this.currencyUnitAmount,
      this.pointsPerCurrency,
      this.pointValue,
      this.minPointsPerPurchase,
      this.maxPointsPerPurchase,
      this.minPointsPerRedemption,
      this.maxPointsPerRedemption,
      this.customRule1,
      this.customRule2,
      this.customRule3,
      this.isActive,
      this.isVisibleByDefault,
      this.isVisibleWhenLoggedIn,
      this.isUndeletable,
      this.isUneditable,
      this.totalAmountPurchased,
      this.numberOfPointsIssued,
      this.lastPointsIssuedAt,
      this.numberOfPointsRedeemed,
      this.numberOfRewardsRedeemed,
      this.lastRewardRedeemedAt,
      this.views,
      this.lastView,
      this.meta,
      this.createdBy,
      this.deletedBy,
      this.updatedBy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.balance,
      this.points});

  CardListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clubId = json['club_id'];
    name = json['name'];
    type = json['type'];
    icon = json['icon'];
    head = json['head'] != null ? Head.fromJson(json['head']) : null;
    title = json['title'] != null ? Head.fromJson(json['title']) : null;
    description =
        json['description'] != null ? Head.fromJson(json['description']) : null;
    uniqueIdentifier = json['unique_identifier'];
    issueDate = json['issue_date'];
    expirationDate = json['expiration_date'];
    bgColor = json['bg_color'];
    bgColorOpacity = json['bg_color_opacity'];
    textColor = json['text_color'];
    textLabelColor = json['text_label_color'];
    qrColorLight = json['qr_color_light'];
    qrColorDark = json['qr_color_dark'];
    currency = json['currency'];
    initialBonusPoints = json['initial_bonus_points'];
    pointsExpirationMonths = json['points_expiration_months'];
    currencyUnitAmount = json['currency_unit_amount'];
    pointsPerCurrency = json['points_per_currency'];
    pointValue = json['point_value'];
    minPointsPerPurchase = json['min_points_per_purchase'];
    maxPointsPerPurchase = json['max_points_per_purchase'];
    minPointsPerRedemption = json['min_points_per_redemption'];
    maxPointsPerRedemption = json['max_points_per_redemption'];
    customRule1 = json['custom_rule1'];
    customRule2 = json['custom_rule2'];
    customRule3 = json['custom_rule3'];
    isActive = json['is_active'];
    isVisibleByDefault = json['is_visible_by_default'];
    isVisibleWhenLoggedIn = json['is_visible_when_logged_in'];
    isUndeletable = json['is_undeletable'];
    isUneditable = json['is_uneditable'];
    totalAmountPurchased = json['total_amount_purchased'];
    numberOfPointsIssued = json['number_of_points_issued'];
    lastPointsIssuedAt = json['last_points_issued_at'];
    numberOfPointsRedeemed = json['number_of_points_redeemed'];
    numberOfRewardsRedeemed = json['number_of_rewards_redeemed'];
    lastRewardRedeemedAt = json['last_reward_redeemed_at'];
    views = json['views'];
    lastView = json['last_view'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    createdBy = json['created_by'];
    deletedBy = json['deleted_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    balance = json['balance'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['club_id'] = clubId;
    data['name'] = name;
    data['type'] = type;
    data['icon'] = icon;
    if (head != null) {
      data['head'] = head!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['unique_identifier'] = uniqueIdentifier;
    data['issue_date'] = issueDate;
    data['expiration_date'] = expirationDate;
    data['bg_color'] = bgColor;
    data['bg_color_opacity'] = bgColorOpacity;
    data['text_color'] = textColor;
    data['text_label_color'] = textLabelColor;
    data['qr_color_light'] = qrColorLight;
    data['qr_color_dark'] = qrColorDark;
    data['currency'] = currency;
    data['initial_bonus_points'] = initialBonusPoints;
    data['points_expiration_months'] = pointsExpirationMonths;
    data['currency_unit_amount'] = currencyUnitAmount;
    data['points_per_currency'] = pointsPerCurrency;
    data['point_value'] = pointValue;
    data['min_points_per_purchase'] = minPointsPerPurchase;
    data['max_points_per_purchase'] = maxPointsPerPurchase;
    data['min_points_per_redemption'] = minPointsPerRedemption;
    data['max_points_per_redemption'] = maxPointsPerRedemption;
    data['custom_rule1'] = customRule1;
    data['custom_rule2'] = customRule2;
    data['custom_rule3'] = customRule3;
    data['is_active'] = isActive;
    data['is_visible_by_default'] = isVisibleByDefault;
    data['is_visible_when_logged_in'] = isVisibleWhenLoggedIn;
    data['is_undeletable'] = isUndeletable;
    data['is_uneditable'] = isUneditable;
    data['total_amount_purchased'] = totalAmountPurchased;
    data['number_of_points_issued'] = numberOfPointsIssued;
    data['last_points_issued_at'] = lastPointsIssuedAt;
    data['number_of_points_redeemed'] = numberOfPointsRedeemed;
    data['number_of_rewards_redeemed'] = numberOfRewardsRedeemed;
    data['last_reward_redeemed_at'] = lastRewardRedeemedAt;
    data['views'] = views;
    data['last_view'] = lastView;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['created_by'] = createdBy;
    data['deleted_by'] = deletedBy;
    data['updated_by'] = updatedBy;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['balance'] = balance;
    data['points'] = points;
    return data;
  }
}

class Head {
  String? enUS;
  String? deDE;
  String? esES;
  String? frFR;
  String? nlNL;
  String? ptBR;

  Head({this.enUS, this.deDE, this.esES, this.frFR, this.nlNL, this.ptBR});

  Head.fromJson(Map<String, dynamic> json) {
    enUS = json['en_US'];
    deDE = json['de_DE'];
    esES = json['es_ES'];
    frFR = json['fr_FR'];
    nlNL = json['nl_NL'];
    ptBR = json['pt_BR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en_US'] = enUS;
    data['de_DE'] = deDE;
    data['es_ES'] = esES;
    data['fr_FR'] = frFR;
    data['nl_NL'] = nlNL;
    data['pt_BR'] = ptBR;
    return data;
  }
}

class Meta {
  String? website;
  String? route;
  String? phone;

  Meta({this.website, this.route, this.phone});

  Meta.fromJson(Map<String, dynamic> json) {
    website = json['website'];
    route = json['route'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['website'] = website;
    data['route'] = route;
    data['phone'] = phone;
    return data;
  }
}
