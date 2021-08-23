import 'package:flutter/material.dart';

// Third Party Packages
import 'package:card_swiper/card_swiper.dart';

// Widgets Imports
import '../widgets/carousel_card.dart';
import '../widgets/list_of_tasks.dart';

class HomeScreen extends StatelessWidget {
  final List<String> tips = [
    "When you start a new habit, it should take less than 2 minutes to carry it out.",
    "Reframe your habits to make them more appealing to your brain. Fool yourself.",
    "The most effective way to change your habits is to focus on who you wish to become.",
    "Tie your Habit to a sweet reward and make your habit more attractive",
    "Don't spend time in an environment where you have to practice self restraint.",
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Routinger',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: mediaQuery.size.height / 3.5,
              margin: EdgeInsets.all(10),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return CarouselCard(
                    tips[index],
                    "${index + 1}",
                    mediaQuery.size.height / 3.5,
                  );
                },
                itemCount: 5,
                itemWidth: 300.0,
                layout: SwiperLayout.STACK,
                autoplay: true,
              ),
            ),
            Container(
              child: Text(
                'Your Tasks',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListOfTasks(),
          ],
        ),
      ),
    );
  }
}
