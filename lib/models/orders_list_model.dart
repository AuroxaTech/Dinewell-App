class OrdersListModel {
  OrdersListModel({
      this.success, 
      this.message, 
      this.data,});

  OrdersListModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(OrdersListData.fromJson(v));
      });
    }
  }
  bool? success;
  String? message;
  List<OrdersListData>? data;

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

class OrdersListData {
  OrdersListData({
      this.id, 
      this.staffId, 
      this.memberId, 
      this.cardId, 
      this.rewardId, 
      this.partnerName, 
      this.partnerEmail, 
      this.staffName, 
      this.staffEmail, 
      this.cardTitle, 
      this.rewardTitle, 
      this.rewardPoints, 
      this.currency, 
      this.purchaseAmount, 
      this.points, 
      this.pointsUsed, 
      this.currencyUnitAmount, 
      this.pointsPerCurrency, 
      this.pointValue, 
      this.minPointsPerPurchase, 
      this.maxPointsPerPurchase, 
      this.minPointsPerRedemption, 
      this.maxPointsPerRedemption, 
      this.event, 
      this.note, 
      this.expiresAt, 
      this.meta, 
      this.createdBy, 
      this.deletedBy, 
      this.updatedBy, 
      this.deletedAt, 
      this.createdAt, 
      this.updatedAt,});

  OrdersListData.fromJson(dynamic json) {
    id = json['id'];
    staffId = json['staff_id'];
    memberId = json['member_id'];
    cardId = json['card_id'];
    rewardId = json['reward_id'];
    partnerName = json['partner_name'];
    partnerEmail = json['partner_email'];
    staffName = json['staff_name'];
    staffEmail = json['staff_email'];
    cardTitle = json['card_title'] != null ? CardTitle.fromJson(json['card_title']) : null;
    rewardTitle = json['reward_title'];
    rewardPoints = json['reward_points'];
    currency = json['currency'];
    purchaseAmount = json['purchase_amount'];
    points = json['points'];
    pointsUsed = json['points_used'];
    currencyUnitAmount = json['currency_unit_amount'];
    pointsPerCurrency = json['points_per_currency'];
    pointValue = json['point_value'];
    minPointsPerPurchase = json['min_points_per_purchase'];
    maxPointsPerPurchase = json['max_points_per_purchase'];
    minPointsPerRedemption = json['min_points_per_redemption'];
    maxPointsPerRedemption = json['max_points_per_redemption'];
    event = json['event'];
    note = json['note'];
    expiresAt = json['expires_at'];
    meta = json['meta'];
    createdBy = json['created_by'];
    deletedBy = json['deleted_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? id;
  String? staffId;
  String? memberId;
  String? cardId;
  dynamic rewardId;
  String? partnerName;
  String? partnerEmail;
  String? staffName;
  String? staffEmail;
  CardTitle? cardTitle;
  dynamic rewardTitle;
  dynamic rewardPoints;
  String? currency;
  int? purchaseAmount;
  int? points;
  int? pointsUsed;
  dynamic currencyUnitAmount;
  int? pointsPerCurrency;
  dynamic pointValue;
  int? minPointsPerPurchase;
  int? maxPointsPerPurchase;
  dynamic minPointsPerRedemption;
  dynamic maxPointsPerRedemption;
  String? event;
  dynamic note;
  String? expiresAt;
  dynamic meta;
  String? createdBy;
  dynamic deletedBy;
  dynamic updatedBy;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['staff_id'] = staffId;
    map['member_id'] = memberId;
    map['card_id'] = cardId;
    map['reward_id'] = rewardId;
    map['partner_name'] = partnerName;
    map['partner_email'] = partnerEmail;
    map['staff_name'] = staffName;
    map['staff_email'] = staffEmail;
    if (cardTitle != null) {
      map['card_title'] = cardTitle?.toJson();
    }
    map['reward_title'] = rewardTitle;
    map['reward_points'] = rewardPoints;
    map['currency'] = currency;
    map['purchase_amount'] = purchaseAmount;
    map['points'] = points;
    map['points_used'] = pointsUsed;
    map['currency_unit_amount'] = currencyUnitAmount;
    map['points_per_currency'] = pointsPerCurrency;
    map['point_value'] = pointValue;
    map['min_points_per_purchase'] = minPointsPerPurchase;
    map['max_points_per_purchase'] = maxPointsPerPurchase;
    map['min_points_per_redemption'] = minPointsPerRedemption;
    map['max_points_per_redemption'] = maxPointsPerRedemption;
    map['event'] = event;
    map['note'] = note;
    map['expires_at'] = expiresAt;
    map['meta'] = meta;
    map['created_by'] = createdBy;
    map['deleted_by'] = deletedBy;
    map['updated_by'] = updatedBy;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class CardTitle {
  CardTitle({
      this.deDE, 
      this.enUS, 
      this.esES, 
      this.frFR, 
      this.nlNL, 
      this.ptBR,});

  CardTitle.fromJson(dynamic json) {
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