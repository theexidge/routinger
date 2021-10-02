//Flutter libraries
import 'package:flutter/material.dart';

//Provider Package
import 'package:provider/provider.dart';

//Provider Imports
import '../../provider/experience_points.dart';

class YourStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10.0,
        child: Consumer<ExperiencePoints>(
          builder: (_, expPoint, __) => Column(
            children: [
              Container(
                child: Text(
                  expPoint.getPostName(),
                  style: TextStyle(
                    fontFamily: 'KleeOne',
                    fontSize: 20,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
              ),
              Container(
                child: Text(
                  expPoint.getProgress(),
                  style: TextStyle(
                    fontFamily: 'KleeOne',
                  ),
                  textAlign: TextAlign.end,
                ),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
              ),
              Container(
                child: LinearProgressIndicator(
                  value: expPoint.getProgressFraction(),
                  minHeight: 5,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                expPoint.catchyPhrases[expPoint.hiredIndex][0],
                style: TextStyle(
                  fontFamily: 'KleeOne',
                ),
              ),
              Text(
                expPoint.catchyPhrases[expPoint.hiredIndex][1],
                style: TextStyle(
                  fontFamily: 'KleeOne',
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
