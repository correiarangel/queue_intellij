import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_intellij/src/queue/domain/repositories/queue_repository_interface.dart';
import 'package:queue_intellij/src/queue/domain/usecases/add_new_queue_usecase.dart';

import '../../../mocks/mocks.dart';

void main() {
  late IQueueRepository repository;
  late QueueEntityMock enptity;
  setUpAll(() {
    debugPrint('Iniciando Suite testes AddNewQueue');
  });
  setUp(() {
    debugPrint('Iniciando testes ...');
    repository = IQueueRepositoryMock();
    enptity = QueueEntityMock();
  });
  tearDown(() {
    debugPrint('Finalizando testes...');
  });

  tearDownAll(() {
    debugPrint('Finalizando Suite testes AddNewQueue');
  });
  test('Deve adciona ua nova queueEntity addQueue... ', () async {
    when(() => repository.addQueue(enptity))
        // ignore: void_checks
        .thenAnswer((invocation) => Future.value(enptity));
    final usercase = AddNewQueueUsecase(repository);

    expect(usercase.call(enptity), completes);
  });
}
