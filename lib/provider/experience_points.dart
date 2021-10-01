import 'package:flutter/cupertino.dart';

//Third Party Import
import 'package:routinger/constants/enums.dart';

class ExperiencePoints with ChangeNotifier {
  List<String> posts = const [
    'Intern',
    'Team Member',
    'Team Lead',
    'Manager',
    'Administrator',
    'Vice-President',
    'President',
    'CEO',
    'Director',
  ];

  bool hired = false;

  int hiredIndex = 0;
  int currentPoints = 0;

  int _easyTaskPoints = 2;
  int _doableTaskPoints = 5;
  int _hardTaskPoints = 7;

  List<List<String>> catchyPhrases = [
    [
      'You were hired as a programming intern, but you',
      'are serving coffee now,',
    ],
    [
      'You were settled down with the fact that you will',
      'be serving coffee only. But voila a promotion.',
    ],
    [
      'You putting in hours of effort and skipping parties',
      'is making your friends jealous now.',
    ],
    [
      'Finally I am beginning to think that MBA fees',
      'didn\'t go down the drain.',
    ],
    [
      'My irritating boss called me and said I am gonna be',
      'be your boss again. But atleast you got promoted',
    ],
    [
      'Is it worth the effort spending time in this company? You have ',
      'got promoted. Yes, I am happy to spend my entire life here',
    ],
    [
      'I shouldn\'t say this but I was happy going to someone\'s',
      'funeral. Whose? Our President. I have got his job now.',
    ],
    [
      'Finally my performance will drive up the share market',
      'I am the King',
    ],
    [
      'I was able to save up enough money to buy more shares of our company',
      'I got it pretty cheap 1\$/1%. But atleast I am the director.',
    ]
  ];

  List<int> points = [
    5,
    8,
    10,
    15,
    20,
    30,
    40,
    50,
    75,
  ];

  String getProgress() {
    return '$currentPoints/${points[hiredIndex]}';
  }

  double getProgressFraction() {
    return currentPoints / points[hiredIndex];
  }

  String getPostName() {
    return posts[hiredIndex];
  }

  void findNewCompany() {
    hired = true;
    currentPoints = 0;
    notifyListeners();
  }

  void fireEmployee() {
    hired = false;
    currentPoints = 0;
    hiredIndex = 0;
    notifyListeners();
  }

  void addPoints(int pointsToBeAdded) {
    currentPoints += pointsToBeAdded;
    while (currentPoints >= points[hiredIndex]) {
      currentPoints -= points[hiredIndex];
      hiredIndex += 1;
    }
    notifyListeners();
  }

  void addPointsWithDifficulty(Difficulty difficultyOfTheTask) {
    if (difficultyOfTheTask == Difficulty.Doable) {
      currentPoints += _doableTaskPoints;
    } else if (difficultyOfTheTask == Difficulty.Hard) {
      currentPoints += _hardTaskPoints;
    } else {
      currentPoints += _easyTaskPoints;
    }
    while (currentPoints >= points[hiredIndex]) {
      currentPoints -= points[hiredIndex];
      hiredIndex += 1;
    }
    notifyListeners();
  }

  void subtractPoints(int pointsToBeSubtracted) {
    currentPoints -= pointsToBeSubtracted;
    while (currentPoints < 0) {
      hiredIndex -= 1;
      if (hiredIndex < 0) {
        fireEmployee();
        return;
      }
      currentPoints =
          points[hiredIndex] + currentPoints; // currentPoints is negative
    }
  }
}
