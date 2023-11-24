import 'package:flutter/material.dart';
import '../../src/screens/main_container_screen.dart'; // Asegúrate de que la ruta de importación sea correcta

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Préstamos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainContainerScreen(), // Usa HomeScreen como la pantalla inicial
    );
  }
}
