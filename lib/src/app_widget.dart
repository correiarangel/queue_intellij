import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_intellij/src/configuration/page/configuration_page.dart';
import 'package:queue_intellij/src/queue/configuration_module.dart';
import 'package:queue_intellij/src/queue/queue_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...queueModule,
        ...configurationModule,
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        home: const ConfigurationPage(),
      ),
    );
  }
}
