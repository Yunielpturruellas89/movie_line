import 'package:flutter/material.dart';
import 'package:movie_line/src/class/hymn.dart';
import 'package:movie_line/src/class/verse.dart';
import 'package:movie_line/src/components/Hymn/item_hymn.dart';
import 'package:movie_line/src/screens/home/home_page.dart';
import 'package:movie_line/src/screens/hymn/hymn_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 0, 221, 250),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      home: const MyHomePage(), // Use MyHomePage as the home widget
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Example hymn data
  List<Hymn> hymns = [
    // Agrega aquí los himnos de tu aplicación
    Hymn(
        id: 1,
        name: 'Alabanza Cubana',
        number: 1,
        author: 'Autor 1',
        year: 1900,
        favorite: false,
        verses: [
          Verse(
            type: 'Verse',
            text: [
              'Al despertar la mañana cálida y primaveral,',
              'Escucho del sinsonte su canto matinal.',
              'El susurro de un arroyo a la sombra del palmar',
              'Me dice que mi Cuba eleva su cantar.'
            ],
          ),
          Verse(type: 'Chorus', text: [
            'Toda obra de tus manos, entona una alabanza',
            'Porque en tu providencia conserva su esperanza.',
            ' Y yo quiero, con mi canta, unirme a la armonía',
            'Que llega a tu presencia con bella cubanía'
          ]),
          Verse(type: 'Verse', text: [
            'Tú creaste toda vida, tú preservas todo ser;',
            'Sublime maravilla mis ojos pueden ver. ',
            'Alimentas a las aves, das la lluvia y el calor,',
            'Inspiras con tu luna, alumbras con tu sol.'
          ]),
        ],
        biblicalQuote:
            'Los cielos cuentan la gloria de Dios, y el firmamento anuncia la obra de sus manos. Sal 19:1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Cantos'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Himnario'),
              accountEmail: Text('Alabanzas Cubanas'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Replace with actual image
              ),
            ),
            ListTile(
              title: const Text('Cantos'),
              onTap: () {
                // Navigate to the home screen
                Navigator.pushReplacementNamed(context, '/');
                _scaffoldKey.currentState?.closeDrawer();
              },
            ),
            // Add more drawer items here
          ],
        ),
      ),
      body: HimnosScreen(
        hymns: hymns,
      ),
    );
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(this).colorScheme.error
            : Theme.of(this).snackBarTheme.backgroundColor,
      ),
    );
  }
}
