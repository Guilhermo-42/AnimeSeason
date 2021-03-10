class Producers {
  int malId;
  String type;
  String name;
  String url;

  Producers({
      this.malId, 
      this.type, 
      this.name, 
      this.url});

  Producers.fromJson(dynamic json) {
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