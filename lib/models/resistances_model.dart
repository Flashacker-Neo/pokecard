class ResistancesModel {
  String type;
  String value;

  ResistancesModel({this.type, this.value});

  factory ResistancesModel.fromJson(Map<String, dynamic> json) {
    return ResistancesModel(
      type: json['type'].toString(),
      value: json['value'].toString(),
    );
  }
}
