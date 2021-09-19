// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

List<Model> modelFromJson(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
    Model({
        required this.name,
        required this.verses,
    });

    String name;
    List<Verse> verses;

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        name: json["name"],
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
    };
}

class Verse {
    Verse({
        required this.text,
        required this.translationId,
    });

    String text;
    String translationId;

    factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        text: json["text"],
        translationId: json["translation_id"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "translation_id": translationId,
    };
}
