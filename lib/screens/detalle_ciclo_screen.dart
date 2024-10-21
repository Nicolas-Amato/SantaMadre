// detalle_ciclo_screen.dart
// detalle_ciclo_screen.dart
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // Importar el paquete de calendario
import 'cultivo_screen.dart'; // Asegúrate de importar la clase Ciclo

class DetalleCicloScreen extends StatefulWidget {
  final Ciclo ciclo;

  const DetalleCicloScreen({super.key, required this.ciclo});

  @override
  _DetalleCicloScreenState createState() => _DetalleCicloScreenState();
}

class _DetalleCicloScreenState extends State<DetalleCicloScreen> {
  DateTime selectedDate = DateTime.now();
  Map<DateTime, List<String>> events = {}; // Almacena eventos por fecha
  final TextEditingController _eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ciclo.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selecciona una fecha:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: selectedDate,
              selectedDayPredicate: (day) => isSameDay(day, selectedDate),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  selectedDate = selectedDay;
                });
              },
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Eventos en ${selectedDate.toLocal()}'),
            Expanded(
              child: ListView(
                children: _getEventsForSelectedDate()
                    .map((event) => ListTile(
                          title: Text(event),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _deleteEvent(event);
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
            TextField(
              controller: _eventController,
              decoration: const InputDecoration(labelText: 'Agregar un evento'),
            ),
            ElevatedButton(
              onPressed: () {
                _addEvent();
              },
              child: const Text('Agregar Detalle de Cultivo'),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getEventsForSelectedDate() {
    return events[selectedDate] ?? []; // Retorna los eventos del día seleccionado
  }

  void _addEvent() {
    if (_eventController.text.isNotEmpty) {
      setState(() {
        if (events[selectedDate] != null) {
          events[selectedDate]!.add(_eventController.text);
        } else {
          events[selectedDate] = [_eventController.text];
        }
        _eventController.clear(); // Limpiar el campo de texto
      });
    }
  }

  void _deleteEvent(String event) {
    setState(() {
      events[selectedDate]?.remove(event);
      if (events[selectedDate]?.isEmpty ?? true) {
        events.remove(selectedDate); // Eliminar la fecha si no hay eventos
      }
    });
  }
}
