import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'About.dart';

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
              subtitle: const Text('Build multi-platform apps with Flutter'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Dart Programming'),
              subtitle: const Text('Core language for Flutter development'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Artificial Intelligence'),
              subtitle: const Text('Machine learning and neural networks'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.storage),
              title: const Text('Database Systems'),
              subtitle: const Text('SQL and NoSQL database management'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Software Engineering'),
              subtitle: const Text('Design patterns and development lifecycle'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.wifi),
              title: const Text('Computer Networks'),
              subtitle: const Text('Protocols, routing, and network security'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.desktop_windows),
              title: const Text('Operating Systems'),
              subtitle: const Text('Process management and memory allocation'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.account_tree),
              title: const Text('Data Structures'),
              subtitle: const Text('Trees, graphs, stacks, and queues'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.phone_android),
              title: const Text('Mobile App Development'),
              subtitle: const Text('Android and iOS app architecture'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.web),
              title: const Text('Web Development'),
              subtitle: const Text('HTML, CSS, JavaScript, and frontend frameworks'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.cloud),
              title: const Text('Cloud Computing'),
              subtitle: const Text('AWS, Azure, and cloud infrastructure'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Cyber Security'),
              subtitle: const Text('Encryption, threat analysis, and defense'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.smart_toy),
              title: const Text('Machine Learning'),
              subtitle: const Text('Supervised and unsupervised learning models'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.router),
              title: const Text('Internet of Things'),
              subtitle: const Text('Connected devices and embedded systems'),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.data_object),
              title: const Text('Object Oriented Programming'),
              subtitle: const Text('Classes, inheritance, and polymorphism'),
            ),
          ),

        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AboutScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}
