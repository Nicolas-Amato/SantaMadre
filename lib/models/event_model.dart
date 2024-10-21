// event_model.dart
class Event {
  final String id; // Agregamos un ID para identificar el evento
  final String description;
  final DateTime date;

  Event({required this.id, required this.description, required this.date});
}
