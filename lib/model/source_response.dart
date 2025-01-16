class SourceResponce {
  String? status;
  List<Sources>? sources;
  String? code;
  String? message;

  SourceResponce({this.status, this.sources, this.code, this.message});

  SourceResponce.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    message = json["message"];
    status = json["status"];

    if (json["sources"] is List) {
      sources = json["sources"] == null
          ? null
          : (json["sources"] as List).map((e) => Sources.fromJson(e)).toList();
    }
  }

  static List<SourceResponce> fromList(List<Map<String, dynamic>> list) {
    return list.map(SourceResponce.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    if (sources != null) {
      data["sources"] = sources?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  Sources.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["language"] is String) {
      language = json["language"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
  }

  static List<Sources> fromList(List<Map<String, dynamic>> list) {
    return list.map(Sources.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["url"] = url;
    data["category"] = category;
    data["language"] = language;
    data["country"] = country;
    return data;
  }
}
