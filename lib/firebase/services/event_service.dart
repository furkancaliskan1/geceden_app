//Create Read Update Delete

import 'package:app_geceden/models/event.dart';
import 'package:app_geceden/models/highlight.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {
  final FirebaseFirestore _eventService = FirebaseFirestore.instance;

  DateTime parseCustomDate(String dateString) {
    List<String> parts = dateString.split('.');

    if (parts.length != 3) {
      throw FormatException('Geçersiz tarih formatı: $dateString');
    }

    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    return DateTime(year, month, day);
  }

  //get all events
  Future<List<Event>> getEvents() async {
    try {
      QuerySnapshot snapshot =
          await _eventService.collection('events').orderBy('date').get();
      return snapshot.docs
          .map((doc) =>
              Event.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      print('Error fetching events: $e');
      return [];
    }
  }

  // sort by date
  Future<List<Event>> getUpcomingEvents() async {
    List<Event> events =
        await getEvents(); 
    DateTime now = DateTime.now();

    events = events
        .where((event) => parseCustomDate(event.date)
            .isAfter(now)) 
        .toList();

    events.sort((a, b) {
      DateTime dateA = parseCustomDate(a.date);
      DateTime dateB = parseCustomDate(b.date);

      return dateA.difference(now).compareTo(dateB.difference(now));
    });

    return events;
  }

  // sort by tickets left
  Future<List<Event>> getAlmostSoldOutEvents() async {
    List<Event> events = await getEvents();
    events.sort((a, b) => a.ticketsLeft.compareTo(b.ticketsLeft));
    return events;
  }

  // sort by discount
  Future<List<Event>> getEventsWithDiscount() async {
    List<Event> events = await getEvents();
    events = events.where((event) => event.discount > 0.0).toList();

    events.sort((a, b) => b.discount.compareTo(a.discount));

    return events;
  }

  Future<List<Highlight>> getHighlights() async {
    try {
      QuerySnapshot snapshot =
          await _eventService.collection('highlights').get();
      return snapshot.docs.map((doc) => Highlight.fromDocument(doc)).toList();
    } catch (e) {
      print('Error fetching highlights: $e');
      return [];
    }
  }
}
