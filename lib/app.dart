import 'package:app_cep/page.dart';
import 'package:flutter/material.dart';

class AppCEPRefector extends StatelessWidget {
  const AppCEPRefector({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca por CEP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}