import 'package:cloud_firestore/cloud_firestore.dart';

/*
This class represent all possible CRUD operation for Firestore.
It contains all generic implementation needed based on the provided document
path and documentID,since most of the time in Firestore design, we will have
documentID and path for any document and collections.
 */
class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Future<List<T>> collection<T>({
    required String path,
    required T builder(Map<String, dynamic> data, String documentID),
    Query queryBuilder(Query query)?,
    int sort(T lhs, T rhs)?,
  }) async {
    final query = FirebaseFirestore.instance.collection(path);
    // if (queryBuilder != null) {
    // query = queryBuilder(query);
    // }
    final QuerySnapshot<Map<String, dynamic>> snapshot = await query.get();
    final result = snapshot.docs
        .map((doc) {
          return builder(doc.data(), doc.id);
        })
        .where((value) => value != null)
        .toList();
    if (sort != null) {
      result.sort(sort);
    }
    return result;
  }

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    // print('$path: $data');
    await reference.set(data, SetOptions(merge: merge));
  }
}
