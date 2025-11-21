//Flutter libraries
import 'package:flutter/material.dart';

//Provider Package
import 'package:provider/provider.dart';

// Constant Imports
import '../../../constants/layout.dart';

//Provider Imports
import '../../../provider/experience_points.dart';

class YourStats extends StatelessWidget {
  const YourStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        elevation: 10.0,
        child: Consumer<ExperiencePoints>(
          builder: (_, expPoint, __) => Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  expPoint.getPostName(),
                  style: TextStyle(
                    fontFamily: 'KleeOne',
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Text(
                  expPoint.getProgress(),
                  style: TextStyle(
                    fontFamily: 'KleeOne',
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: LinearProgressIndicator(
                  value: expPoint.getProgressFraction(),
                  minHeight: 5,
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
