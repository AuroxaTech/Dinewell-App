class CountryListModel {
  bool? success;
  String? message;
  Data? data;

  CountryListModel({this.success, this.message, this.data});

  CountryListModel.fromJson(Map<String, dynamic> json) {
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
  List<CountryListData>? countries;

  Data({this.countries});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <CountryListData>[];
      json['countries'].forEach((v) {
        countries!.add(new CountryListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryListData {
  String? id;
  String? alpha3;
  Name? name;
  String? nativeName;
  String? capital;
  String? topLevelDomain;
  String? callingCode;
  String? region;
  String? subregion;
  int? population;
  String? lat;
  String? lon;
  String? demonym;
  String? area;
  String? gini;

  CountryListData(
      {this.id,
        this.alpha3,
        this.name,
        this.nativeName,
        this.capital,
        this.topLevelDomain,
        this.callingCode,
        this.region,
        this.subregion,
        this.population,
        this.lat,
        this.lon,
        this.demonym,
        this.area,
        this.gini});

  CountryListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alpha3 = json['alpha_3'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    nativeName = json['native_name'];
    capital = json['capital'];
    topLevelDomain = json['top_level_domain'];
    callingCode = json['calling_code'];
    region = json['region'];
    subregion = json['subregion'];
    population = json['population'];
    lat = json['lat'].toString();
    lon = json['lon'].toString();
    demonym = json['demonym'];
    area = json['area'].toString();
    gini = json['gini'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alpha_3'] = this.alpha3;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['native_name'] = this.nativeName;
    data['capital'] = this.capital;
    data['top_level_domain'] = this.topLevelDomain;
    data['calling_code'] = this.callingCode;
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    data['population'] = this.population;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['demonym'] = this.demonym;
    data['area'] = this.area;
    data['gini'] = this.gini;
    return data;
  }
}

class Name {
  String? en;

  Name({this.en});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}