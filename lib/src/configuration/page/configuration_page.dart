import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue_intellij/src/configuration/components/add_dailog.dart';
import 'package:queue_intellij/src/configuration/components/remove_all_orders_dailog.dart';
import 'package:queue_intellij/src/configuration/components/remove_queue_dailog.dart';
import 'package:queue_intellij/src/configuration/model/queue_model.dart';
import 'package:queue_intellij/src/configuration/event/configuration_event.dart';
import '../blocs/configuration_bloc.dart';
import '../state/configuration_state.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<ConfigurationBloc>().add(FetchQueuesEvent());
    });
    super.initState();
  }

  void _addNewQueeuDialog() {
    showDialog(
      context: context,
      builder: (context) => const AddDailog(),
    );
  }

  void _removeQueeuDialog(QueueModel queueModel) {
    showDialog(
      context: context,
      builder: (context) => RemoveQueueDailog(queueModel: queueModel),
    );
  }

  void _removeAllOrdersDialog() {
    showDialog(
      context: context,
      builder: (context) => const RemoveAllOrdersDailog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ConfigurationBloc>();

    var state = bloc.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const SizedBox(
                width: 16.0,
              ),
              const Text(
                'FILAS',
                style: TextStyle(fontSize: 16.0),
              ),
              const Spacer(),
              IconButton(
                onPressed: _addNewQueeuDialog,
                icon: Icon(
                  Icons.add,
                  color: Colors.green.shade600,
                  size: 32.0,
                ),
              ),
              const SizedBox(width: 16.0),
            ],
          ),
          if (state is LoadingConfigurationState)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (state is LoadedConfigurationState)
            ListView.builder(
              shrinkWrap: true,
              itemCount: state.queues.length,
              itemBuilder: (context, index) {
                final queue = state.queues[index];
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  child: ListTile(
                    title: Text('${queue.title} - ${queue.abbreviation}'),
                    subtitle: Text('${queue.priority} de prioridade'),
                    trailing: IconButton(
                      onPressed: () {
                        QueueModel _queueModel = QueueModel(
                          id: queue.id,
                          title: queue.title,
                          abbreviation: queue.abbreviation,
                          priority: queue.priority,
                          orders: queue.orders,
                        );
                        _removeQueeuDialog(_queueModel);
                      },
                      icon: Icon(
                        Icons.remove,
                        color: Colors.red.shade600,
                      ),
                    ),
                  ),
                );
              },
            ),
          if (state is ExceptionConfigurationState)
            Center(
              child: TextButton.icon(
                icon: const Icon(Icons.restart_alt),
                onPressed: () {
                  context.read<ConfigurationBloc>().add(FetchQueuesEvent());
                },
                label: const Text('Ops! clique para  tentar recarregar :('),
              ),
            ),
          const Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Text(
              'CONTROLE',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
            ),
            onPressed: () => _removeAllOrdersDialog() ,
            child: const Text(
              'REINICIAR FILA',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
