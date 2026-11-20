import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'ListScreen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.book, 'title': 'Books'},
      {'icon': Icons.people, 'title': 'Students'},
      {'icon': Icons.person, 'title': 'Teachers'},
      {'icon': Icons.library_books, 'title': 'Library'},
      {'icon': Icons.computer, 'title': 'Computer Lab'},
      {'icon': Icons.school, 'title': 'Campus'},
    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text('About Screen'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item['icon'] as IconData, size: 50, color: Colors.deepPurple),
                const SizedBox(height: 8),
                Text(item['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ListScreen()),
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
