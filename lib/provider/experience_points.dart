import 'package:flutter/cupertino.dart';

class ExperiencePoints with ChangeNotifier {
  static List<String> posts = const [
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

  static bool hired = false;

  static int hiredIndex = 0;
  static int currentPoints = 0;

  static List<int> points = [
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
