// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project implements Comparable<Project> {
  Project({
    this.id,
    required this.name,
    this.androidId,
    this.iosUrl,
    this.webUrl,
    this.order = 1000,
    required this.skills,
    required this.description,
    required this.image,
    String? downloadUrl,
  }) : _downloadUrl = downloadUrl;

  final String? id;
  final String name;
  final String? androidId;
  final String? iosUrl;
  final String? webUrl;
  final List<String> skills;
  final String description;
  final String image;
  final int order;

  final String? _downloadUrl;

  factory Project.fromJson(Map<String, dynamic> json, [String? documentId]) => Project(
        id: documentId,
        name: json["name"] ?? "",
        androidId: json["androidId"],
        iosUrl: json["iosUrl"],
        webUrl: json["webUrl"],
        skills: List<String>.from(json["skills"]?.map((x) => x)),
        description: json["description"] ?? "",
        image: json["imageUrl"] ?? "",
        order: json["order"] ?? 1000,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "androidId": androidId,
        "iosUrl": iosUrl,
        "webUrl": webUrl,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "description": description,
        "imageUrl": image,
      };

  String? get downloadUrl => this._downloadUrl;

  String get androidUrl => "https://play.google.com/store/apps/details?id=$androidId";

  Project copyWithDownloadUrl(String? downloadUrl) {
    return Project(
        name: this.name,
        skills: this.skills,
        description: this.description,
        image: this.image,
        androidId: this.androidId,
        iosUrl: this.iosUrl,
        webUrl: this.webUrl,
        downloadUrl: downloadUrl ?? this._downloadUrl,
        order: this.order);
  }

  @override
  int compareTo(Project other) {
    return this.order.compareTo(other.order);
  }
}
