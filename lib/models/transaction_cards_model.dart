class TransactionCardsModel {
  TransactionCardsModel({
      this.success, 
      this.message, 
      this.data,});

  TransactionCardsModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(TransactionCardsData.fromJson(v));
      });
    }
  }
  bool? success;
  String? message;
  List<TransactionCardsData>? data;

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

class TransactionCardsData {
  TransactionCardsData({
      this.id, 
      this.clubId, 
      this.name, 
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
      this.isVisibleByDefault, 
      this.isVisibleWhenLoggedIn, 
      this.totalAmountPurchased, 
      this.numberOfPointsIssued, 
      this.lastPointsIssuedAt, 
      this.numberOfPointsRedeemed, 
      this.numberOfRewardsRedeemed, 
      this.lastRewardRedeemedAt, 
      this.views, 
      this.lastView, 
      this.meta, 
      this.createdAt, 
      this.updatedAt, 
      this.balance,});

  TransactionCardsData.fromJson(dynamic json) {
    id = json['id'];
    clubId = json['club_id'];
    name = json['name'];
    head = json['head'] != null ? Head.fromJson(json['head']) : null;
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    description = json['description'] != null ? Description.fromJson(json['description']) : null;
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
    isVisibleByDefault = json['is_visible_by_default'];
    isVisibleWhenLoggedIn = json['is_visible_when_logged_in'];
    totalAmountPurchased = json['total_amount_purchased'];
    numberOfPointsIssued = json['number_of_points_issued'];
    lastPointsIssuedAt = json['last_points_issued_at'];
    numberOfPointsRedeemed = json['number_of_points_redeemed'];
    numberOfRewardsRedeemed = json['number_of_rewards_redeemed'];
    lastRewardRedeemedAt = json['last_reward_redeemed_at'];
    views = json['views'];
    lastView = json['last_view'];
    meta = json['meta'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    balance = json['balance'];
  }
  String? id;
  String? clubId;
  String? name;
  Head? head;
  Title? title;
  Description? description;
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
  int? isVisibleByDefault;
  int? isVisibleWhenLoggedIn;
  int? totalAmountPurchased;
  int? numberOfPointsIssued;
  String? lastPointsIssuedAt;
  int? numberOfPointsRedeemed;
  int? numberOfRewardsRedeemed;
  String? lastRewardRedeemedAt;
  int? views;
  String? lastView;
  dynamic meta;
  String? createdAt;
  String? updatedAt;
  int? balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['club_id'] = clubId;
    map['name'] = name;
    if (head != null) {
      map['head'] = head?.toJson();
    }
    if (title != null) {
      map['title'] = title?.toJson();
    }
    if (description != null) {
      map['description'] = description?.toJson();
    }
    map['unique_identifier'] = uniqueIdentifier;
    map['issue_date'] = issueDate;
    map['expiration_date'] = expirationDate;
    map['bg_color'] = bgColor;
    map['bg_color_opacity'] = bgColorOpacity;
    map['text_color'] = textColor;
    map['text_label_color'] = textLabelColor;
    map['qr_color_light'] = qrColorLight;
    map['qr_color_dark'] = qrColorDark;
    map['currency'] = currency;
    map['initial_bonus_points'] = initialBonusPoints;
    map['points_expiration_months'] = pointsExpirationMonths;
    map['currency_unit_amount'] = currencyUnitAmount;
    map['points_per_currency'] = pointsPerCurrency;
    map['point_value'] = pointValue;
    map['min_points_per_purchase'] = minPointsPerPurchase;
    map['max_points_per_purchase'] = maxPointsPerPurchase;
    map['is_visible_by_default'] = isVisibleByDefault;
    map['is_visible_when_logged_in'] = isVisibleWhenLoggedIn;
    map['total_amount_purchased'] = totalAmountPurchased;
    map['number_of_points_issued'] = numberOfPointsIssued;
    map['last_points_issued_at'] = lastPointsIssuedAt;
    map['number_of_points_redeemed'] = numberOfPointsRedeemed;
    map['number_of_rewards_redeemed'] = numberOfRewardsRedeemed;
    map['last_reward_redeemed_at'] = lastRewardRedeemedAt;
    map['views'] = views;
    map['last_view'] = lastView;
    map['meta'] = meta;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['balance'] = balance;
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

class Head {
  Head({
      this.deDE, 
      this.enUS, 
      this.esES, 
      this.frFR, 
      this.nlNL, 
      this.ptBR,});

  Head.fromJson(dynamic json) {
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