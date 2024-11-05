import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CakeClock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 218, 67, 124)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Wear OS Clock App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _formattedTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('HH:mm:ss');
    setState(() {
      _formattedTime = formatter.format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen de pastel
            Image.network(
              'https://th.bing.com/th/id/R.f75acc02108ae48f5d83cb0937396756?rik=h2U2ft6aLlgP%2bQ&riu=http%3a%2f%2fbeststandupmixersforbaking.com%2fwp-content%2fuploads%2f2020%2f08%2fSpecial-Birthday-Cakes-1.jpg&ehk=UmV%2fN%2fPhoBDrjOhH3NGNKmUWq%2fkTFjebr1Q0%2fes0rzU%3d&risl=&pid=ImgRaw&r=0', // Reemplaza con la URL de tu imagen de pastel
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 16),
            // Hora actual
            Text(
              _formattedTime,
              style: const TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 255, 0, 76),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}