import 'package:flutter/material.dart';
import 'package:flutter_application_2/Ventanas/nuevo_cliente.dart';

class Geolocalizacion extends StatelessWidget {
  final String servicio;

  const Geolocalizacion({
    super.key,
    required this.servicio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocalización'),
        backgroundColor: const Color.fromARGB(255, 3, 207, 243),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¿Dónde te encuentras? Nuestros Cleanners te ayudarán.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/geolocalizacion.png',
              width: 200,
              height: 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Formulario(servicio: servicio),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 3, 207, 243),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Siguiente: Resumen de Pago'),
            ),
          ],
        ),
      ),
    );
  }
}
