import 'package:flutter/material.dart';
import 'screens/tela_inicial.dart'; // Importa a tela inicial que criamos

void main() {
  runApp(const JogoInclusivoApp());
}

class JogoInclusivoApp extends StatelessWidget {
  const JogoInclusivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo Educativo Inclusivo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TelaInicial(), // Aponta para a tela do arquivo separado
    );
  }
}
