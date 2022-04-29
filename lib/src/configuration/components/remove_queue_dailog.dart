import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/configuration_bloc.dart';
import '../model/queue_model.dart';
import '../event/configuration_event.dart';

class RemoveQueueDailog extends StatelessWidget {
  final QueueModel queueModel;
  const RemoveQueueDailog({
    Key? key,
    required this.queueModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Remover Fila'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[Text('Desejá remover a fila ${queueModel.title} ')],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'NÂO',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context
                    .read<ConfigurationBloc>()
                    .add(RemoveQueuesEvent(queueModel));
              },
              child: const Text(
                'SIM',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        )
      ],
    );
  }
}
