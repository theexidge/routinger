import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';

// Provider Imports
import '../provider/tasks.dart';

class Initialiser extends StatefulWidget {
  const Initialiser({Key? key}) : super(key: key);

  @override
  _InitialiserState createState() => _InitialiserState();
}

class _InitialiserState extends State<Initialiser> {
  @override
  void initState() {
    Provider.of<Tasks>(context, listen: false).fetchAndSetToDos();
    Provider.of<Tasks>(context, listen: false).fetchAndSetScheduled();
    Provider.of<Tasks>(context, listen: false).fetchAndSetRecurring();
    Provider.of<Tasks>(context, listen: false).fetchAndSetSleepCycle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0,
      width: 0,
    );
  }
}
