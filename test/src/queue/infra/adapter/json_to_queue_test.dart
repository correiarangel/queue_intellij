import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queue_intellij/src/queue/domain/entities/queue_entities.dart';
import 'package:queue_intellij/src/queue/domain/value_objects/order.dart';

import 'package:queue_intellij/src/queue/infra/adapter/json_to_queue.dart';

void main() {


  final queue = QueeuEntity(
    abbreviation: 'ID',
    id: 'a1a2a3sa4a5',
    orders: [],
    priority: 1,
    title: 'Idoso',
  );
  setUpAll(() {
    debugPrint('Iniciando Suite testes JsonToQueue');
  });
  setUp(() {
    debugPrint('Iniciando testes ...');
  });
  tearDown(() {
    debugPrint('Finalizando testes...');
  });

  tearDownAll(() {
    debugPrint('Finalizando Suite testes JsonToQueue');
  });
  test('Deve converter um Map em um objeto QueeuEntity ...', () async {
    final queue = JsonToQueue.fronMap({
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
    });
    expect(queue, isA<QueeuEntity>());
  });

  test(
      'Deve converter um Map em um objeto '
      'QueeuEntity contendo priority = 1 ...', () async {
    final queue = JsonToQueue.fronMap({
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
    });

    expect(queue.priority, 1);
  });

  test(
      'Deve converter um Map em um objeto '
      'QueeuEntity contendo List Order...', () async {
    final queue = JsonToQueue.fronMap({
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
    });

    expect(queue.orders, isA<List<Order>>());
  });

  test('Deve converter um QueeuEntity em Map', () {
    final map = JsonToQueue.toMap(queue);
    expect(map, isA<Map<String, dynamic>>());
  });

  test('O Map convertido deve conter id igual a1a2a3sa4a5', () {
    final map = JsonToQueue.toMap(queue);
    expect(map['id'], 'a1a2a3sa4a5');
  });
}
