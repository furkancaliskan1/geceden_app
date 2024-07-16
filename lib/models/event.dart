class Event {
  final String id;
  final String title;
  final String date;
  final String location;
  final String organizer;
  final String artist;
  final String description;
  final String rules;
  final String photoUrl;
  final int price;
  final int ticketsLeft;
  final int discount;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.organizer,
    required this.artist,
    required this.description,
    required this.rules,
    required this.photoUrl,
    required this.price,
    required this.ticketsLeft,
    required this.discount,
  });

  double get discountedPrice => price * (1 - discount / 100);

  factory Event.fromMap(Map<String, dynamic> data, String documentId) {
    return Event(
      id: documentId,
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
      discount: data['discount'] ?? 0,
    );
  }
}