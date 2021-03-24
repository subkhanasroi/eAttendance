class ActivityInfo {
  int id;
  int warnaBG;
  DateTime activityDateTime;
  String description;

  ActivityInfo({
    this.id,
    this.warnaBG,
    this.description,
    this.activityDateTime,
  });
  factory ActivityInfo.fromMap(Map<String, dynamic> json) => ActivityInfo(
        id: json["id"],
        warnaBG: int.parse(json["warnaBG"]),
        description: json["description"],
        activityDateTime: DateTime.parse(json["activityDateTime"]),
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "warnaBG": warnaBG,
        "description": description,
        "activityDateTime": activityDateTime.toIso8601String(),
      };
}
