import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/infra/datasource/queeu_datasource_interface.dart';
import 'package:queue_intellij/src/queue/infra/repositories/queue_repository.dart';

import '../../../mocks/mocks.dart';

void main() {
  final queueEntity = QueeuEntity(
    abbreviation: 'ID',
    id: 'a1a2a3sa4a5',
    orders: [],
    priority: 1,
    title: 'Idoso',
  );
  late IQueueDatasource datasource;
  setUpAll(() {
    debugPrint('Iniciando Suite testes QueueRepository');
  });
  setUp(() {
    debugPrint('Iniciando testes ...');
    datasource = IQueueDatasourceMock();
  });
  tearDown(() {
    debugPrint('Finalizando testes...');
  });

  tearDownAll(() {
    debugPrint('Finalizando Suite testes QueueRepository');
  });
  test('Deve retornar List de QueeuEntity getAllQueues ...', () async {
    when(() => datasource.getAllQueues()).thenAnswer(
      (_) => Stream.value(
        [
          {
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
          }
        ],
      ),
    );

    final respository = QueueRepository(datasource);
    final result = respository.getAllQueues();

    expect(result, emits(isA<List<QueeuEntity>>()));
  });

  test('Deve adicionar QueueEntity addQueue ...', () async {
    when(() => datasource.addQueue(any())).thenAnswer(
      (_) => Future.value(),
    );

    final respository = QueueRepository(datasource);

    expect(respository.addQueue(queueEntity), completes);
  });
}
