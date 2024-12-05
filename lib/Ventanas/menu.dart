import 'package:flutter/material.dart';
import 'nuevo_servicio.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
        backgroundColor: const Color.fromARGB(255, 3, 207, 243),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://i.pinimg.com/1200x/a8/21/1d/a8211d250a3469734c09f3ca887b40e0.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/1495088043/es/vector/icono-de-perfil-de-usuario-avatar-o-icono-de-persona-foto-de-perfil-s%C3%ADmbolo-de-retrato.jpg?s=612x612&w=0&k=20&c=mY3gnj2lU7khgLhV6dQBNqomEGj3ayWH-xtpYuCXrzk=',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Reseñas:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildReviewCard(
                      '7.0', 'Excelente servicio, muy rápido y confiable.'),
                  _buildReviewCard('4.0', 'Buen servicio, pero algo costoso.'),
                  _buildReviewCard(
                      '5.0', 'Increíble, me resolvieron todo en el mismo día.'),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NuevoServicio(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 3, 207, 243),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildReviewCard(String rating, String review) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text('$rating: $review'),
            ),
          ],
        ),
      ),
    );
  }
}
