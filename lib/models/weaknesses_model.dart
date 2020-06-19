class WeaknessesModel {
  String type;
  String value;

  WeaknessesModel({this.type, this.value});

  factory WeaknessesModel.fromJson(Map<String, dynamic> json) {
    return WeaknessesModel(
      type: json['type'].toString(),
      value: json['value'].toString(),
    );
  }
}
