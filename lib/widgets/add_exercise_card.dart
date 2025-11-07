import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class AddExerciseCard extends StatefulWidget {
  final String exerciseTitle;
  final String imageUrl;
  final int noOFMinuites;
  final void Function() toggleAddExercise;
  final void Function() toggleAddFavouriteExercise;
  final bool isAdded;
  final bool isFav;

  const AddExerciseCard({
    super.key,
    required this.exerciseTitle,
    required this.imageUrl,
    required this.noOFMinuites,
    required this.toggleAddExercise,
    required this.isAdded,
    required this.toggleAddFavouriteExercise,
    required this.isFav,
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
        color: kSubTitleColor.withOpacity(0.2),
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
                // ignore: deprecated_member_use
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
                    // ignore: deprecated_member_use
                    color: kSubTitleColor.withOpacity(0.5),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        widget.toggleAddExercise();
                      },
                      icon: Icon(
                        widget.isAdded ? Icons.remove : Icons.add,
                        color: kMainColor,
                        size: 35,
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kSubTitleColor.withOpacity(0.5),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        widget.toggleAddFavouriteExercise();
                      },
                      icon: Icon(
                        widget.isFav ? Icons.favorite : Icons.favorite_border,
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
