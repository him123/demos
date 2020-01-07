import 'dart:convert';

class SavedSearchModel{

  SavedSearchModel clientFromJson(String str) {
    final jsonData = json.decode(str);
    return SavedSearchModel.fromMap(jsonData);
  }

  String clientToJson(SavedSearchModel data) {
    final dyn = data.toMap();
    return json.encode(dyn);
  }

  String url;
  String name;
  String date;
  String filters;
  String is_map_included;


  SavedSearchModel({
    this.url,
    this.name,
    this.date,
    this.filters,
    this.is_map_included,
  });

  factory SavedSearchModel.fromMap(Map<String, dynamic> json) => new SavedSearchModel(
    url: json["url"],
    name: json["name"],
    date: json["date"],
    filters: json["filters"],
    is_map_included: json["is_map_included"],
  );

  Map<String, dynamic> toMap() => {
    "url": url,
    "name": name,
    "date": date,
    "filters": filters,
    "is_map_included": is_map_included,
  };
}