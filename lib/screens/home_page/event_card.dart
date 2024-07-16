import 'package:app_geceden/models/event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final List<Event> eventList;

  const EventCard({Key? key, required this.eventList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: eventList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  eventList[index].photoUrl,
                  width: 140,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
