// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

import 'package:dev_yahia/services/firestore_storage.dart';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
  Project({
    this.id,
    required this.name,
    this.androidId,
    this.iosUrl,
    this.webUrl,
    required this.skills,
    required this.description,
    required this.image,
  });

  final String? id;
  final String name;
  final String? androidId;
  final String? iosUrl;
  final String? webUrl;
  final List<String> skills;
  final String description;
  final String image;

  factory Project.fromJson(Map<String, dynamic> json, [String? documentId]) => Project(
        id: documentId ?? "",
        name: json["name"] ?? "",
        androidId: json["androidId"] ?? "",
        iosUrl: json["iosUrl"] ?? "",
        webUrl: json["webUrl"] ?? "",
        skills: List<String>.from(json["skills"]?.map((x) => x)),
        description: json["description"] ?? "",
        image: json["imageUrl"] ?? "",
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

  Future<String> get getDownloadUrl async => await MyFirebaseStorage().getDownloadUrl(this.image);

  String get androidUrl => "https://play.google.com/store/apps/details?id=$androidId";
}

// ignore: non_constant_identifier_names
List<Project> PROJECTS = [
  // CHOSEN AYA
  Project(
    name: 'Palestine Filter',
    description: 'Add Palestine Filter to Your Images, with many filter options.',
    image: 'images/projects/palestine-filter.png',
    androidId: 'com.devyahia.palestine_filter',
    webUrl: 'https://www.devyahia.com/palestine-filter',
    skills: [
      'Dart',
      'Flutter',
    ],
  ),
  // CHOSEN AYA
  Project(
    name: 'آية مختارة',
    description:
        'An app that shows a random verse of the Holy Quran as a notification, including tafsir, the user has control over showing the notifications and how often they show up, the user also can navigate through the whole Quran verse by verse, and export each verse as a sharable image.',
    image: 'images/projects/chosen-aya.png',
    androidId: 'com.devyahia.randomayah',
    iosUrl: 'https://apps.apple.com/us/app/id1547251866',
    skills: [
      'Dart',
      'SQL',
      'Flutter',
    ],
  ),
  // MENTAL MATH
  Project(
    name: 'Mental Math',
    description:
        'An educational game built for Android & iOS, localized to multiple languages including (Arabic, English, German, Russian). The game has recently been featured by Apple in New Games We Love section in 25+ countries.',
    image: 'images/projects/mental-math.png',
    androidId: 'com.devyahia.android.mentalmaths',
    iosUrl: 'https://apps.apple.com/us/app/id1547325124',
    skills: [
      'Dart',
      'Flutter',
      'SQL',
      'Firebase',
    ],
  ),
  // GPA CALC
  Project(
    name: 'GPA Calculator - JU',
    description:
        'An app that keeps track of the students’ GPA, providing GPA for each semester and the cumulative GPA. For JU students only.',
    image: 'images/projects/gpa-calc.png',
    androidId: 'com.devyahia.gpacalc',
    iosUrl: 'https://apps.apple.com/us/app/id1551541456',
    skills: [
      'Dart',
      'Flutter',
      'SQL',
      'Firebase',
    ],
  ),
  // UNI SCHEDULE
  Project(
    name: 'Uni Schedule',
    description:
        'Students in the faculty of medicine always complained of their lecture’s changing time suddenly without prior notice, and sometimes the students missed some of their classes due to that problem, Uni schedule comes to solve this problem by providing real time access to a database that is constantly updated with the latest changes to their schedule.',
    image: 'images/projects/uni-sched.jpg',
    androidId: 'com.devyahia.android.myschedule',
    skills: [
      'Java',
      'Firebase',
      'Google Sheets',
    ],
  ),
  // FANNEH
  Project(
    name: 'Coin Toss',
    description:
        'The idea of the application is very simple, and it is clear from its name, it is yes, coin tossing, but in the currencies of the Hashemite Kingdom of Jordan.',
    image: 'images/projects/fanneh.png',
    androidId: 'com.devyahia.fanneh',
    skills: [
      'Flutter',
      'Dart',
      'Admob',
    ],
  ),
];
