import 'package:flutter/material.dart';
import 'package:flutter_application_2/Ventanas/PagoFinal.dart';

class Formulario extends StatefulWidget {
  final String servicio;

  const Formulario({super.key, required this.servicio});

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _fechaController = TextEditingController();
  final _horaController = TextEditingController();

  void _goToPagoFinal() {
    if (_nombreController.text.isNotEmpty &&
        _apellidoController.text.isNotEmpty &&
        _fechaController.text.isNotEmpty &&
        _horaController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PagoFinal(
            nombre: _nombreController.text,
            apellido: _apellidoController.text,
            fecha: _fechaController.text,
            hora: _horaController.text,
            servicio: widget.servicio,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor llena todos los campos')),
      );
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _fechaController.dispose();
    _horaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Cliente'),
        backgroundColor: const Color.fromARGB(255, 3, 207, 243),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nombre del cliente:'),
            TextField(controller: _nombreController),
            const SizedBox(height: 10),
            const Text('Apellido del cliente:'),
            TextField(controller: _apellidoController),
            const SizedBox(height: 10),
            const Text('Fecha del servicio:'),
            TextField(controller: _fechaController),
            const SizedBox(height: 10),
            const Text('Hora del servicio:'),
            TextField(controller: _horaController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _goToPagoFinal,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 3, 207, 243),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text('Siguiente: Resumen de Pago'),
            ),
          ],
        ),
      ),
    );
  }
}
