import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PagoFinal extends StatelessWidget {
  final String nombre;
  final String apellido;
  final String fecha;
  final String hora;
  final String servicio;

  const PagoFinal({
    super.key,
    required this.nombre,
    required this.apellido,
    required this.fecha,
    required this.hora,
    required this.servicio,
  });

  Future<void> guardarEnFirebase() async {
    await FirebaseFirestore.instance.collection('servicios').add({
      'nombre': nombre,
      'apellido': apellido,
      'fecha': fecha,
      'hora': hora,
      'servicio': servicio,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de Pago'),
        backgroundColor: const Color.fromARGB(255, 3, 207, 243),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Resumen de tus datos:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Nombre: $nombre'),
            Text('Apellido: $apellido'),
            Text('Fecha: $fecha'),
            Text('Hora: $hora'),
            Text('Servicio: $servicio'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                await guardarEnFirebase();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Datos guardados con éxito en Firebase')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 3, 207, 243),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text('Realizar Pago'),
            ),
          ],
        ),
      ),
    );
  }
}
