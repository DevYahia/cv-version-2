import 'package:dev_yahia/data/projects.dart';
import 'package:dev_yahia/services/firestore_database.dart';
import 'package:dev_yahia/services/firestore_storage.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  final FirestoreDatabase _db = FirestoreDatabase();
  final MyFirebaseStorage _st = MyFirebaseStorage();

  DataProvider() {
    loadProjects();
  }

  List<Project>? projects;

  Future<void> loadProjects() async {
    final loadedProjects = await _db.allProjects();
    final projectsWithUrl = loadedProjects.map((project) async {
      final downloadUrl = await _st.getDownloadUrl(project.image);
      return project.copyWithDownloadUrl(downloadUrl);
    }).toList();

    projects = await Future.wait<Project>(projectsWithUrl);
    notifyListeners();
  }
}
