class AttackModel {
  String name;
  List<String> cost;
  String text;
  String damage;
  String convertedEnergyCost;

  AttackModel(
      {this.name, this.cost, this.text, this.damage, this.convertedEnergyCost});

  factory AttackModel.fromJson(Map<String, dynamic> json) {
    return AttackModel(
        name: json['name'].toString(),
        cost: json['cost'] != null ? List<String>.from(json['cost']) : [],
        text: json['text'].toString(),
        damage: json['damage'].toString(),
        convertedEnergyCost: json['convertedEnergyCost'].toString());
  }

  @override
  String toString() {
    return 'AttackModel{name=$name, damage=$damage}';
  }
}
