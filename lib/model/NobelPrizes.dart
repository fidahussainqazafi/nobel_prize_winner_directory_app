import 'Laureates.dart';

class NobelPrizes {
  String? awardYear;
  String? category;
  String? categoryFullName;
  String? dateAwarded;
  int? prizeAmount;
  int? prizeAmountAdjusted;
  List<Laureates>? laureates;

  NobelPrizes({
    this.awardYear,
    this.category,
    this.categoryFullName,
    this.dateAwarded,
    this.prizeAmount,
    this.prizeAmountAdjusted,
    this.laureates,
  });

  NobelPrizes.fromJson(dynamic json) {
    awardYear = json['awardYear'];
    category = json['category'];
    categoryFullName = json['categoryFullName'];
    dateAwarded = json['dateAwarded'];
    prizeAmount = json['prizeAmount'];
    prizeAmountAdjusted = json['prizeAmountAdjusted'];
    if (json['laureates'] != null) {
      laureates = List<Laureates>.from(
        json['laureates'].map((v) => Laureates.fromJson(v)),
      );
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['awardYear'] = awardYear;
    map['category'] = category;
    map['categoryFullName'] = categoryFullName;
    map['dateAwarded'] = dateAwarded;
    map['prizeAmount'] = prizeAmount;
    map['prizeAmountAdjusted'] = prizeAmountAdjusted;
    if (laureates != null) {
      map['laureates'] = laureates!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
