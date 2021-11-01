// To parse this JSON data, do
//
//     final anime = animeFromJson(jsonString);

import 'dart:convert';

List<Anime> animeFromJson(String str) => List<Anime>.from(json.decode(str).map((x) => Anime.fromJson(x)));

String animeToJson(List<Anime> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Anime {
  Anime({
    this.img,
    this.link,
    this.release,
    this.title,
  });

  String? img;
  String? link;
  String? release;
  String?title;

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
    img: json["img"],
    link: json["link"],
    release: json["release"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "link": link,
    "release": release,
    "title": title,
  };
}
