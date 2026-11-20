
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('About Screen'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: GridView.count(
        crossAxisCount: 2,

        children: [

          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.book, size: 50),
                Text('Books'),
              ],
            ),
          ),

          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.people, size: 50),
                Text('Students'),
              ],
            ),
          ),

          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.person, size: 50),
                Text('Teachers'),
              ],
            ),
          ),

          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.library_books, size: 50),
                Text('Library'),
              ],
            ),
          ),

          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.computer, size: 50),
                Text('Computer Lab'),
              ],
            ),
          ),

          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.school, size: 50),
                Text('Campus'),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
