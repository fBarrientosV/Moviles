import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Ventanas/inicio.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LimpiezaExpressApp());
}

class LimpiezaExpressApp extends StatelessWidget {
  const LimpiezaExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Limpieza Express',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 2, 222, 252),
        scaffoldBackgroundColor: const Color.fromARGB(255, 252, 250, 250),
      ),
      home: const Inicio(),
    );
  }
}
