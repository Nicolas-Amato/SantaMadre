// lib/screens/cultivo_screen.dart
import 'package:flutter/material.dart';

class CultivoScreen extends StatefulWidget {
  const CultivoScreen({super.key});

  @override
  _CultivoScreenState createState() => _CultivoScreenState();
}

class _CultivoScreenState extends State<CultivoScreen> {
  List<Ciclo> ciclos = [];

  void _iniciarCiclo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String nombreCiclo = '';
        return AlertDialog(
          title: const Text('Nuevo Ciclo de Cultivo'),
          content: TextField(
            decoration: const InputDecoration(labelText: 'Nombre del cultivo'),
            onChanged: (value) {
              nombreCiclo = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Crear'),
              onPressed: () {
                if (nombreCiclo.isNotEmpty) {
                  setState(() {
                    ciclos.add(Ciclo(nombre: nombreCiclo));
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ciclo de Cultivo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6, // Dos columnas en el Grid
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: ciclos.length + 1,
          itemBuilder: (context, index) {
            if (index < ciclos.length) {
              final ciclo = ciclos[index];
              return Card(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.calendar_today, size: 50),
                      Text(ciclo.nombre),
                    ],
                  ),
                ),
              );
            } else {
              // Botón "Más" para agregar un nuevo ciclo
              return GestureDetector(
                onTap: _iniciarCiclo,
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Icon(Icons.add, size: 50, color: Colors.grey.withOpacity(0.6)),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class Ciclo {
  String nombre;

  Ciclo({required this.nombre});
}
