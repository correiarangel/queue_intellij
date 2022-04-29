

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/repositories/queue_repository_interface.dart';
import 'package:queue_intellij/src/queue/domain/usecases/remove_queue_usecase.dart';

import '../../../mocks/mocks.dart';

void main() {
  late IQueueRepository repository;
  final QueeuEntity queeuEntity = QueeuEntity(
    id: 'asasds',
    title: 'title',
    abbreviation: 'TT',
    priority: 0,
    orders: [],
  );
  setUpAll(() {
    debugPrint('Iniciando Suite testes RemoveQueue');
  });
  setUp(() {
    debugPrint('Iniciando testes ...');
    repository = IQueueRepositoryMock();
  });
  tearDown(() {
    debugPrint('Finalizando testes...');
  });

  tearDownAll(() {
    debugPrint('Finalizando Suite testes RemoveQueue');
  });

  test('Deve remover um queueEntity RemoveQueues... ', () async {
    when(() => repository.removeQueue(queeuEntity.id))
        .thenAnswer((_) async => Future.value());
    final usercase = RemoveQueuesUsecase(repository);

    expect(usercase.call(queeuEntity), completes);
  });
}
