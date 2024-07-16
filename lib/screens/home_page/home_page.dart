import 'package:app_geceden/assets/colors.dart';
import 'package:app_geceden/assets/text_styles.dart';
import 'package:app_geceden/firebase/services/event_service.dart';
import 'package:app_geceden/models/event.dart';
import 'package:app_geceden/models/highlight.dart';
import 'package:app_geceden/screens/home_page/event_card.dart';
import 'package:app_geceden/screens/home_page/highlight_slider.dart';
import 'package:app_geceden/widgets/navigation_bars/appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final EventService _eventService = EventService();

  List<Event> upcomingEvents = [];
  List<Event> almostSoldOutEvents = [];
  List<Event> opportunitiesOfEvents = [];
  List<Highlight> highlights = [];

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {

    List<Event> almostSold = await _eventService.getAlmostSoldOutEvents();
    List<Event> coming = await _eventService.getUpcomingEvents();
    List<Event> opportunities = await _eventService.getEventsWithDiscount();
    List<Highlight> slider = await _eventService.getHighlights();

    setState(() {
      almostSoldOutEvents = almostSold;
      upcomingEvents = coming;
      opportunitiesOfEvents = opportunities;
      highlights = slider;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: CustomAppBar(
        onBucketPressed: () {}, 
        onLocationPressed: () {}, 
        onNotificationPressed: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
            
                // slayt tablosu -- manuel olarak ayarla
                HighlightSlider(highlights: highlights),
                const SizedBox(height: 30),
                // tükenmek üzere -- bilet sayısına göre sırala
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Tükenmek Üzere',
                        style: AppTextStyles.inputText,
                      ),
                    ],
                  ),
                ),
                EventCard(eventList: almostSoldOutEvents),
                // yakın zamanda -- tarihe göre sırala
            
            
            
                // fırsatlar -- fiyata göre sırala
            
              ],
            ),
          ),
        )
      ),
    );
  }
}