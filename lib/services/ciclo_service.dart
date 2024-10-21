// lib/services/ciclo_service.dart
/*import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ciclo.dart';

class CicloService {
  Future<void> guardarCiclo(Ciclo ciclo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cicloJson = jsonEncode(ciclo.toJson());
    List<String>? ciclosGuardados = prefs.getStringList('ciclos') ?? [];
    ciclosGuardados.add(cicloJson);
    await prefs.setStringList('ciclos', ciclosGuardados);
  }

  Future<List<Ciclo>> obtenerCiclos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? ciclosGuardados = prefs.getStringList('ciclos');
    if (ciclosGuardados != null) {
      return ciclosGuardados.map((ciclo) => Ciclo.fromJson(jsonDecode(ciclo))).toList();
    }
    return [];
  }
}*/
