import 'package:dev_yahia/data/projects.dart';
import 'package:dev_yahia/services/firestore_service.dart';

class FirestoreDatabase {
  FirestoreDatabase();

  final _firestoreService = FirestoreService.instance;

  /// Method to retrieve all todos item from the same user based on uid
  Future<List<Project>> allProjects() => _firestoreService.collection(
        path: 'projects',
        builder: (data, documentId) => Project.fromJson(data, documentId),
      );
}
