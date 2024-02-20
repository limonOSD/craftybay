import 'package:craftybay/data/models/brand_item.dart';

class BrandListModel {
  String? msg;
  List<BrandList>? brandList;

  BrandListModel({this.msg, this.brandList});

  BrandListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      brandList = <BrandList>[];
      json['data'].forEach((v) {
        brandList!.add(BrandList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = this.msg;
    if (brandList != null) {
      data['data'] = brandList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
