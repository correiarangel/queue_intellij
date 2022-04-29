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

  test(
    'Deve remover a propriedade orders de todas os documentos...',
    () async {
      await firestore.collection('queue').add(map);
      await firestore.collection('queue').add(map2);
      await datasouce.removeAllOrders();

      final ref = firestore.collection('queue');
      final queries = await ref.get();

      expect(queries.docs.first.data().containsKey('orders'), false);
      expect(queries.docs.last.data().containsKey('orders'), false);
      expect(queries.docs.first['title'], 'title');
      expect(queries.docs.last['title'], 'title 2');
    },
  );

  test(
    'Deve atulisar  propriedade orders de queueEnpitity...',
    () async {
     
      await datasouce.addQueue(map);
      await datasouce.addQueue(map2);
      await datasouce.updateQueue(mapUpdate);

      final ref = firestore.collection('queue');
      final queries = await ref.doc('123rewer2').get();

      expect((queries.data()?['orders'] as List ).length,1 );
      expect(queries.data()?['title'], 'title 2');
      expect(queries.data()?['priority'],2);
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

final Map<String, dynamic> map2 = {
  'id': '123rewer2',
  'title': 'title 2',
  'abbreviation': 'TT',
  'priority': 2,
  'orders': []
};

final Map<String, dynamic> mapUpdate = {
  'id': '123rewer2',
  'title': 'title 2',
  'abbreviation': 'TT',
  'priority': 2,
  'orders': [
    {
      'id': '0001',
      'position': 1,
      'status': 'attending',
      'timestamp': '2022-04-29 15:55:25',
    }
  ]
};
