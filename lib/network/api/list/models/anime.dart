import 'producers.dart';
import 'genres.dart';

class Anime {
  int malId;
  String url;
  String title;
  String imageUrl;
  String synopsis;
  String type;
  String airingStart;
  int episodes;
  int members;
  List<Genres> genres;
  String source;
  List<Producers> producers;
  double score;
  List<String> licensors;
  bool r18;
  bool kids;
  bool continuing;

  Anime(
      {this.malId,
      this.url,
      this.title,
      this.imageUrl,
      this.synopsis,
      this.type,
      this.airingStart,
      this.episodes,
      this.members,
      this.genres,
      this.source,
      this.producers,
      this.score,
      this.licensors,
      this.r18,
      this.kids,
      this.continuing});

  Anime.fromJson(dynamic json) {
    malId = json["mal_id"];
    url = json["url"];
    title = json["title"];
    imageUrl = json["image_url"];
    synopsis = json["synopsis"];
    type = json["type"];
    airingStart = json["airing_start"];
    episodes = json["episodes"];
    members = json["members"];
    if (json["genres"] != null) {
      genres = [];
      json["genres"].forEach((v) {
        genres.add(Genres.fromJson(v));
      });
    }
    source = json["source"];
    if (json["producers"] != null) {
      producers = [];
      json["producers"].forEach((v) {
        producers.add(Producers.fromJson(v));
      });
    }
    score = (json["score"] == null)
        ? 0.0
        : (json["score"] is double)
            ? json["score"]
            : (json["score"] as int).toDouble();
    licensors =
        json["licensors"] != null ? json["licensors"].cast<String>() : [];
    r18 = json["r18"];
    kids = json["kids"];
    continuing = json["continuing"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["mal_id"] = malId;
    map["url"] = url;
    map["title"] = title;
    map["image_url"] = imageUrl;
    map["synopsis"] = synopsis;
    map["type"] = type;
    map["airing_start"] = airingStart;
    map["episodes"] = episodes;
    map["members"] = members;
    if (genres != null) {
      map["genres"] = genres.map((v) => v.toJson()).toList();
    }
    map["source"] = source;
    if (producers != null) {
      map["producers"] = producers.map((v) => v.toJson()).toList();
    }
    map["score"] = score;
    map["licensors"] = licensors;
    map["r18"] = r18;
    map["kids"] = kids;
    map["continuing"] = continuing;
    return map;
  }
}
