import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_intellij/src/checkin/chenckin_module.dart';
import 'package:queue_intellij/src/configuration/page/configuration_page.dart';
import 'package:queue_intellij/src/queue/configuration_module.dart';
import 'package:queue_intellij/src/queue/queue_module.dart';

import 'home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...queueModule,
        ...configurationModule,
        ...checkinModule,
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
     routes: <String,Widget Function(BuildContext)>{
       '/':(_) =>  const HomePage(),
        '/configurations':(_) => const ConfigurationPage(),
     },
      ),
    );
  }
}
