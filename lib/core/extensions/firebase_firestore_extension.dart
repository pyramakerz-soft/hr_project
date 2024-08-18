import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreExtension on FirebaseFirestore {
  Future<bool> checkoobExists(String oob) async {
    final oobCodes = FirebaseFirestore.instance.collection('oobCodes');
    final querySnapshot = await oobCodes.where('oobCode', isEqualTo: oob).get();

    return querySnapshot.docs.isNotEmpty;
  }
}
