import 'package:firebase_storage/firebase_storage.dart';

class MyFirebaseStorage {
  MyFirebaseStorage();

  final _bucketRef = FirebaseStorage.instance;

  Future<String> getDownloadUrl(String path) async {
    // print("path: $path");
    final childRef = _bucketRef.ref("projects/$path");
    String downloadURL = await childRef.getDownloadURL();
    // print(downloadURL);
    return downloadURL.toString();
  }
}
