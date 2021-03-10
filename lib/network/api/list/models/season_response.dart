import 'anime.dart';

class SeasonResponse {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  String seasonName;
  int seasonYear;
  List<Anime> anime;

  SeasonResponse({
      this.requestHash, 
      this.requestCached, 
      this.requestCacheExpiry, 
      this.seasonName, 
      this.seasonYear, 
      this.anime});

  SeasonResponse.fromJson(dynamic json) {
    requestHash = json["request_hash"];
    requestCached = json["request_cached"];
    requestCacheExpiry = json["request_cache_expiry"];
    seasonName = json["season_name"];
    seasonYear = json["season_year"];
    if (json["anime"] != null) {
      anime = [];
      json["anime"].forEach((v) {
        anime.add(Anime.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["request_hash"] = requestHash;
    map["request_cached"] = requestCached;
    map["request_cache_expiry"] = requestCacheExpiry;
    map["season_name"] = seasonName;
    map["season_year"] = seasonYear;
    if (anime != null) {
      map["anime"] = anime.map((v) => v.toJson()).toList();
    }
    return map;
  }

}