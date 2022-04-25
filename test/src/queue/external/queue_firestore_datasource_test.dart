import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queue_intellij/src/queue/external/queue_firestore_datasource.dart';

void main() {
  late FirebaseFirestore firestore;
  late QueueFirestoreDatasource datasouce;

  setUpAll(() {
    debugPrint('Iniciando Suite testes QueueFirestoreDatasource');
  });
  setUp(() async {
    debugPrint('Iniciando testes ...');
    firestore = FakeFirebaseFirestore();
    datasouce = QueueFirestoreDatasource(firestore);
  });
  tearDown(() {
    debugPrint('Finalizando testes...');
  });

  tearDownAll(() {
    debugPrint('Finalizando Suite testes QueueFirestoreDatasource');
  });
  test(
    'Deve retornar List Map  getAllQueues...',
    () async {
      await firestore.collection('queue').add(dataMap);
      final result = datasouce.getAllQueues();
      expect(result, emits(isA<List<Map>>()));
    },
  );

  test(
    'Deve adicionar uma nova Queues   addQueue...',
    () async {
      await datasouce.addQueue(map);
      final ref = firestore.collection('queue');
      final queries = await ref.get();
      expect(queries.docs.length, 1);
    },
  );
  test(
    'Deve conter key id em Queues   addQueue...',
    () async {
      await datasouce.addQueue(map);
      final ref = firestore.collection('queue');
      final queries = await ref.get();
      expect(queries.docs.first.data().containsKey('id'), false);
    },
  );
}

final Map<String, dynamic> dataMap = {
  'id': '123rewer',
  'title': 'title',
  'abbreviation': 'ID',
  'priority': 1,
  'orders': [
    {
      'id': '123rewer',
      'position': 1,
      'status': 'attending',
      'timestamp': '2022-04-18 18:37:25',
    }
  ]
};

final Map<String, dynamic> map = {
  'id': '123rewer',
  'title': 'title',
  'abbreviation': 'ID',
  'priority': 1,
  'orders': []
};
