class BalanceModel {
  BalanceModel({
      this.success, 
      this.message, 
      this.data,});

  BalanceModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? BalanceModelData.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  BalanceModelData? data;

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

class BalanceModelData {
  BalanceModelData({
      this.balance,});

  BalanceModelData.fromJson(dynamic json) {
    balance = json['balance'];
  }
  int? balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['balance'] = balance;
    return map;
  }

}