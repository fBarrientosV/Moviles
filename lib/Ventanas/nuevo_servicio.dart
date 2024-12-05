import 'package:flutter/material.dart';
import 'package:flutter_application_2/Ventanas/geolocalizacion.dart';

class NuevoServicio extends StatefulWidget {
  const NuevoServicio({super.key});

  @override
  _NuevoServicioState createState() => _NuevoServicioState();
}

class _NuevoServicioState extends State<NuevoServicio> {
  String? servicioSeleccionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Limpieza Express'),
        backgroundColor: const Color.fromARGB(255, 3, 207, 243),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¡Bienvenido a Limpieza Express! Selecciona uno de nuestros servicios:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              children: [
                buildServiceCard(
                  context,
                  "Limpieza Hogar Completo",
                  "Ideal para pre o post mudanzas. Limpieza y Desinfección para baños, cocina, pisos, vidrios, muros, closets y espacios comunes de su hogar.",
                  Icons.home_outlined,
                ),
                buildServiceCard(
                  context,
                  "Sanitización y Desinfección",
                  "Entregaremos espacios 100% sanitizados y desinfectados aplicando nuestro sistema de vapor y amonio cuaternario.",
                  Icons.cleaning_services_outlined,
                ),
                buildServiceCard(
                  context,
                  "Limpieza de Pso",
                  "Para asegurar nuestra calidad, utilizamos la mejor maquinaria y los mejores productos para la limpieza y desinfección de alfombras.",
                  Icons.grid_on_outlined,
                ),
                buildServiceCard(
                  context,
                  "Limpieza de Colchones",
                  "Mantén tu colchón limpio y libre de ácaros con nuestros servicios profesionales de limpieza y desinfección.",
                  Icons.bed_outlined,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildServiceCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          servicioSeleccionado = title;
        });

        if (servicioSeleccionado != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Geolocalizacion(servicio: servicioSeleccionado!),
            ),
          );
        }
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.greenAccent.shade100,
                child: Icon(icon,
                    size: 30, color: const Color.fromARGB(255, 1, 94, 131)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
