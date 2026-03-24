import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/lyrics_entity.dart';

abstract class SavedGenerationsDataSource {
  Future<void> saveGeneration({
    required String userId,
    required LyricsEntity lyrics,
    required String mood,
    required String language,
    String? enhancementType,
  });
  
  Stream<List<Map<String, dynamic>>> getGenerations(String userId);
}

class SavedGenerationsDataSourceImpl implements SavedGenerationsDataSource {
  final FirebaseFirestore _firestore;

  SavedGenerationsDataSourceImpl(this._firestore);

  @override
  Future<void> saveGeneration({
    required String userId,
    required LyricsEntity lyrics,
    required String mood,
    required String language,
    String? enhancementType,
  }) async {
    final Map<String, dynamic> data = {
      'verse1': lyrics.verse1,
      'chorus': lyrics.chorus,
      'verse2': lyrics.verse2,
      'score': lyrics.score,
      'mood': mood,
      'language': language,
      'createdAt': FieldValue.serverTimestamp(),
      if (enhancementType != null) 'enhancementType': enhancementType,
    };

    await _firestore
        .collection('users')
        .doc(userId)
        .collection('generations')
        .add(data);
  }

  @override
  Stream<List<Map<String, dynamic>>> getGenerations(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('generations')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = Map<String, dynamic>.from(doc.data());
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }
}
