import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Widget Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  IconData _iconData = Icons.home;
  String _displayedText = 'Page d\'accueil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget Example'),
      ),
      body: Center(
        child: Text(
          _displayedText,
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        child: Icon(_iconData),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Mettre à jour le texte affiché en fonction de l'index sélectionné
      switch (index) {
        case 0:
          _displayedText = 'Page d\'accueil';
          break;
        case 1:
          _displayedText = 'Page de recherche';
          break;
        case 2:
          _displayedText = 'Page de profil';
          break;
      }
    });
  }

  void _onFloatingActionButtonPressed() {
    setState(() {
      // Mettre à jour l'icône en fonction de l'action du bouton flottant
      switch (_selectedIndex) {
        case 0:
          _iconData = Icons.home;
          break;
        case 1:
          _iconData = Icons.search;
          break;
        case 2:
          _iconData = Icons.person;
          break;
      }
    });
  }
}
