import 'package:app_geceden/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Highlight extends Event {
  
  Highlight({
    required super.id,
    required super.title,
    required super.date,
    required super.location,
    required super.organizer,
    required super.artist,
    required super.description,
    required super.rules,
    required super.photoUrl,
    required super.price,
    required super.ticketsLeft,
    required super.discount
  });

  factory Highlight.fromDocument(DocumentSnapshot data) {
    return Highlight(
      id: data.id,
      title: data['title'] ?? '', 
      date: data['date'] ?? '', 
      location: data['location'] ?? '', 
      organizer: data['organizer'] ?? '', 
      artist: data['artist'] ?? '', 
      description: data['description'] ?? '', 
      rules: data['rules'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      price: data['price'] ?? 0,
      ticketsLeft: data['ticketsLeft'] ?? 0,
      discount: data['discount'] ?? 0
    );
  }
}
