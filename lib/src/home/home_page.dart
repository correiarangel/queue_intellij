import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        children: [
          const SizedBox(height: 32.0),
          ElevatedButton(
            child: const Text('Entrada'),
            onPressed: () {},
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            child: const Text('Salão'),
            onPressed: () {},
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            child: const Text('Guichê'),
            onPressed: () {},
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            child: const Text('Configurações'),
            onPressed: () {
              Navigator.pushNamed(context, '/configurations');
            },
          ),
        ],
      ),
    );
  }
}
