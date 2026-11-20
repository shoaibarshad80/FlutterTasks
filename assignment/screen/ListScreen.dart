
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('List Screen'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        children: [

          Card(
            child: ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Flutter Development'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Dart Programming'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Artificial Intelligence'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.storage),
              title: const Text('Database Systems'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Software Engineering'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.wifi),
              title: const Text('Computer Networks'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.desktop_windows),
              title: const Text('Operating Systems'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.account_tree),
              title: const Text('Data Structures'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.phone_android),
              title: const Text('Mobile App Development'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Web Development'),
            ),
          ),

        ],
      ),
    );
  }
}
