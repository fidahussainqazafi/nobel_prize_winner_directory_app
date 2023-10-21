class Laureates {
  int? id;
  String? knownName;
  String? fullName;
  String? portion;
  int? sortOrder;
  String? motivation;

  Laureates({
    this.id,
    this.knownName,
    this.fullName,
    this.portion,
    this.sortOrder,
    this.motivation,
  });

  Laureates.fromJson(dynamic json) {
    id = json['id'];
    knownName = json['knownName'];
    fullName = json['fullName'];
    portion = json['portion'];
    sortOrder = json['sortOrder'];
    motivation = json['motivation'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['knownName'] = knownName;
    map['fullName'] = fullName;
    map['portion'] = portion;
    map['sortOrder'] = sortOrder;
    map['motivation'] = motivation;
    return map;
  }
}
