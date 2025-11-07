import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class AddExerciseCard extends StatefulWidget {
  final String exerciseTitle;
  final String imageUrl;
  final int noOFMinuites;
  const AddExerciseCard({
    super.key,
    required this.exerciseTitle,
    required this.imageUrl,
    required this.noOFMinuites,
  });

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 200,
      height: 275,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // ignore: deprecated_member_use
        color: kSubTitleColor.withOpacity(0.5),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 2),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              widget.exerciseTitle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),
            Image.asset(widget.imageUrl, width: 100, fit: BoxFit.cover),

            SizedBox(height: 10),
            Text(
              "${widget.noOFMinuites.toString()} minutes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kSubTitleColor,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: kMainColor, size: 35),
                    ),
                  ),
                ),

                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kSubTitleColor,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: kMainLightPinkColor,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
