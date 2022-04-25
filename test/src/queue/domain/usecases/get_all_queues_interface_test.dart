import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/repositories/queue_repository_interface.dart';

import 'package:queue_intellij/src/queue/domain/usecases/get_all_queues.dart';

import '../../../mocks/mocks.dart';

void main() {
  late IQueueRepository repository;
  late QueeuEntity entity;
  setUpAll(() {
    debugPrint('Iniciando Suite testes QueueRepository');
  });
  setUp(() {
    debugPrint('Iniciando testes ...');
    repository = QueueRepositoryMock();
    entity = QueueEntityMock();
  });
  tearDown(() {
    debugPrint('Finalizando testes...');
  });

  tearDownAll(() {
    debugPrint('Finalizando Suite testes QueueRepository');
  });
  test('Deve retornar uma lista de QueueEntity ...', () async {
    when(() => repository.getAllQueues()).thenAnswer(
      (_) => Stream.value([entity]),
    );
    final usecase = GetAllQueues(repository);
    final result = usecase.call();

    expect(result, emits(isA<List<QueeuEntity>>()));
  });
}
