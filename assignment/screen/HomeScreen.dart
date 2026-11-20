
import 'package:flutter/material.dart';
import 'ListScreen.dart';
import 'About.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      drawer: Drawer(
        child: ListView(
          children: [

            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Center(
                child: Text(
                  'Riphah University',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('List Screen'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListScreen(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Screen'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
            ),

          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.school,
              size: 80,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 20),

            const Text(
              'Welcome to Riphah University',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListScreen(),
                  ),
                );
              },
              child: const Text('List Screen'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
              child: const Text('About Screen'),
            ),

          ],
        ),
      ),
    );
  }
}
