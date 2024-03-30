class ChartDataModel {
  String name;
  double value;

  ChartDataModel({
    required this.name,
    required this.value,
  });

  ChartDataModel copyWith({
    String? name,
    double? value,
  }) =>
      ChartDataModel(
        name: name ?? this.name,
        value: value ?? this.value,
      );

  factory ChartDataModel.fromMap(Map<String, dynamic> json) => ChartDataModel(
        name: json["name"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "value": value,
      };
}

enum ChartType { PIE_CHART, LINE_CHART, BAR_CHART }

final chartTypeValues = EnumValues({
  "BAR_CHART": ChartType.BAR_CHART,
  "LINE_CHART": ChartType.LINE_CHART,
  "PIE_CHART": ChartType.PIE_CHART
});

enum ChartOption { BY_TYPE, BY_ASSIGNEE, BY_STATUS }

final chartOptionValues = EnumValues({
  "BY_ASSIGNEE": ChartOption.BY_ASSIGNEE,
  "BY_STATUS": ChartOption.BY_STATUS,
  "BY_TYPE": ChartOption.BY_TYPE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
