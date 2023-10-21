import 'NobelPrizes.dart';

class PrizeDetailsModel {
  List<NobelPrizes>? nobelPrizes;

  PrizeDetailsModel({
    this.nobelPrizes,
  });

  PrizeDetailsModel.fromJson(dynamic json) {
    nobelPrizes = List<NobelPrizes>.from(
      json['nobelPrizes']?.map((v) => NobelPrizes.fromJson(v)) ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (nobelPrizes != null) {
      map['nobelPrizes'] = nobelPrizes!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
