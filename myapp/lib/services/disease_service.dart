import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/interfaces/base_disease.dart';
import 'package:myapp/models/disease/disease.dart';

class DiseaseService implements BaseDisease {
  final Firestore _firestore = Firestore.instance;

  @override
  Future<List<Disease>> getDiseases() async {
    QuerySnapshot snapshot = await _firestore.collection('diseases').getDocuments();
    return snapshot.documents.map((doc) => Disease.fromJson(doc.data)).toList();
  }
}
