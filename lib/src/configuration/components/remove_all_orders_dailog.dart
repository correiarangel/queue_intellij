import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/configuration_bloc.dart';
import '../event/configuration_event.dart';

class RemoveAllOrdersDailog extends StatelessWidget {
  
  const RemoveAllOrdersDailog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Reiniciar Filas'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text(
              'Desejá deletar as filas,'
              ' e reiniciar o processamento de  filas ?',
            ),
          ],
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
                context.read<ConfigurationBloc>().add(RemoveAllOrderEvent());
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
