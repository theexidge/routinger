import 'package:flutter/material.dart';

// Third Party Packages
import 'package:card_swiper/card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// Screen Imports
import '../screens/add_task.dart';

// Provider Imports
import '../provider/tasks.dart';

// Widgets Imports
import '../widgets/carousel_card.dart';
import '../widgets/taskslist.dart';
import '../widgets/sleep_cycle_column.dart';
import '../widgets/initialiser.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> tips = [
    "When you start a new habit, it should take less than 2 minutes to carry it out.",
    "Reframe your habits to make them more appealing to your brain. Fool yourself.",
    "The most effective way to change your habits is to focus on who you wish to become.",
    "Tie your Habit to a sweet reward and make your habit more attractive",
    "Don't spend time in an environment where you have to practice self restraint.",
  ];

  // Handling the bottom navigation bar
  int _selectedIndexOfBottomNavBar = 0;

  void _navigatingBottomNavBar(int selectedIndex) {
    setState(() {
      _selectedIndexOfBottomNavBar = selectedIndex;
    });
  }

  Future<void> showSleepDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Your Sleep Cycle',
                style: TextStyle(
                  fontFamily: 'KleeOne',
                ),
              ),
            ),
            children: [
              SleepCycleColumn(),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Future<void> _launchURL() async {
      const url = 'https://www.buymeacoffee.com/agrkushal';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddTask.routeName);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Your Stats',
          ),
        ],
        currentIndex: _selectedIndexOfBottomNavBar,
        onTap: _navigatingBottomNavBar,
      ),
      appBar: AppBar(
        title: const Text(
          'Routinger',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            child: ElevatedButton.icon(
              onPressed: _launchURL,
              icon: Icon(Icons.coffee),
              label: Text('Buy me a Coffee'),
              style: ButtonStyle(),
            ),
          )
        ],
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Tasks(),
          ),
        ],
        child: SingleChildScrollView(
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
              _selectedIndexOfBottomNavBar == 1
                  ? Container() // TODO: Make a your stats widget
                  : Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Your Tasks',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showSleepDialog(context);
                                },
                                icon: Icon(Icons.alarm_add),
                              )
                            ],
                          ),
                        ),
                        ListOfTasks(),
                        Initialiser(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
