// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Nombre de Usuario'),
              accountEmail: Text('usuario@ejemplo.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'), // Imagen del avatar
              ),
            ),
            ListTile(
              leading: const Icon(Icons.nature),
              title: const Text('Ciclo'),
              onTap: () {
                Navigator.pushNamed(context, '/cultivo');
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Historial'),
              onTap: () {
                // Navegar a la pantalla de historial (no está implementada aquí)
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Preferencias'),
              onTap: () {
                // Navegar a la pantalla de preferencias (no está implementada aquí)
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Bienvenido a la App de Control de Cultivos'),
      ),
    );
  }
}

