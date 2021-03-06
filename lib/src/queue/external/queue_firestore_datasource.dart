import 'package:cloud_firestore/cloud_firestore.dart';
import '../infra/datasource/queeu_datasource_interface.dart';

class QueueFirestoreDatasource implements IQueueDatasource {
  final FirebaseFirestore firestore;

  QueueFirestoreDatasource(this.firestore);
  @override
  Stream<List<Map>> getAllQueues() {
    final ref = firestore.collection('queue');
    final snapshot = ref.orderBy('priority', descending: false).snapshots();
    return snapshot.map((e) => e.docs).map(_convert);
  }

  List<Map> _convert(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return docs.map((document) {
      return {
        'id': document.id,
        ...document.data(),
      };
    }).toList();
  }

  @override
  Future<void> addQueue(Map<String, dynamic> queueMap) async {
    final ref = firestore.collection('queue');
    queueMap.remove('id');
    ref.add(queueMap);
  }

  @override
  Future<void> removeQueue(String id) async {
    final ref = firestore.collection('queue');
    ref.doc(id).delete();
  }

  @override
  Future<void> removeAllOrders() async {
    final ref = firestore.collection('queue');
    final snapshot = await ref.get();
    for (var doc in snapshot.docs) {
      final map = doc.data();
      map.remove('orders');
      await doc.reference.set(map);
    }
  }

  @override
  Future<void> updateQueue(Map<String, dynamic> queueMap) async {
    final ref = firestore.collection('queue');
    final doc = ref.doc(queueMap['id']);
    doc.set(queueMap);
  }
}
