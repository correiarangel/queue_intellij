import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/configuration_bloc.dart';
import '../model/queue_model.dart';
import '../state/configuration_event.dart';

class AddDailog extends StatelessWidget {
  const AddDailog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QueueModel _queueModel = QueueModel.emppty();
    return AlertDialog(
      title: const Text('Criar Fila'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              autofocus: true,
              onChanged: (value) {
                _queueModel = _queueModel.copyWith(title: value);
              },
              decoration: const InputDecoration(
                labelText: 'Titulo:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                _queueModel = _queueModel.copyWith(abbreviation: value);
              },
              decoration: const InputDecoration(
                  labelText: 'Abreviação:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  )),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                _queueModel = _queueModel.copyWith(
                  priority: int.tryParse(value) ?? 0,
                );
              },
              decoration: const InputDecoration(
                  labelText: 'Prioridade:',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  )),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.cancel,
                color: Colors.red.shade600,
              ),
              label: const Text(
                'CANCELAR',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton.icon(
              icon: Icon(
                Icons.confirmation_num,
                color: Colors.green.shade600,
              ),
              onPressed: () {
                Navigator.pop(context);
                context
                    .read<ConfigurationBloc>()
                    .add(AddNewQueuesEvent(_queueModel));
              },
              label: const Text(
                'ADICIONAR',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        )
      ],
    );
  }
}
