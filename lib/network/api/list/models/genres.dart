class Genres {
  int malId;
  String type;
  String name;
  String url;

  Genres({
      this.malId, 
      this.type, 
      this.name, 
      this.url});

  Genres.fromJson(dynamic json) {
    malId = json["mal_id"];
    type = json["type"];
    name = json["name"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["mal_id"] = malId;
    map["type"] = type;
    map["name"] = name;
    map["url"] = url;
    return map;
  }

}